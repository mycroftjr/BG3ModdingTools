from pathlib import Path
from typing import List, Dict, TypeVar 
import argparse
import asyncio
import datetime
import os

from dataclasses import dataclass, field
from alive_progress import alive_bar

import common

PakType = TypeVar("PakType", bound="Pak")

all_groups:Dict[str,int] = {}

script_name = Path(__file__).stem
working_dir = Path.cwd()

default_data_path = os.environ.get("BG3_PATH", None)
default_divine_path = os.environ.get("LSLIB_PATH", None)
default_extract_path = working_dir.joinpath("/GameData_Extracted_{}".format(datetime.datetime.now().timestamp()))

if default_data_path:
    default_data_path = Path(default_data_path)
    if default_data_path.is_dir():
        if default_data_path.name != "Data":
            default_data_path = default_data_path.joinpath("Data")

if default_divine_path:
    default_divine_path = Path(default_divine_path)
    if default_divine_path.is_dir():
        default_divine_path = default_divine_path.joinpath("divine.exe")

def default_pak_groups()->List[str]:
    return ["All"]
@dataclass
class Pak:
    name:str
    full_path:Path = None
    groups:List[str] = field(default_factory=default_pak_groups)

    def with_groups(self, *args:List[str])->PakType:
        global all_groups
        for arg in args:
            if not all_groups.get(arg):
                all_groups[arg] = 0
            all_groups[arg] = all_groups[arg] + 1
            self.groups.append(arg)
        return self
class GameData:
    data_paks = [
        Pak("Assets.pak").with_groups("Assets"),
        Pak("Effects.pak").with_groups("Assets"),
        Pak("Engine.pak").with_groups("Core"),
        Pak("EngineShaders.pak").with_groups("Assets"),
        Pak("Game.pak").with_groups("Core"),
        Pak("GamePlatform.pak").with_groups("Assets", "Test"),
        Pak("Icons.pak").with_groups("Assets"),
        Pak("LowTex.pak").with_groups("Assets", "Textures"),
        Pak("Materials.pak").with_groups("Assets"),
        Pak("Minimaps.pak").with_groups("Assets"),
        Pak("Models.pak").with_groups("Assets", "Large"),
        Pak("SharedSoundBanks.pak").with_groups("Assets"),
        Pak("SharedSounds.pak").with_groups("Assets", "Large"),
        Pak("Textures.pak").with_groups("Assets", "Textures", "Large"),
        Pak("VirtualTextures.pak").with_groups("Assets", "Textures", "Large"),
        Pak("Localization\English_Animations.pak").with_groups("Localization", "Assets", "Large"),
        Pak("Localization\Voice.pak").with_groups("Localization", "Assets", "Large"),
        Pak("Shared.pak").with_groups("Core"),
        Pak("Gustav.pak").with_groups("Core"),
        Pak("Gustav_Textures.pak").with_groups("Assets", "Textures"),
        Pak("Gustav_Video.pak").with_groups("Assets", "Large"),
        Pak("Patch6_HF1.pak").with_groups("Core", "Patch"),
        Pak("Patch6_HF1Video.pak").with_groups("Assets"),
        Pak("Localization\English.pak").with_groups("Localization", "Core"),
    ]

    @staticmethod
    async def extract_pak(f:Path, divine:Path, output:Path)->bool:
        targs = [
            str(divine.absolute()),
            "-g bg3",
            f'-s "{f.absolute()}"',
            "-a extract-package",
            f'-d "{output.absolute()}"',
            "-i pak"
        ]
        cmd = " ".join(targs)
        proc = await asyncio.create_subprocess_shell(
            cmd,
            universal_newlines=False,
            stdout=asyncio.subprocess.PIPE,
            stderr=asyncio.subprocess.PIPE)

        stdout, stderr = await proc.communicate()

        encoding = "ISO-8859-1"
        if stdout:
            common.log(script_name, f'[divine]\n{common.trim(stdout.decode(encoding))}')
        if stderr:
            common.log(script_name, f'[divine]\n{common.trim(stderr.decode(encoding))}')
        common.log(script_name, f'[divine] exited with code [{proc.returncode}]')
        
        return proc.returncode == 0

    @staticmethod
    def get_targets(data_dir:Path, target_groups:List[str], ignore_groups:List[str])->List[PakType]:
        targets = []

        for pak in GameData.data_paks:
            pak.full_path = data_dir.joinpath(pak.name)
            for g in pak.groups:
                if g in target_groups and not g in ignore_groups and pak.full_path.exists():
                    targets.append(pak)
                    #print(f"Match: {pak.name} | {g} | {pak.groups}")
                    break
        
        return targets

all_groups["All"] = len(GameData.data_paks)

