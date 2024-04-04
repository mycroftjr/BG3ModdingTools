local EventArity = {
	Activated = 1,
	ActorSpeakerIndexChanged = 4,
	AddedTo = 3,
	AllLoadedFlagsInPresetReceivedEvent = 0,
	AnimationEvent = 3,
	AppearTeleportFailed = 2,
	ApprovalRatingChangeAttempt = 5,
	ApprovalRatingChanged = 3,
	ArmedTrapUsed = 2,
	ArmorSetChanged = 2,
	AttachedToPartyGroup = 1,
	AttackedBy = 7,
	AttemptedDisarm = 4,
	AutomatedDialogEnded = 2,
	AutomatedDialogForceStopping = 2,
	AutomatedDialogRequestFailed = 2,
	AutomatedDialogStarted = 2,
	BackgroundGoalFailed = 2,
	BackgroundGoalRewarded = 2,
	BaseFactionChanged = 3,
	CameraReachedNode = 5,
	CanBeLootedCapabilityChanged = 2,
	CastSpell = 5,
	CastSpellFailed = 5,
	CastedSpell = 5,
	ChangeAppearanceCancelled = 1,
	ChangeAppearanceCompleted = 1,
	CharacterCreationFinished = 0,
	CharacterCreationStarted = 0,
	CharacterDisarmed = 3,
	CharacterJoinedParty = 1,
	CharacterLeftParty = 1,
	CharacterLoadedInPreset = 1,
	CharacterLootedCharacter = 2,
	CharacterMadePlayer = 1,
	CharacterMoveFailedUseJump = 1,
	CharacterMoveToAndTalkFailed = 4,
	CharacterMoveToAndTalkRequestDialog = 4,
	CharacterMoveToCancelled = 2,
	CharacterOnCrimeSensibleActionNotification = 10,
	CharacterPickpocketFailed = 2,
	CharacterPickpocketSuccess = 6,
	CharacterReservedUserIDChanged = 3,
	CharacterSelectedAsBestUnavailableFallbackLead = 4,
	CharacterSelectedClimbOn = 1,
	CharacterSelectedForUser = 2,
	CharacterStoleItem = 10,
	CharacterTagEvent = 3,
	Closed = 1,
	CombatEnded = 1,
	CombatPaused = 1,
	CombatResumed = 1,
	CombatRoundStarted = 2,
	CombatStarted = 1,
	Combined = 7,
	CompanionSelectedForUser = 2,
	CreditsEnded = 0,
	CrimeDisabled = 2,
	CrimeEnabled = 2,
	CrimeIsRegistered = 8,
	CrimeProcessingStarted = 2,
	CriticalHitBy = 4,
	CustomBookUIClosed = 2,
	DLCUpdated = 3,
	Deactivated = 1,
	DeathSaveStable = 1,
	DestroyedBy = 4,
	DestroyingBy = 4,
	DetachedFromPartyGroup = 1,
	DialogActorJoinFailed = 3,
	DialogActorJoined = 4,
	DialogActorLeft = 4,
	DialogAttackRequested = 2,
	DialogEnded = 2,
	DialogForceStopping = 2,
	DialogRequestFailed = 2,
	DialogRollResult = 5,
	DialogStartRequested = 2,
	DialogStarted = 2,
	DialogueCapabilityChanged = 2,
	Died = 1,
	DifficultyChanged = 1,
	DisappearOutOfSightToCancelled = 2,
	DoorTemplateClosing = 3,
	DownedChanged = 2,
	DroppedBy = 2,
	DualEntityEvent = 3,
	Dying = 1,
	EndTheDayRequested = 1,
	EnterCombatFailed = 2,
	EnteredChasm = 6,
	EnteredCombat = 2,
	EnteredForceTurnBased = 1,
	EnteredLevel = 3,
	EnteredSharedForceTurnBased = 2,
	EnteredTrigger = 2,
	EntityEvent = 2,
	EquipFailed = 2,
	Equipped = 2,
	EscortGroupLeaderChanged = 3,
	FailedToLoadItemInPreset = 4,
	Falling = 2,
	Fell = 2,
	FlagCleared = 3,
	FlagLoadedInPresetEvent = 2,
	FlagSet = 3,
	FleeFromCombat = 2,
	FollowerCantUseItem = 1,
	ForceDismissCompanion = 1,
	ForceMoveEnded = 3,
	ForceMoveStarted = 3,
	GainedControl = 1,
	GameBookInterfaceClosed = 2,
	GameModeStarted = 3,
	GameOption = 2,
	GoldChanged = 2,
	GotUp = 1,
	HappyWithDeal = 4,
	HenchmanAborted = 1,
	HenchmanSelected = 2,
	HitProxy = 5,
	HitpointsChanged = 2,
	InstanceDialogChanged = 4,
	InteractionCapabilityChanged = 2,
	InteractionFallback = 2,
	InventoryBoundChanged = 2,
	InventorySharingChanged = 2,
	ItemEnteredTrigger = 3,
	ItemLeftTrigger = 3,
	ItemTeleported = 7,
	KilledBy = 4,
	LearnedSpell = 2,
	LeftCombat = 2,
	LeftForceTurnBased = 1,
	LeftLevel = 2,
	LeftTrigger = 2,
	LevelGameplayStarted = 2,
	LevelLoaded = 1,
	LevelTemplateLoaded = 1,
	LevelUnloading = 1,
	LeveledUp = 1,
	LongRestCancelled = 0,
	LongRestFinished = 0,
	LongRestStartFailed = 0,
	LongRestStarted = 0,
	LostSightOf = 2,
	MainPerformerStarted = 2,
	MessageBoxChoiceClosed = 3,
	MessageBoxClosed = 2,
	MessageBoxYesNoClosed = 3,
	MissedBy = 4,
	ModuleLoadedinSavegame = 5,
	MoveCapabilityChanged = 2,
	Moved = 1,
	MovedBy = 2,
	MovedFromTo = 4,
	MovieFinished = 1,
	MoviePlaylistFinished = 1,
	NestedDialogPlayed = 2,
	ObjectAvailableLevelChanged = 3,
	ObjectTimerFinished = 2,
	ObjectTransformed = 2,
	ObscuredStateChanged = 2,
	OnCrimeConfrontationDone = 7,
	OnCrimeInvestigatorSwitchedState = 4,
	OnCrimeMergedWith = 2,
	OnCrimeRemoved = 6,
	OnCrimeResetInterrogationForCriminal = 2,
	OnCrimeResolved = 6,
	OnCriminalMergedWithCrime = 2,
	OnShutdown = 1,
	OnStartCarrying = 7,
	OnStoryOverride = 1,
	OnThrown = 7,
	Opened = 1,
	PartyPresetLoaded = 2,
	PickupFailed = 2,
	PingRequested = 1,
	PlatformDestroyed = 1,
	PlatformMovementCanceled = 2,
	PlatformMovementFinished = 2,
	PreMovedBy = 2,
	PuzzleUIClosed = 3,
	PuzzleUIUsed = 5,
	QuestAccepted = 2,
	QuestClosed = 1,
	QuestUpdateUnlocked = 3,
	QueuePurged = 1,
	RandomCastProcessed = 5,
	ReactionInterruptActionNeeded = 1,
	ReactionInterruptAdded = 2,
	ReactionInterruptUsed = 3,
	ReadyCheckFailed = 1,
	ReadyCheckPassed = 1,
	RelationChanged = 4,
	RemovedFrom = 2,
	ReposeAdded = 2,
	ReposeRemoved = 2,
	RequestCanCombine = 7,
	RequestCanDisarmTrap = 3,
	RequestCanLockpick = 3,
	RequestCanLoot = 2,
	RequestCanMove = 3,
	RequestCanPickup = 3,
	RequestCanUse = 3,
	RequestEndTheDayFail = 0,
	RequestEndTheDaySuccess = 0,
	RequestGatherAtCampFail = 1,
	RequestGatherAtCampSuccess = 1,
	RequestPickpocket = 2,
	RequestTrade = 4,
	RespecCancelled = 1,
	RespecCompleted = 1,
	Resurrected = 1,
	RollResult = 6,
	RulesetModifierChangedBool = 3,
	RulesetModifierChangedFloat = 3,
	RulesetModifierChangedInt = 3,
	RulesetModifierChangedString = 3,
	SafeRomanceOptionChanged = 2,
	SavegameLoadStarted = 0,
	SavegameLoaded = 0,
	Saw = 3,
	ScatteredAt = 4,
	ScreenFadeCleared = 2,
	ScreenFadeDone = 2,
	ShapeshiftChanged = 4,
	ShapeshiftedHitpointsChanged = 2,
	ShareInitiative = 1,
	ShortRestCapable = 2,
	ShortRestProcessing = 1,
	ShortRested = 1,
	StackedWith = 2,
	StartAttack = 4,
	StartAttackPosition = 6,
	StartedDisarmingTrap = 2,
	StartedFleeing = 1,
	StartedLockpicking = 2,
	StartedPreviewingSpell = 4,
	StatusApplied = 4,
	StatusAttempt = 4,
	StatusAttemptFailed = 4,
	StatusRemoved = 4,
	StatusTagCleared = 5,
	StatusTagSet = 5,
	StoppedCombining = 6,
	StoppedDisarmingTrap = 2,
	StoppedLockpicking = 2,
	StoppedSneaking = 1,
	SubQuestUpdateUnlocked = 3,
	SupplyTemplateSpent = 2,
	SwarmAIGroupJoined = 2,
	SwarmAIGroupLeft = 2,
	SwitchedCombat = 3,
	TadpolePowerAssigned = 2,
	TagCleared = 2,
	TagEvent = 2,
	TagSet = 2,
	TeleportToFleeWaypoint = 2,
	TeleportToFromCamp = 1,
	TeleportToWaypoint = 2,
	Teleported = 9,
	TeleportedFromCamp = 1,
	TeleportedToCamp = 1,
	TemplateAddedTo = 4,
	TemplateDestroyedBy = 5,
	TemplateEnteredTrigger = 5,
	TemplateEquipped = 2,
	TemplateKilledBy = 5,
	TemplateLeftTrigger = 5,
	TemplateOpening = 3,
	TemplateRemovedFrom = 3,
	TemplateUnequipped = 2,
	TemplateUseFinished = 4,
	TemplateUseStarted = 3,
	TemplatesCombined = 7,
	TemporaryHostileRelationRemoved = 3,
	TemporaryHostileRelationRequestHandled = 3,
	TextEvent = 1,
	TimelineScreenFadeStarted = 3,
	TimerFinished = 1,
	TradeEnds = 2,
	TradeGenerationEnded = 1,
	TradeGenerationStarted = 1,
	TurnEnded = 1,
	TurnStarted = 1,
	TutorialBoxClosed = 2,
	TutorialClosed = 2,
	TutorialEvent = 2,
	UnequipFailed = 2,
	Unequipped = 2,
	Unlocked = 3,
	UnlockedRecipe = 2,
	UseFinished = 3,
	UseStarted = 2,
	UserAvatarCreated = 3,
	UserCampChestChanged = 2,
	UserCharacterLongRested = 2,
	UserConnected = 3,
	UserDisconnected = 3,
	UserEvent = 2,
	UserMakeWar = 3,
	UsingSpell = 5,
	UsingSpellAtPosition = 8,
	UsingSpellInTrigger = 6,
	UsingSpellOnTarget = 6,
	UsingSpellOnZoneWithTarget = 6,
	VoiceBarkEnded = 2,
	VoiceBarkFailed = 1,
	VoiceBarkStarted = 2,
	WentOnStage = 2,
}