async def run():
    ## cli args here
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--input", type=Path, help="The Baldur's Gate 3 Data directory.", required=True)
    parser.add_argument("-d", "--divine", type=Path, help="The path to divine.exe.")
    parser.add_argument("-o", "--output", type=Path, default=default_extract_path, help="The output directory.")
    parser.add_argument("-g", "--groups", type=str, default="Core", help=f"Groups to include, separated with ;")
    parser.add_argument("-n", "--ignore", type=str, default="Large", help=f"Groups to ignore, separated with ;")
    parser.add_argument("-s", "--separate", action='store_true', help="If true, paks will be extracted into separate directories in the output directory, using the pak's name.")
    parser.add_argument("--configure", action='store_true', help="Store -i and -d as environmental variables %%BG3_PATH%% and %%LSLIB_PATH%%.")

    parser.description = "Extract BG3 game data paks in order to one folder, or individual folders."
    new_line = "\n    "
    parser.usage = f"""
    Extracting core paks with -i and -d properties:
    python extract_game_data.py -g Core -o "C:\Modding\BG3_Extracted" -i "C:\Games\Steam\steamapps\common\Baldurs Gate 3\Data" -d "C:\Modding\BG3\ConverterApp\divine.exe"

    Setting environment variables so -i and -d can be omitted:
    ===
    python extract_game_data.py --configure -i "C:\Games\Steam\steamapps\common\Baldurs Gate 3" -d "C:\Modding\BG3\ConverterApp"
    ===
    This will set the %%BG3_PATH%% and %%LSLIB_PATH%% variables so -i and -d no longer need to be specified.

    Extracting core paks (base and patches):
    ===
    python extract_game_data.py -g Core -o "C:\Modding\BG3_Extracted"
    ===

    Extracting everything:
    ===
    python extract_game_data.py -g All -o "C:\Modding\BG3_Extracted"
    ===

    Extracting everything but large paks:
    ===
    python extract_game_data.py -g All -n Large -o "C:\Modding\BG3_Extracted"
    ===

    Extracting multiple groups of paks (while ignoring Large):
    ===
    python extract_game_data.py -g Core;Assets;Localization -n Large -o "C:\Modding\BG3_Extracted"
    ===

    Pak group settings:
    ===
    {new_line.join([f'{x.name}: [{";".join(x.groups)}]' for x in GameData.data_paks])}
    ===
    """
    
    parser.epilog = f"Groups: {';'.join(sorted(all_groups.keys()))}"
    args = parser.parse_args()

    bg3_current = os.environ.get("BG3_PATH", None)
    if bg3_current is not None:
        bg3_current = Path(bg3_current)
    lslib_current = os.environ.get("LSLIB_PATH", None)
    if lslib_current is not None:
        lslib_current = Path(lslib_current)

    if args.configure:
        if args.input:
            if bg3_current is None or args.input.resolve() != bg3_current.resolve():
                data_dir:Path = args.input
                if data_dir.name == "Data" or data_dir.is_file():
                    data_dir = data_dir.parent
                try:
                    os.system(f"SETX BG3_PATH {str(data_dir.absolute())}")
                    common.log(script_name, f"Saved BG3_PATH to:\n{data_dir}", True)
                except Exception as e:
                    common.log(script_name, f"Error saving BG3_PATH:\n{e}", True)
            else:
                common.log(script_name, f"BG3_PATH already set to {args.input}. Skipping.", True)

        if args.divine:
            if args.divine.is_file():
                args.divine = args.divine.parent
            if lslib_current is None or args.divine.resolve() != lslib_current.resolve():
                divine_path:Path = args.divine
                if divine_path.is_file():
                    divine_path = divine_path.parent
                try:
                    os.system(f"SETX LSLIB_PATH {str(divine_path.absolute())}")
                    common.log(script_name, f"Saved LSLIB_PATH to:\n{divine_path}", True)
                except Exception as e:
                    common.log(script_name, f"Error saving LSLIB_PATH:\n{e}", True)
            else:
                common.log(script_name, f"LSLIB_PATH already set to {args.divine}. Skipping.", True)
        return
    
    args.input = args.input or default_data_path
    args.divine = args.divine or default_divine_path 

    if args.input is not None and args.output is not None and args.divine is not None:
        data_dir:Path = args.input
        output_dir:Path = args.output
        divine_path:Path = args.divine
        target_groups = str.split(args.groups, ";")
        ignore_groups = str.split(args.ignore, ";")

        if len(target_groups) == 0:
            parser.print_help()
            os.error("No pak groups specified.")
            return False

        if divine_path.is_dir():
            divine_path = divine_path.parent.joinpath("divine.exe")
            if not divine_path.exists():
                parser.print_help()
                os.error("Path to divine.exe is not set.")
                return False

        if not output_dir.exists():
            output_dir.mkdir(parents=True, exist_ok=True)
        common.log(script_name, f"Extracting game data to {output_dir}")
        successes = 0
        errors = 0

        pak_targets = GameData.get_targets(data_dir, target_groups, ignore_groups)
        total_paks = len(pak_targets)
        if total_paks == 0:
            os.error("No paks matched group settings, or no paks were found.")
            return False

        with alive_bar(total_paks, stats=False) as bar:
            async def process_pak(pak:PakType):
                nonlocal successes, errors, divine_path, output_dir, args
                common.log(script_name, f"Extracting {pak.full_path.name}...")
                bar.text(f"Extracting {pak.full_path.name}...")
                pak_output = Path(output_dir)
                if args.separate:
                    pak_output = pak_output.joinpath(pak.full_path.stem)
                if await GameData.extract_pak(pak.full_path, divine_path, pak_output):
                    successes = successes + 1
                else:
                    errors = errors + 1
                bar()

            # tasks = [process_pak(pak) for pak in pak_targets]
            # await asyncio.gather(*tasks)
            for pak in pak_targets:
                await process_pak(pak)
            total = successes + errors
            msg = f"Processed {total} paks. Successes({successes}) Errors({errors})"
            bar.text(msg)
            common.log(script_name, msg)
    else:
        parser.print_help()
    
def main():
    asyncio.run(run())
    
if __name__ == "__main__":
    main()