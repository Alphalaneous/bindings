[[link(android)]]
class AccountHelpLayer : GJDropDownLayer, GJAccountDelegate, FLAlertLayerProtocol {
    // virtual ~AccountHelpLayer();

    static AccountHelpLayer* create();

    void doUnlink();
    void exitLayer();
    void onAccountManagement(cocos2d::CCObject* sender);
    void onReLogin(cocos2d::CCObject* sender);
    void onUnlink(cocos2d::CCObject* sender);
    void updatePage();
    void verifyUnlink();

    virtual void customSetup() = win 0x7f5c0;
    virtual void layerHidden() = imac 0xcf110;
    virtual TodoReturn accountStatusChanged() = win 0x7fcc0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x7ffa0, imac 0xcf000;

    cocos2d::CCLabelBMFont* m_loginStatusLabel;
    TextArea* m_textArea;
    CCMenuItemSpriteExtra* m_refreshLoginButton;
    CCMenuItemSpriteExtra* m_unlinkAccountButton;
    bool m_unk290;
}

[[link(android)]]
class AccountLayer : GJDropDownLayer, GJAccountDelegate, GJAccountBackupDelegate, GJAccountSyncDelegate, FLAlertLayerProtocol {
    // virtual ~AccountLayer();
    // AccountLayer();

    static AccountLayer* create() = win 0x7d560;

    TodoReturn createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint);
    void doBackup();
    // void doBackup() {
    // 	this->updatePage(false);
    // 	if (!GJAccountManager::sharedState()->getAccountBackupURL()) this->backupAccountFailed((BackupAccountError)-1, 0);
    // 	else this->showLoadingUI();
    // }
    void doSync();
    // void doSync() {
    // 	this->updatePage(false);
    // 	if (!GJAccountManager::sharedState()->getAccountSyncURL()) this->syncAccountFailed((BackupAccountError)-1, 0);
    // 	else this->showLoadingUI();
    // }
    void exitLayer() {
    	this->setKeypadEnabled(false);
    	this->disableUI();
    	this->hideLayer(m_fastMenu);
    }
    void hideLoadingUI() {
    	this->toggleUI(true);
    	m_loadingCircle->setVisible(false);
    }
    void onBackup(cocos2d::CCObject* sender);
    void onHelp(cocos2d::CCObject* sender);
    void onLogin(cocos2d::CCObject* sender);
    void onMore(cocos2d::CCObject* sender);
    void onRegister(cocos2d::CCObject* sender) = win 0x7de50;
    void onSync(cocos2d::CCObject* sender);
    void showLoadingUI() {
    	this->toggleUI(false);
    	m_loadingCircle->setVisible(true);
    }
    void toggleUI(bool enable) {
    	m_buttonMenu->setEnabled(enable);
    	this->setKeypadEnabled(enable);
    }
    void updatePage(bool) = win 0x7e760;

    virtual void customSetup() = win 0x7d6c0;
    virtual void layerHidden() = win 0x7f450, imac 0xcde20;
    virtual void backupAccountFinished() = win 0x7eb30, imac 0xcd330;
    virtual void backupAccountFailed(BackupAccountError, int) = win 0x7ece0, imac 0xcd4f0;
    virtual void syncAccountFinished() = win 0x7eff0, imac 0xcd8d0;
    virtual void syncAccountFailed(BackupAccountError, int) = win 0x7f1b0;
    virtual TodoReturn accountStatusChanged() = win 0x7e750;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x7f340, imac 0xcdd00;

    cocos2d::CCLabelBMFont* m_linkedAccountTitle;
    TextArea* m_textArea;
    CCMenuItemSpriteExtra* m_loginButton;
    CCMenuItemSpriteExtra* m_registerButton;
    CCMenuItemSpriteExtra* m_backupButton;
    CCMenuItemSpriteExtra* m_syncButton;
    CCMenuItemSpriteExtra* m_helpButton;
    CCMenuItemSpriteExtra* m_moreButton;
    LoadingCircle* m_loadingCircle;
    int m_accountHelpRelated;
    bool m_isLoggedIn;
}

[[link(android)]]
class AccountLoginLayer : FLAlertLayer, TextInputDelegate, GJAccountLoginDelegate, FLAlertLayerProtocol {
    // virtual ~AccountLoginLayer();

    static AccountLoginLayer* create(gd::string) = win 0x7b730;

    TodoReturn createTextBackground(cocos2d::CCPoint, char const*, cocos2d::CCSize);
    TodoReturn createTextInput(cocos2d::CCPoint, cocos2d::CCSize, char const*, int);
    TodoReturn createTextLabel(cocos2d::CCPoint, char const*, cocos2d::CCSize);
    void disableNodes();
    void hideLoadingUI();
    bool init(gd::string) = win 0x7b8d0;
    void onClose(cocos2d::CCObject* sender);
    void onForgotPassword(cocos2d::CCObject* sender);
    void onForgotUser(cocos2d::CCObject* sender);
    void onSubmit(cocos2d::CCObject* sender) = win 0x7cbc0;
    void resetLabel(int);
    void resetLabels();
    void showLoadingUI();
    void toggleUI(bool);
    void updateLabel(AccountError);

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x7cfa0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x7cb50, imac 0x486bd0;
    virtual void textInputOpened(CCTextInputNode*) {}
    virtual void textInputClosed(CCTextInputNode*) = win 0x7d070;
    virtual void textChanged(CCTextInputNode*) {}
    virtual TodoReturn loginAccountFinished(int, int) = win 0x7c740;
    virtual TodoReturn loginAccountFailed(AccountError) = win 0x7c990, imac 0x4868a0;

    CCTextInputNode* m_usernameInput;
    CCTextInputNode* m_passwordInput;
    cocos2d::CCLabelBMFont* m_usernameLabel;
    cocos2d::CCLabelBMFont* m_passwordLabel;
    LoadingCircle* m_loadingCircle;
    gd::string m_username;
    gd::string m_password;
}

[[link(android)]]
class AccountRegisterLayer : FLAlertLayer, TextInputDelegate, GJAccountRegisterDelegate, FLAlertLayerProtocol {
    // virtual ~AccountRegisterLayer();

    static AccountRegisterLayer* create();

    cocos2d::extension::CCScale9Sprite* createTextBackground(cocos2d::CCPoint, cocos2d::CCSize);
    CCTextInputNode* createTextInput(cocos2d::CCPoint, cocos2d::CCSize, gd::string, int);
    cocos2d::CCLabelBMFont* createTextLabel(cocos2d::CCPoint, gd::string, cocos2d::CCSize);
    void disableNodes();
    void hideLoadingUI();
    void onClose(cocos2d::CCObject* sender);
    void onSubmit(cocos2d::CCObject* sender);
    void resetLabel(int) = imac 0x483b70;
    void resetLabels() = imac 0x483a50;
    void showLoadingUI();
    void toggleUI(bool);
    void updateLabel(AccountError);
    bool validEmail(gd::string);
    bool validPassword(gd::string);
    bool validUser(gd::string);

    virtual bool init() = imac 0x4817b0;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x7abf0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x7a200, imac 0x483c60;
    virtual void textInputOpened(CCTextInputNode*) {}
    virtual void textInputClosed(CCTextInputNode*) = win 0x7ad50, imac 0x374f10;
    virtual void textChanged(CCTextInputNode*) {}
    virtual void textInputShouldOffset(CCTextInputNode*, float);
    virtual void textInputReturn(CCTextInputNode*);
    virtual bool allowTextInput(CCTextInputNode*) = win 0x7b670, imac 0x484da0;
    virtual TodoReturn registerAccountFinished() = win 0x79c90, imac 0x4834b0;
    virtual TodoReturn registerAccountFailed(AccountError) = win 0x79eb0, imac 0x483660;

    CCTextInputNode* m_usernameField;
    CCTextInputNode* m_passwordField;
    CCTextInputNode* m_confirmPasswordField;
    CCTextInputNode* m_emailField;
    CCTextInputNode* m_verifyEmailField;
    cocos2d::CCLabelBMFont* m_usernameLabel;
    cocos2d::CCLabelBMFont* m_passwordLabel;
    cocos2d::CCLabelBMFont* m_confirmPasswordLabel;
    cocos2d::CCLabelBMFont* m_emailLabel;
    cocos2d::CCLabelBMFont* m_verifyEmailLabel;
    LoadingCircle* m_loadingCircle;
    bool m_lockInput;
}

[[link(android)]]
class AchievementBar : cocos2d::CCNodeRGBA {
    // virtual ~AchievementBar();

    AchievementBar(unsigned int idk) = win 0x80620;

    static AchievementBar* create(char const* title, char const* desc, char const* icon, bool quest);

    bool init(char const* title, char const* desc, char const* icon, bool quest) = win 0x80670;
    void show() = win 0x81c20;

    virtual void setOpacity(unsigned char) = win 0x81ea0, imac 0x602210;

    cocos2d::CCLayerColor* m_layerColor;
    int m_unkUnused;
    cocos2d::CCScene* m_nextScene;
    cocos2d::extension::CCScale9Sprite* m_bg;
    cocos2d::extension::CCScale9Sprite* m_bg2;
    cocos2d::CCSprite* m_achievementGlowSprite;
    cocos2d::CCSprite* m_achievementSprite;
    cocos2d::CCLabelBMFont* m_titleLabel;
    TextArea* m_achievementDescription;
}

[[link(android)]]
class AchievementCell : TableViewCell {
    // virtual ~AchievementCell();
    AchievementCell(char const*, float, float);

    void loadFromDict(cocos2d::CCDictionary*) = win 0xac150;
    void updateBGColor(int);

    virtual bool init();
    virtual void draw();
}

[[link(android)]]
class AchievementManager : cocos2d::CCNode {
    // virtual ~AchievementManager();

    static AchievementManager* sharedState() = win 0x7da0, imac 0x714a80;

    gd::string achievementForUnlock(int, UnlockType) = win 0x3a1c0, imac 0x76e370;
    void addAchievement(gd::string, gd::string, gd::string, gd::string, gd::string, int) = win 0x7ef0;
    void addManualAchievements() = win 0x8410;
    TodoReturn areAchievementsEarned(cocos2d::CCArray*);
    TodoReturn checkAchFromUnlock(char const*);
    void dataLoaded(DS_Dictionary*) = imac 0x76de30;
    void encodeDataTo(DS_Dictionary*) = imac 0x76dea0;
    void firstSetup();
    TodoReturn getAchievementRewardDict();
    cocos2d::CCDictionary* getAchievementsWithID(char const*);
    TodoReturn getAllAchievements();
    cocos2d::CCArray* getAllAchievementsSorted(bool);
    bool isAchievementAvailable(gd::string);
    bool isAchievementEarned(char const* ach) = win 0x39a70, imac 0x76e010;
    int limitForAchievement(gd::string id) {
    	if (auto achievements = getAchievementsWithID(id.c_str())) {
    		if (auto limits = static_cast<cocos2d::CCString*>(achievements->objectForKey("limits"))) return limits->intValue();
    	}
    	return 0;
    }
    TodoReturn notifyAchievement(char const*, char const*, char const*);
    TodoReturn notifyAchievementWithID(char const*);
    TodoReturn percentageForCount(int, int);
    int percentForAchievement(char const*) = win 0x39a90;
    void reportAchievementWithID(char const*, int, bool);
    void reportPlatformAchievementWithID(char const*, int);
    void resetAchievement(char const*);
    TodoReturn resetAchievements();
    TodoReturn setup();
    void storeAchievementUnlocks();

    virtual bool init() = win 0x7e60;

    cocos2d::CCArray* m_allAchievements;
    cocos2d::CCDictionary* m_platformAchievements;
    cocos2d::CCDictionary* m_achievementUnlocks;
    void* m_unkPtrUnused;
    cocos2d::CCDictionary* m_reportedAchievements;
    bool m_dontNotify;
    cocos2d::CCArray* m_allAchievementsSorted;
    int m_order;
    cocos2d::CCDictionary* m_unAchieved;
}

[[link(android)]]
class AchievementNotifier : cocos2d::CCNode {
    // virtual ~AchievementNotifier();

    static AchievementNotifier* sharedState() = win 0x3ab20;

    void achievementDisplayFinished();
    void notifyAchievement(char const* title, char const* desc, char const* icon, bool quest) = win 0x3ac00, imac 0x7ac850;
    void showNextAchievement() = win 0x3ace0;
    void willSwitchToScene(cocos2d::CCScene* scene) {
    	this->m_nextScene = scene;

    	if (this->m_activeAchievementBar && this->m_activeAchievementBar->getParent() != this->m_nextScene)
    	{
    		this->m_activeAchievementBar->retain();
    		this->m_activeAchievementBar->removeFromParentAndCleanup(false);
    		this->m_nextScene->addChild(this->m_activeAchievementBar, 105);
    		this->m_activeAchievementBar->release();
    		this->m_activeAchievementBar->resumeSchedulerAndActions();
    	}
    }

    virtual bool init();

    cocos2d::CCScene* m_nextScene;
    cocos2d::CCArray* m_achievementBarArray;
    AchievementBar* m_activeAchievementBar;
}

[[link(android)]]
class AchievementsLayer : GJDropDownLayer {
    // virtual ~AchievementsLayer();
    	AchievementsLayer() {
    	m_currentPage = 0;
    	m_nextPageButton = nullptr;
    	m_prevPageButton = nullptr;
    	m_pageLabel = nullptr;
    	m_unkPoint = cocos2d::CCPoint { 0.f, 0.f };
    }

    static AchievementsLayer* create() {
    	auto ret = new AchievementsLayer();
    	if (ret->init("Achievements")) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void loadPage(int) = win 0x82300;
    void onNextPage(cocos2d::CCObject* sender) = win 0x824e0;
    void onPrevPage(cocos2d::CCObject* sender);
    void setupLevelBrowser(cocos2d::CCArray* arr) {
    	m_listLayer->removeChildByTag(9, true);
    	auto* listView = CustomListView::create(arr, BoomListType::Default, 220.f, 356.f);
    	listView->setTag(9);
    	m_listLayer->addChild(listView, 6);
    }
    void setupPageInfo(int, int, int);

    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x82260, imac 0x35f870;
    virtual void customSetup() = win 0x81fb0;

    int m_currentPage;
    CCMenuItemSpriteExtra* m_nextPageButton;
    CCMenuItemSpriteExtra* m_prevPageButton;
    cocos2d::CCLabelBMFont* m_pageLabel;
    cocos2d::CCPoint m_unkPoint;
}

[[link(android)]]
class AdToolbox {
    TodoReturn cacheInterstitial();
    TodoReturn cacheRewardedVideo();
    TodoReturn disableBanner();
    TodoReturn enableBanner();
    TodoReturn enableBannerNoRefresh();
    TodoReturn hasCachedInterstitial();
    TodoReturn hasCachedRewardedVideo();
    bool isShowingAd();
    void queueRefreshBanner();
    void setupAds();
    void showDebug();
    void showInterstitial();
    void showRewardedVideo();
}

[[link(android)]]
class AdvancedFollowEditObject : AdvancedFollowTriggerObject {
    // virtual ~AdvancedFollowEditObject();

    static AdvancedFollowEditObject* create(char const*);

    bool init(char const*);

    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = imac 0x19d170;
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class AdvancedFollowTriggerObject : EffectGameObject {
    // virtual ~AdvancedFollowTriggerObject();
    // AdvancedFollowTriggerObject();

    static AdvancedFollowTriggerObject* create(char const*);

    int getAdvancedFollowID();
    bool init(char const*);

    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = imac 0x19aed0;
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class AdvFollowSetup {
    // ~AdvFollowSetup();
}

[[link(android)]]
class AnimatedGameObject : EnhancedGameObject, AnimatedSpriteDelegate, SpritePartDelegate {
    // virtual ~AnimatedGameObject();

    static AnimatedGameObject* create(int);

    TodoReturn animationForID(int, int);
    TodoReturn getTweenTime(int, int);
    bool init(int);
    TodoReturn playAnimation(int);
    TodoReturn setupAnimatedSize(int);
    TodoReturn setupChildSprites();
    TodoReturn updateChildSpriteColor(cocos2d::ccColor3B);
    TodoReturn updateObjectAnimation();

    virtual void setOpacity(unsigned char);
    virtual void setChildColor(cocos2d::ccColor3B const&);
    virtual void resetObject() = imac 0x1a7960;
    virtual void activateObject();
    virtual void deactivateObject(bool);
    virtual void setObjectColor(cocos2d::ccColor3B const&);
    virtual void animationFinished(char const*) = win 0x48b570, imac 0x1a5ec0;
    virtual TodoReturn displayFrameChanged(cocos2d::CCObject*, gd::string) = win 0x48c850;
}

[[link(android)]]
class AnimatedShopKeeper : CCAnimatedSprite {
    // virtual ~AnimatedShopKeeper();
    AnimatedShopKeeper() {
    	m_type = ShopType::Normal;
    	m_idleInt1 = 0;
    	m_idleInt2 = 0;
    	m_looking = false;
    	m_reacting = false;
    	m_reactCount = 0;
    	m_gruntIndex = 0;
    }

    static AnimatedShopKeeper* create(ShopType type) {
    	auto ret = new AnimatedShopKeeper();
    	if (ret->init(type)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(ShopType type) {
    	m_type = type;
    	auto shopkeeper = "GJShopKeeper";
    	switch (type) {
    		case ShopType::Secret: shopkeeper = "GJShopKeeper2"; break;
    		case ShopType::Community: shopkeeper = "GJShopKeeper3"; break;
    		case ShopType::Mechanic: shopkeeper = "GJShopKeeper4"; break;
    		case ShopType::Diamond: shopkeeper = "GJShopKeeper5"; break;
    		default: shopkeeper = "GJShopKeeper"; break;
    	}
    	if (!CCAnimatedSprite::initWithType(shopkeeper, nullptr, false)) return false;
    	m_idleInt2 = (rand() / 32767.f) * 5.f + 10.f;
    	m_idleInt1 = (rand() / 32767.f) * 2.f + 1.f;
    	m_animationManager->stopAnimations();
    	return true;
    }
    void playReactAnimation() = win 0x2a8400;
    void startAnimating() = win 0x2a8690, imac 0x30fba0;

    virtual void animationFinished(char const*) = win 0x2a8720;

    ShopType m_type;
    int m_idleInt1;
    int m_idleInt2;
    bool m_looking;
    bool m_reacting;
    int m_reactCount;
    int m_gruntIndex;
}

[[link(android)]]
class AnimatedSpriteDelegate {
    virtual void animationFinished(char const*);
}

[[link(android)]]
class AppDelegate : cocos2d::CCApplication, cocos2d::CCSceneDelegate {
    // virtual ~AppDelegate() = ios 0x1b7c90;
    static AppDelegate* get() {
        	return static_cast<AppDelegate*>(cocos2d::CCApplication::sharedApplication());
    	}

    float bgScale();
    TodoReturn checkSound();
    TodoReturn hideLoadingCircle();
    TodoReturn loadingIsFinished();
    bool musicTest() = win 0x83370;
    void pauseGame() = win 0x82ff0;
    void pauseSound() = win 0x830d0;
    void platformShutdown() = win 0x82560;
    void resumeSound() = win 0x83270;
    void setIdleTimerDisabled(bool);
    void setupGLView() = win 0x82580;
    void showLoadingCircle(bool, bool, bool);

    virtual bool applicationDidFinishLaunching() = win 0x829f0, imac 0x645220;
    virtual void applicationDidEnterBackground() = win 0x82da0;
    virtual void applicationWillEnterForeground() = win 0x82e20;
    virtual void applicationWillBecomeActive();
    virtual void applicationWillResignActive();
    virtual void trySaveGame(bool) = win 0x834b0, imac 0x6458b0;
    virtual void willSwitchToScene(cocos2d::CCScene*) = win 0x83590;

    PAD = win 0x4, android32 0xc, android64 0x18;
    cocos2d::CCScene* m_runningScene;
}

[[link(android)]]
class ArtistCell : TableViewCell {
    // virtual ~ArtistCell();
    ArtistCell(char const*, float, float);

    void loadFromObject(SongInfoObject*) = win 0xb4e90;
    void onNewgrounds(cocos2d::CCObject* sender);
    void onYouTube(cocos2d::CCObject* sender);
    void updateBGColor(int);

    virtual bool init();
    virtual void draw();

    SongInfoObject* m_songInfo;
}

[[link(android)]]
class AudioAssetsBrowser : FLAlertLayer, TableViewCellDelegate, MusicDownloadDelegate {
    // virtual ~AudioAssetsBrowser();

    static AudioAssetsBrowser* create(gd::vector<int>& songIds, gd::vector<int>& sfxIds);

    bool init(gd::vector<int>& songIds, gd::vector<int>& sfxIds);
    void onClose(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender);
    void onPage(cocos2d::CCObject* sender);
    TodoReturn setupList();
    TodoReturn trySetupAudioBrowser();
    TodoReturn updatePageLabel();

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void musicActionFinished(GJMusicAction);
    virtual void musicActionFailed(GJMusicAction);
    virtual bool cellPerformedAction(TableViewCell*, int, CellAction, cocos2d::CCNode*);
    virtual int getSelectedCellIdx();
    virtual TodoReturn getCellDelegateType();

    cocos2d::CCArray* m_songInfoObjects;
    GJCommentListLayer* m_songList;
    cocos2d::CCLabelBMFont* m_pageIndicatorLabel;
    gd::vector<int> m_songsIds;
    gd::vector<int> m_sfxIds;
    LoadingCircleSprite* m_loadingCircle;
}

[[link(android)]]
class ArtTriggerGameObject : EffectGameObject {
    // virtual ~ArtTriggerGameObject();

    static ArtTriggerGameObject* create(char const*);

    bool init(char const*);

    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = imac 0x1db0e0;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class AudioEffectsLayer : cocos2d::CCLayerColor {
    // virtual ~AudioEffectsLayer();

    static AudioEffectsLayer* create(gd::string);

    void audioStep(float) = win 0x84d80, imac 0x49bcd0;
    TodoReturn getBGSquare();
    TodoReturn goingDown();
    bool init(gd::string);
    void resetAudioVars() = imac 0x49bc70;
    TodoReturn triggerEffect(float) = imac 0x49bda0;

    virtual void draw() {}
    virtual void updateTweenAction(float, char const*) = imac 0x49bee0;

    cocos2d::CCSpriteBatchNode* m_batchNode;
    cocos2d::CCArray* m_unk1bc;
    cocos2d::CCArray* m_unk1c0;
    float m_unk1c4;
    float m_unk1c8;
    bool m_goingDown;
    float m_notAudioScale;
    bool m_unk1d4;
}

[[link(android)]]
class AudioLineGuideGameObject : EffectGameObject {
    // virtual ~AudioLineGuideGameObject();

    static AudioLineGuideGameObject* create();

    virtual bool init();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class BitmapFontCache : cocos2d::CCObject {
    // virtual ~BitmapFontCache();
    BitmapFontCache() {}

    static BitmapFontCache* sharedFontCache() {
    	auto** instancePtr = reinterpret_cast<BitmapFontCache**>(geode::base::get() + 0x687db0);
    	if (!*instancePtr) {
    		*instancePtr = new BitmapFontCache();
    		(*instancePtr)->init();
    	}
    	return *instancePtr;
    }

    FontObject* fontWithConfigFile(char const*, float) = win 0x3b380;
    bool init() {
    	m_cache = cocos2d::CCDictionary::create();
    	m_cache->retain();
    	return true;
    }
    static void purgeSharedFontCache() {
    	auto** instancePtr = reinterpret_cast<BitmapFontCache**>(geode::base::get() + 0x687db0);
    	if (*instancePtr) {
    		(*instancePtr)->release();
    		*instancePtr = nullptr;
    	}
    }

    cocos2d::CCDictionary* m_cache;
}

[[link(android)]]
class BonusDropdown : cocos2d::CCNode {
    // virtual ~BonusDropdown();

    static BonusDropdown* create(gd::string, int);

    bool init(gd::string, int);
    void show();

    cocos2d::CCLayerColor* m_layerColor;
    float m_unk10c;
    cocos2d::CCScene* m_scene;
}

[[link(android)]]
class BoomListLayer : cocos2d::CCLayerColor {
    // virtual ~BoomListLayer();

    static BoomListLayer* create(BoomListView*, char const*);

    bool init(BoomListView*, char const*);
}

[[link(android)]]
class BoomListView : cocos2d::CCLayer, TableViewDelegate, TableViewDataSource {
    BoomListView() {}
    	~BoomListView() {
    	CC_SAFE_RELEASE(m_entries);
    }

    static BoomListView* create(cocos2d::CCArray*, TableViewCellDelegate*, float, float, int, BoomListType, float) = imac 0x2f7f10;

    TodoReturn addObjectToList(cocos2d::CCNode*);
    bool init(cocos2d::CCArray*, TableViewCellDelegate*, float, float, int, BoomListType, float) = win 0x3bfe0, imac 0x2f8040;
    void lockList(bool) = imac 0x2f81f0;

    bool init(cocos2d::CCArray* entries, BoomListType type, float width, float height) {
    	return this->init(entries, nullptr, height, width, 0, type, 0.0f);
    }

    virtual void draw() {}
    virtual void setupList(float) = win 0x3c350, imac 0x2f8270;
    virtual void TableViewWillDisplayCellForRowAtIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual float cellHeightForRowAtIndexPath(CCIndexPath&, TableView*) = win 0x3c3e0;
    virtual void didSelectRowAtIndexPath(CCIndexPath&, TableView*) {}
    virtual int numberOfRowsInSection(unsigned int, TableView*) = win 0x3c3f0;
    virtual unsigned int numberOfSectionsInTableView(TableView*) { return 1; }
    virtual TableViewCell* cellForRowAtIndexPath(CCIndexPath&, TableView*) = win 0x3c410, imac 0x2f83e0;
    virtual void TableViewCommitCellEditingStyleForRowAtIndexPath(TableView*, TableViewCellEditingStyle, CCIndexPath&) {}
    virtual void TableViewWillReloadCellForRowAtIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual TableViewCell* getListCell(char const*) = win 0x3c4a0, imac 0x2f84f0;
    virtual void loadCell(TableViewCell*, int) = win 0x3c610, imac 0x2f8730;

    TableView* m_tableView;
    cocos2d::CCArray* m_entries;
    BoomListType m_type;
    float m_height;
    float m_width;
    float m_itemSeparation;
    int m_currentPage;
    bool m_locked;
}

[[link(android)]]
class BoomScrollLayer : cocos2d::CCLayer {
    // virtual ~BoomScrollLayer();
    BoomScrollLayer();

    static BoomScrollLayer* create(cocos2d::CCArray* pages, int unk1, bool unk2, cocos2d::CCArray* unk3, DynamicScrollDelegate* delegate) = win 0x3d060, imac 0x390e50;
    static BoomScrollLayer* create(cocos2d::CCArray* pages, int unk1, bool unk2) {
    	return BoomScrollLayer::create(pages, unk1, unk2, nullptr, nullptr);
    }

    void addPage(cocos2d::CCLayer*, int);
    void addPage(cocos2d::CCLayer*) = imac 0x392c80;
    void cancelAndStoleTouch(cocos2d::CCTouch*, cocos2d::CCEvent*);
    void claimTouch(cocos2d::CCTouch*);
    cocos2d::CCLayer* getPage(int) {
    	auto index = m_page;
    	if (m_dynamic) index = index % m_pages->count();
    	return static_cast<cocos2d::CCLayer*>(m_pages->objectAtIndex(index));
    }
    int getRelativePageForNum(int page) {
    	return page < 1 ? page : page % getTotalPages() = imac 0x391da0;
    }
    cocos2d::CCPoint getRelativePosForPage(int page) {
    	return { this->getContentSize().width - m_pageOffset * page, 0.f };
    }
    int getTotalPages() {
    	return m_dynamic ? m_dynamicObjects->count() : m_pages->count();
    }
    bool init(cocos2d::CCArray*, int, bool, cocos2d::CCArray*, DynamicScrollDelegate*) = win 0x3d230, imac 0x390ee0;
    void instantMoveToPage(int) = win 0x3ddc0;
    void moveToPage(int) = win 0x3dea0, imac 0x392930;
    void moveToPageEnded() = win 0x3dc30, imac 0x3926c0;
    int pageNumberForPosition(cocos2d::CCPoint) = win 0x3dcc0, imac 0x3924b0;
    cocos2d::CCPoint positionForPageWithNumber(int page) {
    	return { this->getContentSize().width + m_pageOffset * page, 0.f };
    }
    void quickUpdate() {
    	if (m_pageMoving) {
    		m_pageMoving = false;
    		m_extendedLayer->stopActionByTag(2);
    		m_extendedLayer->setPosition(m_position);
    		this->moveToPageEnded();
    	}
    }
    void removePage(cocos2d::CCLayer*) = imac 0x392cf0;
    void removePageWithNumber(int) = imac 0x392d80;
    void repositionPagesLooped() = win 0x3e060, imac 0x3914d0;
    void selectPage(int);
    void setDotScale(float scale) {
    	for (int i = 0; i < m_dots->count(); i++) {
    		static_cast<cocos2d::CCSprite*>(m_dots->objectAtIndex(i))->setScale(scale);
    	}
    }
    void setPagesIndicatorPosition(cocos2d::CCPoint pos) {
    	m_dotPosition = pos;
    	this->updateDots(0.f);
    }
    void setupDynamicScrolling(cocos2d::CCArray*, DynamicScrollDelegate*) = win 0x3d5a0, imac 0x391b50;
    void togglePageIndicators(bool) = win 0x3db60, imac 0x3925f0;
    void updateDots(float) = win 0x3d960, imac 0x391dd0;
    void updatePages() = win 0x3d840;

    virtual void visit() = win 0x3dbd0, imac 0x392660;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x3e710, imac 0x393190;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x3e7c0, imac 0x393280;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x3eaf0, imac 0x3935a0;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x3e630, imac 0x392fd0;
    virtual void registerWithTouchDispatcher();

    cocos2d::CCArray* m_dots;
    int m_slowPage;
    float m_touchX;
    float m_touchQuotient;
    bool m_looped;
    DynamicScrollDelegate* m_dynamicDelegate;
    cocos2d::CCArray* m_dynamicObjects;
    bool m_dynamic;
    int m_touchType;
    bool m_ignoreTouchCancel;
    cocos2d::CCTouch* m_touch;
    cocos2d::CCArray* m_pages;
    double m_touchTime;
    cocos2d::CCPoint m_position;
    ExtendedLayer* m_extendedLayer;
    cocos2d::CCRect m_rect;
    float m_unkFloat1;
    float m_maxSpeed;
    float m_minSpeed;
    float m_unkFloat2;
    BoomScrollLayerDelegate* m_delegate;
    bool m_pageMoving;
    bool m_pagesInvisible;
    float m_unkFloat3;
    float m_unkFloat4;
    float m_width;
    bool m_cancelAndStealTouch;
    bool m_dotsVisible;
    cocos2d::CCPoint m_dotPosition;
    cocos2d::ccColor4B m_unkColor1;
    cocos2d::ccColor4B m_unkColor2;
    int m_page;
    float m_pageOffset;
    void* m_unkPtr;
    bool m_doVisit;
    cocos2d::CCRect m_clippingRect;
}

[[link(android)]]
class BoomScrollLayerDelegate {
    virtual void scrollLayerScrollingStarted(BoomScrollLayer*);
    virtual void scrollLayerScrolledToPage(BoomScrollLayer*, int);
    virtual void scrollLayerMoved(cocos2d::CCPoint);
    virtual void scrollLayerWillScrollToPage(BoomScrollLayer*, int);
}

[[link(android)]]
class BrowseSmartKeyLayer : BrowseSmartTemplateLayer {
    // virtual ~BrowseSmartKeyLayer();

    static BrowseSmartKeyLayer* create(GJSmartTemplate*, gd::string);

    TodoReturn addChanceToSelected(int, bool);
    TodoReturn createTemplateObjects();
    TodoReturn deletedSelectedItems();
    TodoReturn getAllSelectedBlocks();
    bool init(GJSmartTemplate*, gd::string);
    void onButton(cocos2d::CCObject* sender);
    void onPrefabObject(cocos2d::CCObject* sender);
    TodoReturn updateChanceValues();

    virtual void onBack(cocos2d::CCObject* sender);
}

[[link(android)]]
class BrowseSmartTemplateLayer : FLAlertLayer {
    // virtual ~BrowseSmartTemplateLayer();

    static BrowseSmartTemplateLayer* create(GJSmartTemplate*, SmartBrowseFilter);

    TodoReturn addObjectToPage(cocos2d::CCObject*, int);
    TodoReturn addPrefabMenuItem(SmartPrefabResult, int);
    TodoReturn baseSetup();
    TodoReturn createDots();
    TodoReturn createPrefab(gd::string, int);
    void goToPage(int);
    bool init(GJSmartTemplate*, SmartBrowseFilter);
    void onClick(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    void onTemplateObject(cocos2d::CCObject* sender);
    TodoReturn updateDots();

    virtual void keyBackClicked();
    virtual void onBack(cocos2d::CCObject* sender) = win 0x442ee0;

    GJSmartTemplate* m_template;
    cocos2d::CCArray* m_pages;
    int m_page;
    cocos2d::CCNode* m_nextPageBtn;
    cocos2d::CCNode* m_prevPageBtn;
    cocos2d::CCArray* m_dotsArray;
}

[[link(android)]]
class ButtonPage : cocos2d::CCLayer {
    // virtual ~ButtonPage();

    static ButtonPage* create(cocos2d::CCArray*, cocos2d::CCPoint, int, float);

    bool init(cocos2d::CCArray*, cocos2d::CCPoint, int, float);
}

[[link(android)]]
class ButtonSprite : cocos2d::CCSprite {
    // virtual ~ButtonSprite();
    ButtonSprite() = win 0x3ed20;

    /// Create a ButtonSprite with a top sprite and a texture.
    /// @param topSprite The top sprite to add on top of the sprite
    /// @param width Sprite width; ignored if `absolute` is false
    /// @param absolute Whether to use absolute width or not
    /// @param texture The name of the background sprite file (can't be in a spritesheet)
    /// @param height The height of the button, leave 0 for automatic
    /// @param scale Scale of top sprite
    static ButtonSprite* create(
        cocos2d::CCSprite* topSprite,
        int width,
        bool absolute,
        float height,
        const char* texture,
        float scale
    ) {
        return create(topSprite, width, 0, height, scale, absolute, texture, true);
    }

    /// Create a ButtonSprite with text, a font and a texture.
    /// @param caption The text of the ButtonSprite
    /// @param width Sprite width; ignored if `absolute` is false
    /// @param absolute Whether to use absolute width or not
    /// @param font The name of the BM font file to use
    /// @param texture The name of the background sprite file (can't be in a spritesheet)
    /// @param height The height of the button, leave 0 for automatic
    /// @param scale Scale of text
    /// @returns Pointer to the created ButtonSprite, or nullptr on error
    static ButtonSprite* create(const char* caption, int width, bool absolute, const char* font, const char* texture, float height, float scale) {
    	return create(caption, width, 0, scale, absolute, font, texture, height);
    }

    static ButtonSprite* create(char const* caption) {
    	return ButtonSprite::create(caption, 0, false, "goldFont.fnt", "GJ_button_01.png", .0f, 1.f);
    }
    static ButtonSprite* create(char const* caption, const char* font, const char* texture) {
    	return ButtonSprite::create(caption, 0, false, font, texture, .0f, 1.f);
    }
    static ButtonSprite* create(char const* caption, const char* font, const char* texture, float scale) {
    	return ButtonSprite::create(caption, 0, false, font, texture, .0f, scale);
    }

    static ButtonSprite* create(char const* caption, float scale) {
    	return ButtonSprite::create(caption, 0, false, "goldFont.fnt", "GJ_button_01.png", .0f, scale);
    }
    static ButtonSprite* create(char const* caption, int width, int p2, float scale, bool absolute, char const* font, char const* bg, float height);
    static ButtonSprite* create(char const* caption, int width, int p2, float scale, bool absolute, char const* font, char const* bg) {
    	return ButtonSprite::create(caption, width, p2, scale, absolute, font, bg, .0f);
    }
    static ButtonSprite* create(char const* caption, int width, int p2, float scale, bool absolute) {
    	return ButtonSprite::create(caption, width, p2, scale, absolute, "goldFont.fnt", "GJ_button_01.png", .0f);
    }
    static ButtonSprite* create(cocos2d::CCSprite* topSprite, int width, int unused, float height, float scale, bool absolute, char const* bgSprite, bool noScaleSpriteForBG) = win 0x3f150, imac 0x916b0;
    static ButtonSprite* create(cocos2d::CCSprite* topSprite, int width, int unused, float height, float scale, bool absolute) {
    	return ButtonSprite::create(topSprite, width, unused, height, scale, absolute, "GJ_button_01.png", false);
    }
    static ButtonSprite* create(cocos2d::CCSprite* topSprite) {
    	return ButtonSprite::create(topSprite, 0, 0, .0f, 1.f, false, "GJ_button_01.png", false);
    }

    bool init(char const*, int, int, float, bool, char const*, char const*, float) = win 0x3f220;
    bool init(cocos2d::CCSprite* topSprite, int width, int unused, float height, float scale, bool absolute, char const* bgSprite, bool noScaleSpriteForBG) = win 0x3eef0, imac 0x91800;
    void setColor(cocos2d::_ccColor3B const& color) {
    	// i love inlined funcs
    	if (m_label) m_label->setColor(color);
      		if (m_subSprite) m_subSprite->setColor(color);
      		if (m_subBGSprite) m_subBGSprite->setColor(color);
      		if (m_BGSprite) m_BGSprite->setColor(color);
    }
    void setString(char const*) = win 0x3fae0, imac 0x92340;
    void updateBGImage(char const*) = win 0x3f520, imac 0x92720;
    void updateSpriteBGSize() = win 0x3f660, imac 0x91a90;
    void updateSpriteOffset(cocos2d::CCPoint offset) {
    	m_spritePosition = offset;
    	this->updateSpriteBGSize();
    }

    int m_mode;
    float m_width;
    float m_unkFloat;
    float m_scale;
    float m_height;
    bool m_absolute;
    cocos2d::CCLabelBMFont* m_label;
    cocos2d::CCSprite* m_subSprite;
    cocos2d::CCSprite* m_subBGSprite;
    cocos2d::extension::CCScale9Sprite* m_BGSprite;
    cocos2d::CCPoint m_textOffset;
    cocos2d::CCPoint m_spritePosition;
    gd::string m_caption;
}

[[link(android)]]
class CameraTriggerGameObject : EffectGameObject {
    // virtual ~CameraTriggerGameObject();

    static CameraTriggerGameObject* create(char const*);

    bool init(char const*);

    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = win 0x4a4b50, imac 0x1cbcf0;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class CCAlertCircle : cocos2d::CCNode {
    // virtual ~CCAlertCircle();

    static CCAlertCircle* create();

    virtual bool init();
    virtual void draw() = imac 0x168030;

    CCCircleAlert* m_circleAlert;
}

[[link(android)]]
class CCAnimatedSprite : cocos2d::CCSprite {
    // virtual ~CCAnimatedSprite();
    CCAnimatedSprite() = win 0x3feb0;

    void cleanupSprite() = imac 0x33c2a0;
    static CCAnimatedSprite* createWithType(char const*, cocos2d::CCTexture2D*, bool) = imac 0x33b860;
    bool initWithType(char const*, cocos2d::CCTexture2D*, bool) = win 0x3ffc0, imac 0x33b940;
    void loadType(char const*, cocos2d::CCTexture2D*, bool) = win 0x401e0;
    void runAnimation(gd::string) = win 0x40c80;
    void runAnimationForced(gd::string);
    void stopTween();
    void switchToMode(spriteMode) = win 0x40b10, imac 0x33c340;
    void tweenToAnimation(gd::string, float) = win 0x40cf0, imac 0x33c5a0;
    void tweenToAnimationFinished() = win 0x40fc0;
    void willPlayAnimation();

    virtual void setOpacity(unsigned char) = win 0x41070, imac 0x33ca30;
    virtual void setColor(cocos2d::ccColor3B const&) = win 0x410d0;
    virtual void animationFinished(char const*) = imac 0x33ca10;
    virtual void animationFinishedO(cocos2d::CCObject*) = win 0x41010;

    gd::string m_unkString1;
    gd::string m_unkString2;
    SpriteAnimationManager* m_animationManager;
    cocos2d::CCSprite* m_sprite;
    cocos2d::CCSprite* m_fbfSprite;
    CCPartAnimSprite* m_paSprite;
    spriteMode m_spriteMode;
    gd::string m_currentAnim;
    AnimatedSpriteDelegate* m_delegate;
}

[[link(android)]]
class CCAnimateFrameCache : cocos2d::CCObject {
    // virtual ~CCAnimateFrameCache();

    static CCAnimateFrameCache* sharedSpriteFrameCache() = win 0x41450;

    void addCustomSpriteFramesWithFile(char const*);
    TodoReturn addDict(cocos2d::CCDictionary*, char const*);
    TodoReturn addDict(DS_Dictionary*, char const*);
    void addSpriteFramesWithFile(char const*) = win 0x414e0;
    bool init();
    TodoReturn purgeSharedSpriteFrameCache();
    void removeSpriteFrames();
    TodoReturn spriteFrameByName(char const*);
}

[[link(android)]]
class CCBlockLayer : cocos2d::CCLayerColor {
    // virtual ~CCBlockLayer();

    	CCBlockLayer() {
    	m_unknown = nullptr;
    }
    static CCBlockLayer* create();

    void decrementForcePrio();
    void incrementForcePrio();

    virtual bool init() = win 0x424e0, imac 0x501170;
    virtual void draw() = win 0x426f0;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x42620;
    virtual void customSetup() {}
    virtual TodoReturn enterLayer() = win 0x425a0;
    virtual TodoReturn exitLayer() = win 0x42640, imac 0x501350;
    virtual void showLayer(bool);
    virtual TodoReturn hideLayer(bool);
    virtual TodoReturn layerVisible();
    virtual void layerHidden();
    virtual void enterAnimFinished() {}
    virtual void disableUI() {}
    virtual void enableUI() {}

    void* m_unknown;
}

[[link(android)]]
class CCCircleAlert : CCCircleWave {
    // virtual ~CCCircleAlert();

    static CCCircleAlert* create(float, float, float);

    bool init(float, float, float);
}

[[link(android)]]
class CCCircleWave : cocos2d::CCNode {
    // virtual ~CCCircleWave();
    // CCCircleWave() = win 0x418b0;

    static CCCircleWave* create(float startRadius, float endRadius, float duration, bool fadeIn, bool easeOut) = win 0x42800, imac 0x1673e0;
    static CCCircleWave* create(float startRadius, float endRadius, float duration, bool fadeIn) {
    	return CCCircleWave::create(startRadius, endRadius, duration, fadeIn, true);
    }

    TodoReturn baseSetup(float);
    TodoReturn followObject(cocos2d::CCNode*, bool) = imac 0x1677a0;
    bool init(float startRadius, float endRadius, float duration, bool fadeIn, bool easeOut) = win 0x428b0, imac 0x1674d0;
    TodoReturn updatePosition(float) = win 0x42b30, imac 0x167760;

    virtual void setPosition(cocos2d::CCPoint const&) = win 0x42af0;
    virtual void removeMeAndCleanup() = win 0x42f00, imac 0x167bf0;
    virtual void draw() = win 0x42dd0, imac 0x167ab0;
    virtual void updateTweenAction(float, char const*) = win 0x42b70, imac 0x167830;

    cocos2d::CCNode* m_target;
    float m_width;
    float m_radius;
    float m_opacity;
    cocos2d::ccColor3B m_color;
    cocos2d::CCPoint m_position;
    CircleMode m_circleMode;
    int m_lineWidth;
    float m_opacityMod;
    bool m_blendAdditive;
    CCCircleWaveDelegate* m_delegate;
}

[[link(android)]]
class CCCircleWaveDelegate {
    virtual void circleWaveWillBeRemoved(CCCircleWave*) {}
}

[[link(android)]]
class CCContentLayer : cocos2d::CCLayerColor {
    inline CCContentLayer() {}
    ~CCContentLayer();

    static CCContentLayer* create(cocos2d::ccColor4B const&, float, float);

    virtual void setPosition(cocos2d::CCPoint const&) = win 0x42f70;
}

[[link(android)]]
class CCCountdown : cocos2d::CCSprite {
    // virtual ~CCCountdown();

    static CCCountdown* create();

    TodoReturn lapFinished();
    void startTimerWithSeconds(float, cocos2d::SEL_CallFunc, cocos2d::CCNode*);

    virtual bool init() = imac 0x7b0230;
    virtual void setOpacity(unsigned char);
}

[[link(android)]]
class CCCounterLabel : cocos2d::CCLabelBMFont {
    // virtual ~CCCounterLabel();

    static CCCounterLabel* create(int, char const*, FormatterType);

    TodoReturn calculateStepSize(int);
    TodoReturn disableCounter();
    TodoReturn enableCounter();
    TodoReturn fastUpdateCounter();
    TodoReturn getTargetCount();
    bool init(int, char const*, FormatterType);
    void setTargetCount(int);
    TodoReturn updateCounter(float);
    TodoReturn updateString();
}

[[link(android)]]
class CCExtenderNode {
    void setOpacity(unsigned int);
}

[[link(android)]]
class CCIndexPath : cocos2d::CCObject {
    CCIndexPath() {}
    // virtual ~CCIndexPath();

    TodoReturn CCIndexPathWithSectionRow(int, int);

    int m_row;
    int m_section;
}

[[link(android)]]
class CCLightFlash : cocos2d::CCNode {
    	CCLightFlash() {
    	m_lightStripArray = nullptr;
    	m_layerColor = nullptr;
    	m_dontFadeOut = false;
    	m_mainLayer = nullptr;
    	m_layerColorZOrder = 0;
    }
    // virtual ~CCLightFlash();

    static CCLightFlash* create() {
    	auto ret = new CCLightFlash();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	CC_SAFE_DELETE(ret);
    	return nullptr;
    }

    void cleanupFlash() = win 0x43c80, imac 0x4f01d0;
    void fadeAndRemove();
    void playEffect(cocos2d::CCPoint, cocos2d::ccColor3B, float, float, float, float, float, float, float, float, float, float, float, float, float, float, int, bool, bool, float) = win 0x433a0, imac 0x4ef960;
    void removeLights() = win 0x43c20;
    void showFlash() = win 0x438e0, imac 0x4efeb0;

    virtual bool init() {
    	return true;
    }

    cocos2d::CCArray* m_lightStripArray;
    cocos2d::CCLayerColor* m_layerColor;
    bool m_dontFadeOut;
    cocos2d::CCNode* m_mainLayer;
    int m_layerColorZOrder;
}

[[link(android)]]
class CCLightStrip : cocos2d::CCNode {
    	CCLightStrip() {
    	m_objectWidth = .0f;
    	m_toWidth = .0f;
    	m_toHeight = .0f;
    	m_duration = .0f;
    	m_opacity = .0f;
    	m_width = .0f;
    	m_height = .0f;
    }
    // virtual ~CCLightStrip();

    static CCLightStrip* create(float width, float toWidth, float toHeight, float duration, float delay) {
    	auto ret = new CCLightStrip();
    	if (ret->init(width, toWidth, toHeight, duration, delay)) {
    		ret->autorelease();
    		return ret;
    	}
    	CC_SAFE_DELETE(ret);
    	return nullptr;
    }

    bool init(float width, float toWidth, float toHeight, float duration, float delay) {
    	this->m_toWidth = toWidth;
    	this->m_toHeight = toHeight;
    	this->m_objectWidth = width;
    	this->m_duration = duration;
    	this->m_width = width;
    	this->m_opacity = 255.f;
    	this->m_height = 1.f;

    	this->setVisible(false);

    	auto* delayAction = cocos2d::CCDelayTime::create(delay);
    	auto* heightActionTween = cocos2d::CCActionTween::create(this->m_duration, "height", this->m_height, this->m_toHeight);
    	auto* widthActionTween = cocos2d::CCActionTween::create(this->m_duration, "width", this->m_width, this->m_toWidth);
    	auto* heightEaseOutAction = cocos2d::CCEaseOut::create(heightActionTween, 2.f);
    	auto* widthEaseOutAction = cocos2d::CCEaseOut::create(widthActionTween, 2.f);
    	auto* spawnEaseOutActions = cocos2d::CCSpawn::create(heightEaseOutAction, widthEaseOutAction, nullptr);
    	auto* lightStripSequence = cocos2d::CCSequence::create(delayAction, cocos2d::CCShow::create(), spawnEaseOutActions, nullptr);

    	cocos2d::CCDirector::sharedDirector()->getActionManager()->addAction(lightStripSequence, this, false);

    	return true;
    }

    virtual void draw() = win 0x43cb0, imac 0x4f0420;
    virtual void updateTweenAction(float value, char const* keyword) = win 0x43e70, imac 0x4f05b0;

    float m_objectWidth;
    float m_toWidth;
    float m_toHeight;
    float m_duration;
    cocos2d::ccColor4B m_color;
    float m_opacity;
    float m_width;
    float m_height;
}

[[link(android)]]
class CCMenuItemSpriteExtra : cocos2d::CCMenuItemSprite {
    ~CCMenuItemSpriteExtra() {}
    	CCMenuItemSpriteExtra() {
    	m_animationEnabled = false; //this is changed to true in init
    	m_colorEnabled = false;
    	m_colorDip = 0.784314f;
    	m_scaleMultiplier = 1.f; //this is changed to 1.26f in init
    	m_volume = 1.f;
    	m_duration = 0.3f;
    	m_unselectedDuration = 0.4f;
    	m_animationType = MenuAnimationType::Scale;
    	m_unknown4 = 0;
    	//m_baseScale is initialized in init
    }

    static CCMenuItemSpriteExtra* create(cocos2d::CCNode* sprite, cocos2d::CCNode* disabledSprite, cocos2d::CCObject* target, cocos2d::SEL_MenuHandler callback) = win 0x44b40, imac 0x264480;

    static CCMenuItemSpriteExtra* create(cocos2d::CCNode* sprite, cocos2d::CCObject* target, cocos2d::SEL_MenuHandler callback) {
    	return CCMenuItemSpriteExtra::create(sprite, nullptr, target, callback);
    }

    bool init(cocos2d::CCNode* sprite, cocos2d::CCNode* disabledSprite, cocos2d::CCObject* target, cocos2d::SEL_MenuHandler callback) = win 0x44be0, imac 0x264510;
    void setSizeMult(float mult) {
    	//inlined on windows, member is in CCMenuItemSprite
    	m_fSizeMult = mult;
    }
    void useAnimationType(MenuAnimationType);

    virtual void activate() = win 0x44d40;
    virtual void selected() = win 0x44e50;
    virtual void unselected() = win 0x45070, imac 0x264a90;

    /// Set a new image for this button
    /// Prefer using this over `setNormalImage` as the latter does not actually
    /// handle any of the special sizing operations `CCMenuItemSpriteExtra` has
    /// @param sprite The sprite to replace this button's sprite with
    /// @note Geode addition
    void setSprite(cocos2d::CCSprite* sprite) {
    	this->setNormalImage(sprite);
    	this->updateSprite();
    }
    /// Update the sizing of this button's image
    /// If you for example have a `ButtonSprite` on this button and change the
    /// text, you need to call `updateSprite` afterwards to fix the button's
    /// content size
    /// @note Geode addition
    void updateSprite() {
    	auto sprite = this->getNormalImage();
    	auto size = sprite->getScaledContentSize();
    	sprite->setPosition(size / 2);
    	sprite->setAnchorPoint({ .5f, .5f });
    	this->setContentSize(size);
    }

    float m_scaleMultiplier;
    float m_baseScale;
    bool m_animationEnabled;
    bool m_colorEnabled;
    float m_volume;
    gd::string m_activateSound;
    gd::string m_selectSound;
    float m_colorDip;
    cocos2d::CCPoint m_offset;
    float m_duration;
    float m_unselectedDuration;
    MenuAnimationType m_animationType;
    cocos2d::CCPoint m_startPosition;
    int m_unknown4;
}

[[link(android)]]
class CCMenuItemToggler : cocos2d::CCMenuItem {
    CCMenuItemToggler() {}
    // virtual ~CCMenuItemToggler();

    static CCMenuItemToggler* create(cocos2d::CCNode*, cocos2d::CCNode*, cocos2d::CCObject*, cocos2d::SEL_MenuHandler) = win 0x451e0, imac 0x59570;
    static CCMenuItemToggler* createWithSize(const char* spr1, const char* spr2, cocos2d::CCObject* target, cocos2d::SEL_MenuHandler callback, float scale) {
    	auto sprOff = cocos2d::CCSprite::createWithSpriteFrameName(spr1);
    	auto sprOn = cocos2d::CCSprite::createWithSpriteFrameName(spr2);

    	sprOff->setScale(scale);
    	sprOn->setScale(scale);

    	return create(sprOff, sprOn, target, callback);
    }
    static CCMenuItemToggler* createWithStandardSprites(cocos2d::CCObject* target, cocos2d::SEL_MenuHandler callback, float scale) {
    	auto sprOff = cocos2d::CCSprite::createWithSpriteFrameName("GJ_checkOff_001.png");
    	auto sprOn = cocos2d::CCSprite::createWithSpriteFrameName("GJ_checkOn_001.png");

    	float maxWidth = (std::max)(sprOff->getContentSize().width, sprOn->getContentSize().width);
    	float maxHeight = (std::max)(sprOff->getContentSize().height, sprOn->getContentSize().height);

    	sprOff->setScale(scale);
    	sprOn->setScale(scale);

    	auto ret = create(sprOff, sprOn, target, callback);

    	ret->setContentSize({maxWidth, maxHeight});

    	ret->m_offButton->setContentSize({maxWidth, maxHeight});
    	ret->m_onButton->setContentSize({maxWidth, maxHeight});

     		ret->m_offButton->setPosition({maxWidth/2, maxHeight/2});
    	ret->m_onButton->setPosition({maxWidth/2, maxHeight/2});

    	sprOff->setPosition({maxWidth/2, maxHeight/2});
    	sprOn->setPosition({maxWidth/2, maxHeight/2});

    	return ret;
    }

    TodoReturn activeItem();
    bool init(cocos2d::CCNode* off, cocos2d::CCNode* on, cocos2d::CCObject* target, cocos2d::SEL_MenuHandler callback) {
    	if (!CCMenuItem::initWithTarget(target, callback)) return false;

    	m_offButton = CCMenuItemSpriteExtra::create(off, nullptr, this, menu_selector(CCMenuItemToggler::normalTouch));
    	m_onButton = CCMenuItemSpriteExtra::create(on, nullptr, this, menu_selector(CCMenuItemToggler::selectedTouch));

    	this->addChild(m_offButton);
    	this->addChild(m_onButton);

    	m_offButton->getNormalImage()->setAnchorPoint({0.5f, 0.5f});
    	m_onButton->getNormalImage()->setAnchorPoint({0.5f, 0.5f});

    	auto imgoff = m_offButton->getNormalImage();
    	auto imgon = m_onButton->getNormalImage();

    	imgoff->setPosition(m_offButton->convertToNodeSpace({0.f, 0.f}));
    	imgon->setPosition(m_onButton->convertToNodeSpace({0.f, 0.f}));
    	m_notClickable = false;
    	this->toggle(false);

    	return true;
    }
    void normalTouch(cocos2d::CCObject*) = win 0x45580;
    void selectedTouch(cocos2d::CCObject*) = win 0x455a0;
    void setSizeMult(float mult) {
    	m_offButton->setSizeMult(mult);
    	m_onButton->setSizeMult(mult);

    	this->toggle(this->m_toggled);
    }
    void toggle(bool) = win 0x455c0, imac 0x59a20;

    bool isToggled() {
    	return m_toggled;
    }
    bool isOn() {
    	return m_toggled;
    }
    void setClickable(bool on) {
    	m_notClickable = !on;
    }
    void toggleWithCallback(bool on) {
    	this->activate();
    	this->toggle(on);
    }

    virtual void activate();
    virtual void selected();
    virtual void unselected();
    virtual void setEnabled(bool) = win 0x45530;

    /// Update the sizing of this toggle's image
    /// If you for example have a `ButtonSprite` on this toggle and change the
    /// text, you need to call `updateSprite` afterwards to fix the toggle's
    /// content size
    /// @note Geode addition
    void updateSprite() {
    	m_offButton->updateSprite();
    	m_onButton->updateSprite();
    	auto size = m_offButton->getScaledContentSize();
    	m_offButton->setPosition(size / 2);
    	m_offButton->setAnchorPoint({ .5f, .5f });
    	m_onButton->setPosition(size / 2);
    	m_onButton->setAnchorPoint({ .5f, .5f });
    	this->setContentSize(size);
    }

    CCMenuItemSpriteExtra* m_offButton;
    CCMenuItemSpriteExtra* m_onButton;
    bool m_toggled;
    bool m_notClickable;
}

[[link(android)]]
class CCMoveCNode : cocos2d::CCObject {
    // virtual ~CCMoveCNode();

    static CCMoveCNode* create();

    bool init();
    TodoReturn reset();
}

[[link(android)]]
class CCNodeContainer : cocos2d::CCNode {
    // virtual ~CCNodeContainer();

    static CCNodeContainer* create();

    virtual bool init();
    virtual void visit() = imac 0x153e20;
}

[[link(android)]]
class CCPartAnimSprite : cocos2d::CCSprite {
    // virtual ~CCPartAnimSprite();

    TodoReturn changeTextureOfID(char const*, char const*);
    TodoReturn countParts();
    TodoReturn createWithAnimDesc(char const*, cocos2d::CCTexture2D*, bool);
    TodoReturn dirtify();
    TodoReturn getSpriteForKey(char const*);
    TodoReturn initWithAnimDesc(char const*, cocos2d::CCTexture2D*, bool);
    void setColor(cocos2d::ccColor3B) = win 0x467c0;
    void setFlipX(bool);
    void setFlipY(bool);
    TodoReturn transformSprite(SpriteDescription*);
    TodoReturn tweenSpriteTo(SpriteDescription*, float);
    TodoReturn tweenToFrame(cocos2d::CCSpriteFrame*, float);

    virtual void setScaleX(float);
    virtual void setScaleY(float);
    virtual void setScale(float);
    virtual void setOpacity(unsigned char) = win 0x468a0;
    virtual void setBlendFunc(cocos2d::_ccBlendFunc) = win 0x466f0, imac 0x361520;
    virtual void setDisplayFrame(cocos2d::CCSpriteFrame*);
    virtual bool isFrameDisplayed(cocos2d::CCSpriteFrame*) = imac 0x3611f0;
    virtual cocos2d::CCSpriteFrame* displayFrame();

    cocos2d::CCDictionary* m_spritePartIDs;
    cocos2d::CCSpriteFrame* m_spriteFrame;
    bool m_hasChanged;
    cocos2d::CCSize m_unkSize;
    cocos2d::CCArray* m_spriteParts;
}

[[link(android), depends(CCContentLayer)]]
class CCScrollLayerExt : cocos2d::CCLayer {
    // virtual ~CCScrollLayerExt() = win 0x46210, ios 0x311ab8;
    CCScrollLayerExt(cocos2d::CCRect) = win 0x46a50;

    TodoReturn constraintContent();
    TodoReturn doConstraintContent(bool);
    inline float getMaxY() {
    	return m_scrollLimitBottom;
    }
    inline float getMinY() {
    	return this->getContentSize().height - m_contentLayer->getContentSize().height - m_scrollLimitTop;
    }
    void moveToTop() = win 0x47000, imac 0x41aee0;
    void moveToTopWithOffset(float) = win 0x46f60, imac 0x41ae40;
    TodoReturn scrollingEnd();
    void scrollLayer(float offset) {
    	float y = m_contentLayer->getPositionY() + offset;
    	float minY = getMinY();
    	float maxY = getMaxY();
    	m_contentLayer->setPositionY(y < minY ? minY : y > maxY ? maxY : y);
    }
    void setContentLayerSize(cocos2d::CCSize);
    void setContentOffset(cocos2d::CCPoint, bool);
    TodoReturn updateIndicators(float);

    virtual void visit() = win 0x47ad0, imac 0x41bb50;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x47580;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x47950, imac 0x41b910;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x476a0, imac 0x41b610;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x47920;
    virtual void registerWithTouchDispatcher() = win 0x47530;
    virtual void preVisitWithClippingRect(cocos2d::CCRect) = win 0x47c00, imac 0x41bc50;
    virtual void postVisit() = win 0x47ca0;

    cocos2d::CCTouch* m_touch;
    cocos2d::CCPoint m_touchPosition;
    cocos2d::CCPoint m_touchStartPosition;
    cocos2d::cc_timeval m_timeValue;
    bool m_touchDown;
    bool m_notAtEndOfScroll;
    cocos2d::CCLayerColor* m_verticalScrollbar;
    cocos2d::CCLayerColor* m_horizontalScrollbar;
    CCScrollLayerExtDelegate* m_delegate;
    CCContentLayer* m_contentLayer;
    bool m_cutContent;
    bool m_vScrollbarVisible;
    bool m_hScrollbarVisible;
    bool m_disableHorizontal;
    bool m_disableVertical;
    bool m_disableMovement;
    float m_scrollLimitTop;
    float m_scrollLimitBottom;
    float m_peekLimitTop;
    float m_peekLimitBottom;
}

[[link(android)]]
class CCScrollLayerExtDelegate {
    virtual void scrllViewWillBeginDecelerating(CCScrollLayerExt*) {}
    virtual void scrollViewDidEndDecelerating(CCScrollLayerExt*) {}
    virtual void scrollViewTouchMoving(CCScrollLayerExt*) {}
    virtual void scrollViewDidEndMoving(CCScrollLayerExt*) {}
    virtual void scrollViewTouchBegin(CCScrollLayerExt*) {}
    virtual void scrollViewTouchEnd(CCScrollLayerExt*) {}
}

[[link(android)]]
class CCSpriteCOpacity : cocos2d::CCSprite {
    // virtual ~CCSpriteCOpacity();

    TodoReturn createWithSpriteFrame(cocos2d::CCSpriteFrame*);
    TodoReturn createWithSpriteFrameName(char const*);

    virtual void setOpacity(unsigned char) = win 0x483c0;
}

[[link(android)]]
class CCSpriteGrayscale : CCSpriteWithHue {
    // virtual ~CCSpriteGrayscale();
    CCSpriteGrayscale() {}

    static CCSpriteGrayscale* create(gd::string const& file, cocos2d::CCRect const& rect) {
    	auto ret = new CCSpriteGrayscale();
    	if (ret->initWithFile(file.c_str(), rect)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static CCSpriteGrayscale* create(gd::string const& file) {
    	auto ret = new CCSpriteGrayscale();
    	if (ret->initWithFile(file.c_str())) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static CCSpriteGrayscale* createWithSpriteFrame(cocos2d::CCSpriteFrame* frame) {
    	auto ret = new CCSpriteGrayscale();
    	if (ret->initWithSpriteFrame(frame)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static CCSpriteGrayscale* createWithSpriteFrameName(gd::string const& frameName);
    static CCSpriteGrayscale* createWithTexture(cocos2d::CCTexture2D* texture, cocos2d::CCRect const& rect, bool rotated) {
    	auto ret = new CCSpriteGrayscale();
    	if (ret->initWithTexture(texture, rect, rotated)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static CCSpriteGrayscale* createWithTexture(cocos2d::CCTexture2D* texture) {
    	auto ret = new CCSpriteGrayscale();
    	if (ret->initWithTexture(texture)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    virtual gd::string getShaderName() = win 0x48fc0, imac 0x5d8860;
    virtual const char* shaderBody();
}

[[link(android)]]
class CCSpritePart : CCSpritePlus {
    // virtual ~CCSpritePart();

    static CCSpritePart* create(cocos2d::CCTexture2D*);

    TodoReturn createWithSpriteFrameName(char const*);
    TodoReturn frameChanged(gd::string);
    TodoReturn getBeingUsed();
    TodoReturn hideInactive();
    TodoReturn markAsNotBeingUsed();
    TodoReturn resetTextureRect();
    void setBeingUsed(bool);
    TodoReturn updateDisplayFrame(gd::string);

    virtual void setVisible(bool) = win 0x46a30, imac 0x361b60;

    bool m_isBeingUsed;
    gd::string m_spriteFrameName;
    SpritePartDelegate* m_delegate;
}

[[link(android)]]
class CCSpritePlus : cocos2d::CCSprite {
    // virtual ~CCSpritePlus();

    /// Adds a follower to the sprite
    /// @param follower Something that will follow this sprite
    void addFollower(cocos2d::CCNode* follower) = imac 0x46e5f0;

    /// Creates a sprite by a given sprite frame
    /// @param frame the frame to give to the specific sprite
    /// @return CCSpritePlus object and returns null if initialization fails
    static CCSpritePlus* createWithSpriteFrame(cocos2d::CCSpriteFrame* frame);

    /// Creates a sprite by a given sprite's frame name
    /// @param frame the frame or filename to give to the specific sprite
    /// @return CCSpritePlus object and returns null if initialization fails
    static CCSpritePlus* createWithSpriteFrameName(char const* frame);

    /// Attaches a sprite to the sprite. and other way around
    /// you can think of this as attaching 2 lego blocks together and letting
    /// it drag along.
    /// @param sprite the sprite to attach to the main sprite and vice versa
    void followSprite(CCSpritePlus* sprite);

    /// Obtains the first following sprite if it has a follower on hand
    /// @return nullptr if there is no follower avalible
    CCSpritePlus* getFollower();

    /// Removes a specific following sprite from this sprite.
    /// @param sprite follower sprite that will be removed.
    void removeFollower(cocos2d::CCNode* sprite) = win 0x48370;

    /// Stops this child sprite from following it's given parent
    void stopFollow();

    /// Sets X's scale on itself and it's followers
    /// @param fScaleX the scale of X to set
    virtual void setScaleX(float fScaleX) = win 0x481d0;

    /// Sets Y's scale on itself and it's followers
    /// @param fScaleY the scale of Y to set
    virtual void setScaleY(float fScaleY);

    /// Sets the Scale of itself and it's followers
    /// @param fScale the scale value to set
    virtual void setScale(float fScale);

    /// Sets the position where the sprite will be at and it's followers
    /// @param pos the position to place to the sprite and it's followers
    virtual void setPosition(cocos2d::CCPoint const& pos) = win 0x47dd0;

    /// Sets the sprite's given rotation and it's followers
    /// @param fRotation the rotation value to set
    virtual void setRotation(float fRotation);

    /// Sets the sprite's given rotation of X and it's followers
    /// @param fRotationX the rotation of X to set.
    virtual void setRotationX(float fRotationX);

    /// Sets the sprite's given rotation of Y and it's followers
    /// @param fRotationY the roation of Y to set
    virtual void setRotationY(float);

    /// Initalizes the sprite using a texture
    /// @param texture the texture to initalize the sprite with
    /// @return true if initalization succeeded.
    virtual bool initWithTexture(cocos2d::CCTexture2D* texture) = win 0x47db0, imac 0x46e0b0;

    /// Initalizes the sprite with a frame name
    /// @param frame the frame to initalize the sprite with
    /// @return true if initalization succeeded
    virtual bool initWithSpriteFrameName(char const*) = imac 0x46e090;

    /// Sets flipX to itself and it's followers
    /// @param flipX the direction that the sprite should be flipped to
    virtual void setFlipX(bool flipX);

    /// Sets flipY to itself and it's followers
    /// @param flipY the direction that the sprite should be flipped to
    virtual void setFlipY(bool flipY);

    cocos2d::CCArray* m_followers;
    CCSpritePlus* m_followingSprite;
    bool m_hasFollower;
    bool m_propagateScaleChanges;
    bool m_propagateFlipChanges;
    PAD = win 0x1;
}

[[link(android)]]
class CCSpriteWithHue : cocos2d::CCSprite {
    // virtual ~CCSpriteWithHue();
    CCSpriteWithHue() {}

    static CCSpriteWithHue* create(gd::string const& file, cocos2d::CCRect const& rect) {
    	auto ret = new CCSpriteWithHue();
    	if (ret->initWithFile(file.c_str(), rect)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static CCSpriteWithHue* create(gd::string const& file) {
    	auto ret = new CCSpriteWithHue();
    	if (ret->initWithFile(file.c_str())) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static CCSpriteWithHue* createWithSpriteFrame(cocos2d::CCSpriteFrame* frame) {
    	auto ret = new CCSpriteWithHue();
    	if (ret->initWithSpriteFrame(frame)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static CCSpriteWithHue* createWithSpriteFrameName(gd::string const&);
    static CCSpriteWithHue* createWithTexture(cocos2d::CCTexture2D* texture, cocos2d::CCRect const& rect, bool rotated) {
    	auto ret = new CCSpriteWithHue();
    	if (ret->initWithTexture(texture, rect, rotated)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static CCSpriteWithHue* createWithTexture(cocos2d::CCTexture2D* texture) {
    	auto ret = new CCSpriteWithHue();
    	if (ret->initWithTexture(texture)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    float getAlpha() {
    	return _displayedOpacity / 255.f;
    }
    float getHue() {
    	return m_hue;
    }
    void getUniformLocations() {
    	m_uHueLoc = glGetUniformLocation(m_pShaderProgram->getProgram(), "u_hue");
    	m_uAlphaLoc = glGetUniformLocation(m_pShaderProgram->getProgram(), "u_alpha");
    	m_uLumLoc = glGetUniformLocation(m_pShaderProgram->getProgram(), "u_lum");
    }
    void initShader() = win 0x486d0;
    void setCustomLuminance(float r, float g, float b) {
    	m_luminance[0] = r;
    	m_luminance[1] = g;
    	m_luminance[2] = b;
    }
    void setEvenLuminance(float luminance) {
    	m_luminance[0] = luminance * 0.33f;
    	m_luminance[1] = luminance * 0.33f;
    	m_luminance[2] = luminance * 0.33f;
    }
    void setHue(float hue) {
    	m_hue = hue;
    	this->updateColorMatrix();
    }
    void setHueDegrees(float degrees) {
    	auto deg = degrees;
    	while (deg < 0.f) deg += 360.f;
    	this->setHue(deg / 360.f * 6.28318548f);
    }
    void setLuminance(float luminance) {
    	m_luminance[0] = luminance * 0.21f;
    	m_luminance[1] = luminance * 0.72f;
    	m_luminance[2] = luminance * 0.07f;
    }
    void setupDefaultSettings() {
    	m_hue = 0.f;
    	this->setLuminance(1.f);
    }
    void updateColorMatrix() = win 0x48930;
    void updateHue(float) {
    	this->setHue(m_hue + 0.05235988f);
    }

    virtual void draw() = win 0x48c20;
    virtual bool initWithTexture(cocos2d::CCTexture2D*) = win 0x485f0;
    virtual bool initWithTexture(cocos2d::CCTexture2D*, cocos2d::CCRect const&) = win 0x48650;
    virtual bool initWithTexture(cocos2d::CCTexture2D*, cocos2d::CCRect const&, bool) = win 0x48590;
    virtual bool initWithSpriteFrame(cocos2d::CCSpriteFrame*) = win 0x48660;
    virtual gd::string getShaderName() = win 0x48400, imac 0x5d7680;
    virtual const char* shaderBody();
    virtual void updateColor() = win 0x48910;

    float m_hue;
    std::array<float, 3> m_luminance;
    std::array<std::array<float, 3>, 3> m_colorMatrix;
    int m_uHueLoc;
    int m_uAlphaLoc;
    int m_uLumLoc;
}

[[link(android)]]
class CCTextInputNode : cocos2d::CCLayer, cocos2d::CCIMEDelegate, cocos2d::CCTextFieldDelegate {
    // virtual ~CCTextInputNode() = win 0x48500, ios 0x17834c;
    	CCTextInputNode() {
    	m_numberInput = false;
    	m_caption = "";
    	m_unknown1 = 0;
    	m_selected = false;
    	m_unknown2 = false;
    	m_fontValue1 = -0.5f;
    	m_fontValue2 = 8.0f;
    	m_isChatFont = false;
    	m_allowedChars = "";
    	m_maxLabelWidth = 0.0f;
    	m_maxLabelScale = 0.0f;
    	m_placeholderScale = 0.0f;
    	m_placeholderColor = cocos2d::ccc3(0, 0, 0);
    	m_textColor = cocos2d::ccc3(0, 0, 0);
    	m_cursor = nullptr;
    	m_textField = nullptr;
    	m_delegate = nullptr;
    	m_maxLabelLength = 0;
    	m_placeholderLabel = nullptr;
    	m_filterSwearWords = false;
    	m_usePasswordChar = false;
    	m_forceOffset = false;
    	m_textArea = nullptr;
    	m_valueType = (InputValueType)0;
    	m_decimalPlaces = 0;
    	m_kerningAmount = 0;
    }

    static CCTextInputNode* create(float, float, char const*, char const*, int, char const*) = win 0x4f0f0, imac 0x9d4d0;

    static CCTextInputNode* create(float width, float height, char const* placeholder, char const* fontPath) {
    	return CCTextInputNode::create(width, height, placeholder, 0x18, fontPath);
    }
    static CCTextInputNode* create(float width, float height, char const* placeholder, int fontSize, char const* fontPath) {
    	return CCTextInputNode::create(width, height, placeholder, "Thonburi", fontSize, fontPath);
    }

    void setDelegate(TextInputDelegate* delegate) {
    	m_delegate = delegate;
    }
    void setMaxLabelScale(float v) {
    	m_maxLabelScale = v;
    	this->refreshLabel();
    }
    void setMaxLabelWidth(float v) {
    	m_maxLabelWidth = v;
    	this->refreshLabel();
    }
    void setMaxLabelLength(int v) {
    	m_maxLabelLength = v;
    	this->refreshLabel();
    }
    void setLabelPlaceholderScale(float v) {
    	m_placeholderScale = v;
    	this->refreshLabel();
    }
    void setLabelPlaceholderColor(cocos2d::ccColor3B color) {
    	m_placeholderColor = color;
    	this->refreshLabel();
    }
    void setAllowedChars(gd::string filter) {
    	m_allowedChars = filter;
    }
    cocos2d::CCLabelBMFont* getPlaceholderLabel() {
    	return m_placeholderLabel;
    }

    void addTextArea(TextArea*) = win 0x4f540;
    void forceOffset();
    gd::string getString() {
    	return m_textField->getString();
    }
    bool init(float, float, char const*, char const*, int, char const*) = win 0x4f300, imac 0x9d690;
    void refreshLabel() = win 0x4fb40, imac 0x9e150;
    void setLabelNormalColor(cocos2d::ccColor3B color) {
    	m_textColor = color;
    	this->refreshLabel();
    }
    void setString(gd::string) = win 0x4f7a0;
    void updateBlinkLabel() {
    	this->updateBlinkLabelToChar(this->m_textField->m_uCursorPos);
    }
    void updateBlinkLabelToChar(int) = win 0x4fe20, imac 0x9e440;
    void updateCursorPosition(cocos2d::CCPoint, cocos2d::CCRect) = win 0x50d60, imac 0x9fe00;
    void updateDefaultFontValues(gd::string) = win 0x4f630;
    void updateLabel(gd::string) = win 0x4f840, imac 0x9dc20;

    virtual void visit() = win 0x4f730;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x512c0, imac 0xa0380;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void registerWithTouchDispatcher() = win 0x514d0;
    virtual void textChanged() = win 0x50410, imac 0x9eb20;
    virtual void onClickTrackNode(bool) = win 0x503f0, imac 0x9eb00;
    virtual void keyboardWillShow(cocos2d::CCIMEKeyboardNotificationInfo&) = win 0x50210, imac 0x9e8a0;
    virtual void keyboardWillHide(cocos2d::CCIMEKeyboardNotificationInfo&) = win 0x50370, imac 0x9ea80;
    virtual bool onTextFieldInsertText(cocos2d::CCTextFieldTTF* pSender, char const* text, int nLen, cocos2d::enumKeyCodes keyCodes) = win 0x504a0;
    virtual bool onTextFieldAttachWithIME(cocos2d::CCTextFieldTTF* tField) = win 0x50880, imac 0x9f300;
    virtual bool onTextFieldDetachWithIME(cocos2d::CCTextFieldTTF* tField) = win 0x50bb0, imac 0x9f640;

    bool m_numberInput;
    gd::string m_caption;
    int m_unknown1;
    bool m_selected;
    bool m_unknown2;
    float m_fontValue1;
    float m_fontValue2;
    bool m_isChatFont;
    gd::string m_allowedChars;
    float m_maxLabelWidth;
    float m_maxLabelScale;
    float m_placeholderScale;
    cocos2d::ccColor3B m_placeholderColor;
    cocos2d::ccColor3B m_textColor;
    cocos2d::CCLabelBMFont* m_cursor;
    cocos2d::CCTextFieldTTF* m_textField;
    TextInputDelegate* m_delegate;
    int m_maxLabelLength;
    cocos2d::CCLabelBMFont* m_placeholderLabel;
    bool m_filterSwearWords;
    bool m_usePasswordChar;
    bool m_forceOffset;
    TextArea* m_textArea;
    InputValueType m_valueType;
    int m_decimalPlaces;
    int m_kerningAmount;
}

[[link(android)]]
class CCURLObject : cocos2d::CCObject {
    // virtual ~CCURLObject();

    static CCURLObject* create(gd::string, gd::string);

    bool init(gd::string, gd::string);
}

[[link(android), depends(ChallengesPage), depends(GJChallengeItem)]]
class ChallengeNode : cocos2d::CCNode {
    // virtual ~ChallengeNode();
    inline ChallengeNode() {}

    static ChallengeNode* create(GJChallengeItem* challengeItem, ChallengesPage* challengesPage, bool isNew) {
    	auto ret = new ChallengeNode();
    	if (ret->init(challengeItem, challengesPage, isNew)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(GJChallengeItem* challengeItem, ChallengesPage* challengesPage, bool isNew) = win 0x86ce0, imac 0x38aca0;
    void onClaimReward(cocos2d::CCObject* sender) = imac 0x38b8b0;
    void updateTimeLabel(gd::string);

    ChallengesPage* m_challengesPage;
    GJChallengeItem* m_challengeItem;
    cocos2d::CCPoint m_unkPoint;
    cocos2d::CCLabelBMFont* m_countdownLabel;
    bool m_unloaded;
}

[[link(android)]]
class ChallengesPage : FLAlertLayer, FLAlertLayerProtocol, GJChallengeDelegate, CurrencyRewardDelegate {
    // virtual ~ChallengesPage();
    inline ChallengesPage() {}

    static ChallengesPage* create() {
    	auto ret = new ChallengesPage();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void claimItem(ChallengeNode*, GJChallengeItem*, cocos2d::CCPoint) = win 0x869d0, imac 0x38aa50;
    ChallengeNode* createChallengeNode(int number, bool skipAnimation, float animLength, bool isNew) = win 0x86090, imac 0x38a020;
    TodoReturn exitNodeAtSlot(int, float) = win 0x863c0, imac 0x38a4e0;
    void onClose(cocos2d::CCObject* sender);
    TodoReturn tryGetChallenges();
    TodoReturn updateDots();
    callback void updateTimers(float) = win 0x864b0;

    virtual bool init() = win 0x85300, imac 0x389350;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x86980;
    virtual void show();

    virtual void FLAlert_Clicked(FLAlertLayer*, bool) {}

    virtual void challengeStatusFinished();
    virtual void challengeStatusFailed();
    virtual void currencyWillExit(CurrencyRewardLayer*) = win 0x86cc0, imac 0x38ab80;

    cocos2d::CCArray* m_dots;
    cocos2d::CCLabelBMFont* m_countdownLabel;
    LoadingCircle* m_circle;
    bool m_triedToLoad;
    bool m_unkBool;
    CurrencyRewardLayer* m_currencyRewardLayer;
    cocos2d::CCDictionary* m_challengeNodes;
}

[[link(android)]]
class ChanceTriggerGameObject : EffectGameObject {
    // virtual ~ChanceTriggerGameObject();

    TodoReturn editChanceObject(int, int);
    bool init(char const*);
    TodoReturn remapChanceObjects(gd::unordered_map<int, int> const*);
    TodoReturn revertChanceRemap();
}

[[link(android)]]
class CharacterColorDelegate {
    virtual void playerColorChanged();
    virtual void showUnlockPopup(int, UnlockType);
}

[[link(android)]]
class CharacterColorPage : FLAlertLayer {
    // virtual ~CharacterColorPage();
    	CharacterColorPage() {
    	m_colorMode = 0;
    	m_playerObjects = nullptr;
    	m_modeButtons = nullptr;
    	m_colorButtons = nullptr;
    	m_cursors = nullptr;
    	m_delegate = nullptr;
    	m_glowToggler = nullptr;
    	m_glowLabel = nullptr;
    }

    static CharacterColorPage* create() {
    	auto ret = new CharacterColorPage();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    int activeColorForMode(int mode);
    TodoReturn checkColor(int, UnlockType);
    int colorForIndex(int) = imac 0x6476f0;
    void createColorMenu() = win 0x88e50;
    void FLAlert_Clicked(FLAlertLayer*, bool);
    cocos2d::CCPoint offsetForIndex(int) = imac 0x647960;
    void onClose(cocos2d::CCObject* sender) = win 0x8a760;
    void onMode(cocos2d::CCObject* sender) = win 0x89550, imac 0x646a80;
    void onPlayerColor(cocos2d::CCObject* sender) = win 0x89d60;
    void toggleGlow(cocos2d::CCObject*);
    TodoReturn toggleGlowItems(bool);
    void toggleShip(cocos2d::CCObject*) = win 0x88c80, imac 0x6469d0;
    void updateColorMode(int) = imac 0x6471b0;
    void updateIconColors() = win 0x8a540;

    virtual bool init() = win 0x87f30, imac 0x645d00;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x8a7a0;
    virtual void show();

    int m_colorMode;
    float m_height;
    float m_width;
    cocos2d::CCArray* m_playerObjects;
    cocos2d::CCArray* m_modeButtons;
    cocos2d::CCDictionary* m_colorButtons;
    cocos2d::CCArray* m_cursors;
    CharacterColorDelegate* m_delegate;
    CCMenuItemToggler* m_glowToggler;
    cocos2d::CCLabelBMFont* m_glowLabel;
}

[[link(android)]]
class CheckpointGameObject : EffectGameObject {
    // virtual ~CheckpointGameObject();

    static CheckpointGameObject* create();

    TodoReturn resetCheckpoint();
    TodoReturn updateCheckpointSpriteVisibility();

    virtual bool init();
    virtual void setupCustomSprites(gd::string) = imac 0x1c3410;
    virtual void resetObject();
    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = win 0x4a1140, imac 0x1c3020;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
    virtual void triggerActivated(float) = win 0x4a1160, imac 0x1c3040;
    virtual void restoreObject() = imac 0x1c4a90;
    virtual void updateSyncedAnimation(float, int) = imac 0x1c39f0;
}

[[link(android), depends(GJGameState), depends(GJShaderState), depends(FMODAudioState), depends(EffectManagerState)]]
class CheckpointObject : cocos2d::CCNode {
    // virtual ~CheckpointObject();
    CheckpointObject() = win 0x38e150;

    static CheckpointObject* create() {
    	auto ret = new CheckpointObject();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    TodoReturn getObject();
    void setObject(GameObject*);

    virtual bool init();

    GJGameState m_gameState;
    GJShaderState m_shaderState;
    FMODAudioState m_audioState;
    GameObject* m_physicalCheckpointObject;
    PlayerCheckpoint* m_player1Checkpoint;
    PlayerCheckpoint* m_player2Checkpoint;
    void* m_maybeAPointer1;
    int m_unkInt1;
    short m_unkShort1;
    PAD = win 0x2;
    void* m_maybeAPointer2;
    gd::vector<DynamicSaveObject> m_vectorDynamicSaveObjects;
    gd::vector<ActiveSaveObject1> m_vectorActiveSaveObjects1;
    gd::vector<ActiveSaveObject2> m_vectorActiveSaveObjects2;
    EffectManagerState m_effectManagerState;
    cocos2d::CCArray* m_gradientTriggerObjectArray;
    bool m_unkBool1;
    PAD = win 0x7;
    gd::unordered_map<int,SequenceTriggerState> m_sequenceTriggerStateUnorderedMap;
    void* m_maybeAPointer3;
}

[[link(android)]]
class CollisionBlockPopup : FLAlertLayer, TextInputDelegate {
    // virtual ~CollisionBlockPopup();

    static CollisionBlockPopup* create(EffectGameObject*, cocos2d::CCArray*);

    TodoReturn createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint);
    TodoReturn determineStartValues();
    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onClose(cocos2d::CCObject* sender);
    void onDynamicBlock(cocos2d::CCObject* sender);
    void onItemIDArrow(cocos2d::CCObject* sender);
    void onNextItemID(cocos2d::CCObject* sender);
    TodoReturn updateEditorLabel();
    TodoReturn updateItemID();
    TodoReturn updateTextInputLabel();

    virtual void keyBackClicked();
    virtual void show();
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x8b7a0, imac 0x274a10;
    virtual void textInputShouldOffset(CCTextInputNode*, float);
    virtual void textInputReturn(CCTextInputNode*);
}

[[link(android)]]
class CollisionTriggerAction {
    PAD = win 0x20;
    gd::vector<int> m_unkVecInt;
}

[[link(android)]]
class ColorAction : cocos2d::CCObject {
    // virtual ~ColorAction();

    static ColorAction* create() = win 0x251a20, imac 0x2c4870;
    static ColorAction* create(cocos2d::ccColor3B, bool, int);
    static ColorAction* create(cocos2d::ccColor3B, cocos2d::ccColor3B, float, double, bool, int, float, float);
    static ColorAction* create(cocos2d::ccColor3B, cocos2d::ccColor3B, float, double, bool);

    TodoReturn getCopy();
    bool init(cocos2d::ccColor3B, cocos2d::ccColor3B, float, double, bool, int, float, float);
    bool isInUse();
    void loadFromState(CAState& state) {
    	m_fromColor = state.m_fromColor;
    	m_toColor = state.m_toColor;
    	m_color = state.m_color;
    	m_property19 = state.m_property19;
    	m_blending = state.m_blending;
    	m_copyOpacity = state.m_copyOpacity;
    	m_unknown = state.m_unknown;
    	m_playerColor = state.m_playerColor;
    	m_colorID = state.m_colorID;
    	m_copyID = state.m_copyID;
    	m_unknown2 = state.m_unknown2;
    	m_duration = state.m_duration;
    	m_fromOpacity = state.m_fromOpacity;
    	m_toOpacity = state.m_toOpacity;
    	m_deltaTime = state.m_deltaTime;
    	m_copyHSV = state.m_copyHSV;
    }
    TodoReturn resetAction();
    void saveToState(CAState& state) {
    	state.m_fromColor = m_fromColor;
    	state.m_toColor = m_toColor;
    	state.m_color = m_color;
    	state.m_property19 = m_property19;
    	state.m_blending = m_blending;
    	state.m_copyOpacity = m_copyOpacity;
    	state.m_unknown = m_unknown;
    	state.m_playerColor = m_playerColor;
    	state.m_colorID = m_colorID;
    	state.m_copyID = m_copyID;
    	state.m_unknown2 = m_unknown2;
    	state.m_duration = m_duration;
    	state.m_fromOpacity = m_fromOpacity;
    	state.m_toOpacity = m_toOpacity;
    	state.m_deltaTime = m_deltaTime;
    	state.m_copyHSV = m_copyHSV;
    }
    void setupFromMap(gd::map<gd::string, gd::string>&) = win 0x2526e0;
    void setupFromString(gd::string) = win 0x252600, imac 0x2c6bd0;
    void step(float) = win 0x251b10;
    void updateCustomColor(cocos2d::ccColor3B, cocos2d::ccColor3B);
    // TodoReturn writeSaveString(fmt::BasicWriter<char>&);

    bool m_stepFinished;
    // property 19
    bool m_property19;
    cocos2d::ccColor3B m_color;
    float m_currentOpacity;
    float m_deltaTime;
    cocos2d::ccColor3B m_fromColor;
    cocos2d::ccColor3B m_toColor;
    float m_duration;
    bool m_blending;
    int m_playerColor;
    int m_colorID;
    float m_fromOpacity;
    float m_toOpacity;
    cocos2d::ccHSVValue m_copyHSV;
    int m_copyID;
    bool m_unknown;
    bool m_unknown2;
    bool m_copyOpacity;
    ColorActionSprite* m_colorSprite;
    // more stuff
}

[[link(android)]]
class ColorAction2 {
    ColorAction2(cocos2d::ccColor3B, cocos2d::ccColor3B, float, double, bool, int, float, float);

    TodoReturn resetAction();
    TodoReturn step(float);
    TodoReturn updateCustomColor(cocos2d::ccColor3B, cocos2d::ccColor3B);
}

[[link(android)]]
class ColorActionSprite : cocos2d::CCNode {
    // virtual ~ColorActionSprite();

    static ColorActionSprite* create();

    virtual bool init();

    float m_opacity;
    cocos2d::ccColor3B m_color;
    cocos2d::ccColor3B m_copyColor;
}

[[link(android)]]
class ColorChannelSprite : cocos2d::CCSprite {
    // virtual ~ColorChannelSprite();

    static ColorChannelSprite* create() = win 0x2514b0;

    void updateBlending(bool enabled) = win 0x2518a0, imac 0x2c42e0;
    void updateCopyLabel(int channelID, bool copyOpacity) = win 0x251590, imac 0x2c3fd0;
    void updateOpacity(float alpha) = win 0x251750, imac 0x2c4190;
    void updateValues(ColorAction* action) {
    	if (!action) {
    		this->setColor(cocos2d::ccWHITE);
    		this->updateCopyLabel(0, false);
    		this->updateOpacity(1.f);
    		this->updateBlending(false);
    		return;
    	}
    	this->updateCopyLabel(action->m_copyID, action->m_copyOpacity);
    	this->updateOpacity(action->m_fromOpacity);
    	this->updateBlending(action->m_blending);
    	if (action->m_copyID != 0 && !action->m_copyOpacity) {
    		this->setColor(cocos2d::ccGRAY);
    	}
    	else {
    		this->setColor(action->m_fromColor);
    	}
    }

    virtual bool init() = win 0x251570, imac 0x2c3fb0;

    cocos2d::CCLabelBMFont* m_copyLabel;
    cocos2d::CCLabelBMFont* m_opacityLabel;
    cocos2d::CCLabelBMFont* m_blendingLabel;
}

[[link(android)]]
class ColorSelectDelegate {
    virtual void colorSelectClosed(cocos2d::CCNode*);
}

[[link(android)]]
class ColorSelectLiveOverlay : FLAlertLayer {
    // virtual ~ColorSelectLiveOverlay();

    static ColorSelectLiveOverlay* create(ColorAction*, ColorAction*, EffectGameObject*) = win 0x8bc50, imac 0x550fd0;

    void closeColorSelect(cocos2d::CCObject*);
    void colorValueChanged(cocos2d::ccColor3B);
    TodoReturn createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint);
    TodoReturn createWithActions(ColorAction*, ColorAction*);
    TodoReturn createWithObject(EffectGameObject*);
    TodoReturn determineStartValues();
    TodoReturn getColorValue();
    bool init(ColorAction*, ColorAction*, EffectGameObject*) = win 0x8bda0;
    void onSelectTab(cocos2d::CCObject* sender);
    TodoReturn selectColor(cocos2d::ccColor3B);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn textChanged(CCTextInputNode*);
    void textInputClosed(CCTextInputNode*);
    TodoReturn toggleControls(bool);
    TodoReturn updateColorLabel();
    TodoReturn updateColorValue();
    void updateOpacity();

    virtual void keyBackClicked();
    virtual void show();

    EffectGameObject* m_effectGameObject;
    cocos2d::CCArray* m_barSprites;
    cocos2d::CCArray* m_12buttons;
    ColorAction* m_baseColorAction;
    ColorAction* m_detailColorAction;
}

[[link(android)]]
class ColorSelectPopup : SetupTriggerPopup, cocos2d::extension::ColorPickerDelegate, GJSpecialColorSelectDelegate {
    // virtual ~ColorSelectPopup();

    static ColorSelectPopup* create(cocos2d::ccColor3B color) {
    	auto action = ColorAction::create();
    	action->m_color = color;
    	return ColorSelectPopup::create(action);
    }
    static ColorSelectPopup* create(ColorAction* action) {
    	return ColorSelectPopup::create(nullptr, nullptr, action);
    }
    static ColorSelectPopup* create(EffectGameObject* effect, cocos2d::CCArray* array, ColorAction* action) = win 0x8da30, imac 0x70dc00;
    static ColorSelectPopup* create(EffectGameObject* effect, cocos2d::CCArray* array) {
    	return ColorSelectPopup::create(effect, array, nullptr);
    }

    void closeColorSelect(cocos2d::CCObject*) = win 0x914a0, imac 0x710680;
    static gd::string colorToHex(cocos2d::ccColor3B) = win 0x926d0;
    cocos2d::ccColor3B const& getColorValue();
    static cocos2d::ccColor3B hexToColor(gd::string) = win 0x91a60;
    bool init(EffectGameObject*, cocos2d::CCArray*, ColorAction*) = win 0x8dc20, imac 0x70df30;
    void onCopy(cocos2d::CCObject* sender) = win 0x90d60;
    void onCopyOpacity(cocos2d::CCObject* sender) = win 0x90b00;
    void onDefault(cocos2d::CCObject* sender) = win 0x90e60;
    void onHSVLegacyMode(cocos2d::CCObject* sender);
    void onPaste(cocos2d::CCObject* sender) = win 0x90de0;
    void onPlayerColor1(cocos2d::CCObject* sender);
    void onPlayerColor2(cocos2d::CCObject* sender);
    void onSelectSpecialColor(cocos2d::CCObject* sender);
    void onTintGround(cocos2d::CCObject* sender);
    void onToggleHSVMode(cocos2d::CCObject* sender) = win 0x93500;
    void onToggleTintMode(cocos2d::CCObject* sender) = win 0x909b0;
    void onUpdateCopyColor(cocos2d::CCObject* sender) = win 0x93420;
    void onUpdateCustomColor(cocos2d::CCObject* sender) = win 0x92c50;
    void selectColor(cocos2d::ccColor3B);
    void sliderChanged(cocos2d::CCObject* sender);
    void updateColorLabels();
    void updateColorValue();
    void updateCopyColor() = win 0x93830;
    void updateCopyColorTextInputLabel();
    void updateCustomColorIdx() = win 0x93270;
    void updateDuration();
    void updateDurLabel() = imac 0x710ab0;
    void updateHSVMode() = win 0x93540;
    void updateHSVValue();
    void updateOpacity() = win 0x912b0;
    void updateOpacityLabel() = win 0x91430;
    void updateTextInputLabel();

    virtual void show();
    virtual void determineStartValues() = win 0x90390;
    virtual void textChanged(CCTextInputNode*) = win 0x92cd0, imac 0x713f80;
    virtual void colorValueChanged(cocos2d::ccColor3B) = win 0x91750, imac 0x7123e0;
    virtual void colorSelectClosed(GJSpecialColorSelect*, int) = win 0x93690;

    cocos2d::extension::CCControlColourPicker* m_colorPicker;
    bool m_unk3c0;
    cocos2d::CCLabelBMFont* m_opacityLabel;
    Slider* m_fadeTimeSlider;
    Slider* m_opacitySlider;
    CCMenuItemToggler* m_playerColor1Toggle;
    CCMenuItemToggler* m_playerColor2Toggle;
    cocos2d::ccColor3B m_originalColor;
    cocos2d::CCSprite* m_currentColorSprite;
    cocos2d::CCSprite* m_originalColorSprite;
    cocos2d::ccColor3B m_currentColor;
    ColorSelectDelegate* m_delegate;
    float m_fadeTime;
    int m_playerColor;
    int m_blending;
    float m_opacity;
    ColorAction* m_colorAction;
    CCTextInputNode* m_colorInput;
    bool m_backgroundTrigger;
    bool m_tintGround;
    bool m_legacyHSV;
    bool m_colorTrigger;
    bool m_noChannel;
    bool m_newColorTrigger;
    int m_colorID;
    bool m_initalizing;
    int m_copyColorID;
    bool m_copyOpacity;
    ConfigureHSVWidget* m_hsvWidget;
    cocos2d::ccHSVValue m_hsv;
    cocos2d::CCArray* m_colorObjects;
    cocos2d::CCArray* m_copyObjects;
    CCTextInputNode* m_copyColorInput;
    CCTextInputNode* m_fadeTimeInput;
    void* m_unk488;
    void* m_unk490;
    bool m_showCopyObjects;
    CCTextInputNode* m_rInput;
    CCTextInputNode* m_gInput;
    CCTextInputNode* m_bInput;
    CCTextInputNode* m_hexInput;
}

[[link(android)]]
class ColorSetupDelegate {
    virtual void colorSetupClosed(int);
}

[[link(android)]]
class CommentCell : TableViewCell, LikeItemDelegate, FLAlertLayerProtocol {
    // virtual ~CommentCell();
    CommentCell(char const*, float, float);

    TodoReturn incrementDislikes();
    TodoReturn incrementLikes();
    void loadFromComment(GJComment*) = win 0xb5480;
    void onConfirmDelete(cocos2d::CCObject* sender) = win 0xb7850, imac 0x242880;
    TodoReturn onDelete();
    void onGoToLevel(cocos2d::CCObject* sender) = win 0xb7b20, imac 0x2426c0;
    void onLike(cocos2d::CCObject* sender) = win 0xb75f0, imac 0x242790;
    TodoReturn onUndelete();

    void onUnhide(cocos2d::CCObject* sender) = win 0xb7b00, imac 0x242770;
    void onViewProfile(cocos2d::CCObject* sender) = imac 0x242690;
    void updateBGColor(int);
    void updateLabelValues();

    virtual bool init() = win 0xb5460, imac 0x242660;
    virtual void draw();
    virtual void likedItem(LikeItemType, int, bool) = win 0xb7750, imac 0x242a40;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xb79c0, imac 0x242de0;

    cocos2d::CCSprite* m_iconSprite;
    cocos2d::CCLabelBMFont* m_likeLabel;
    GJComment* m_comment;
    bool m_accountComment;
}

[[link(android)]]
class CommentUploadDelegate {
    virtual void commentUploadFinished(int);
    virtual void commentUploadFailed(int, CommentError);
    virtual void commentDeleteFailed(int, int) {}
}

[[link(android)]]
class CommunityCreditNode : cocos2d::CCNode {
    // virtual ~CommunityCreditNode();

    static CommunityCreditNode* create(int, int, int, gd::string) = win 0x93ec0;

    bool init(int unlockType, int iconID, int unknown, gd::string author) {
    	if (!CCNode::init()) return false;
    	m_unlockType = unlockType;
    	m_iconID = iconID;
    	m_unknown = unknown;
    	m_author = author;
    	return true;
    }

    int m_unlockType;
    int m_iconID;
    int m_unknown;
    gd::string m_author;
}

[[link(android)]]
class CommunityCreditsPage : FLAlertLayer {
    // virtual ~CommunityCreditsPage();
    	CommunityCreditsPage() {
    	m_pageObjects = nullptr;
    	m_prevButton = nullptr;
    	m_nextButton = nullptr;
    	m_page = -1;
    }

    static CommunityCreditsPage* create() {
    	auto ret = new CommunityCreditsPage();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void FLAlert_Clicked(FLAlertLayer*, bool);
    void goToPage(int) = win 0x96040;
    void onClose(cocos2d::CCObject* sender);
    void onSwitchPage(cocos2d::CCObject* sender);

    virtual bool init() = win 0x94000, imac 0x309d40;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void show();

    cocos2d::CCDictionary* m_pageObjects;
    CCMenuItemSpriteExtra* m_prevButton;
    CCMenuItemSpriteExtra* m_nextButton;
    int m_page;
}

[[link(android)]]
class ConfigureHSVWidget : cocos2d::CCNode, TextInputDelegate {
    // virtual ~ConfigureHSVWidget();

    static ConfigureHSVWidget* create(cocos2d::ccHSVValue, bool, bool) = win 0x96950, imac 0x41c3b0;

    void createTextInputNode(cocos2d::CCPoint, int) = win 0x97300, imac 0x41d110;
    static cocos2d::ccHSVValue getHSV(GameObject*, cocos2d::CCArray*, int) = win 0x980a0, imac 0x41df10;
    bool init(cocos2d::ccHSVValue, bool, bool) = win 0x96a20, imac 0x41c760;
    void onClose() = imac 0x41c480;
    void onResetHSV(cocos2d::CCObject* sender) = win 0x97b10, imac 0x41d530;
    void onToggleSConst(cocos2d::CCObject* sender);
    void onToggleVConst(cocos2d::CCObject* sender);
    void sliderChanged(cocos2d::CCObject* sender);
    void updateLabels() = win 0x97b90, imac 0x41d5b0;
    void updateSliders() = win 0x97820, imac 0x41db90;

    virtual void textInputOpened(CCTextInputNode*) {}
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x97560, imac 0x41dcb0;

    cocos2d::CCLabelBMFont* m_hueLabel;
    cocos2d::CCLabelBMFont* m_saturationLabel;
    cocos2d::CCLabelBMFont* m_brightnessLabel;
    Slider* m_hueSlider;
    Slider* m_saturationSlider;
    Slider* m_brightnessSlider;
    cocos2d::ccHSVValue m_hsv;
    bool m_mixed;
    HSVWidgetDelegate* m_delegate;
    bool m_addInputs;
    bool m_updating;
    cocos2d::CCDictionary* m_inputs;
}

[[link(android)]]
class ConfigureValuePopup : FLAlertLayer, TextInputDelegate {
    // virtual ~ConfigureValuePopup();

    static ConfigureValuePopup* create(ConfigureValuePopupDelegate*, float, float, float, gd::string, gd::string) = win 0x983a0;

    bool init(ConfigureValuePopupDelegate*, float, float, float, gd::string, gd::string) = win 0x98550;
    void onClose(cocos2d::CCObject* sender) = win 0x98f30;
    void sliderChanged(cocos2d::CCObject* sender) = win 0x98d00, imac 0x60c7d0;
    void updateTextInputLabel() = win 0x98d50, imac 0x60c820;

    virtual void keyBackClicked();
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x98de0, imac 0x60c980;

    float m_value;
    float m_minimum;
    float m_maximum;
    bool m_enableDelegate;
    bool m_disableTextDelegate;
    ConfigureValuePopupDelegate* m_delegate;
    CCTextInputNode* m_input;
    Slider* m_slider;
}

[[link(android)]]
class ConfigureValuePopupDelegate {
    virtual TodoReturn valuePopupClosed(ConfigureValuePopup*, float);
}

[[link(android)]]
class CountTriggerAction {
    // CountTriggerAction(CountTriggerAction&&);

    bool m_unk0;
    int m_previousCount;
    int m_targetCount;
    int m_targetGroup;
    bool m_unk10;
    int m_unk14;
    int m_unk18;
    int m_itemID;
    bool m_multiActivate;
    gd::vector<int> m_unkVecInt;
}

[[link(android)]]
class CountTriggerGameObject : EffectGameObject {
    // virtual ~CountTriggerGameObject();

    static CountTriggerGameObject* create(char const*);

    bool init(char const*);

    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = imac 0x1c4bf0;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);

    int m_pickupCount;
    int m_pickupTriggerMode;
    bool m_unkPickupBool1;
    bool m_isOverride;
    float m_pickupTriggerMultiplier;
}

[[link(android)]]
class CreateGuidelinesLayer : FLAlertLayer, FLAlertLayerProtocol {
    // virtual ~CreateGuidelinesLayer();

    static CreateGuidelinesLayer* create(CustomSongDelegate*, AudioGuidelinesType);

    TodoReturn doClearGuidelines();
    TodoReturn getMergedRecordString(gd::string, gd::string);
    bool init(CustomSongDelegate*, AudioGuidelinesType);
    void onClearGuidelines(cocos2d::CCObject* sender);
    void onStop(cocos2d::CCObject* sender);
    TodoReturn toggleItems(bool);

    virtual void update(float) = win 0x9adf0, imac 0x4f6310;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x9b0c0, imac 0x4f6580;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x9b140;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x9b040;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x9b1f0, imac 0x4f67b0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x9af60, imac 0x4f63e0;
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void keyUp(cocos2d::enumKeyCodes) {}
    virtual TodoReturn playMusic() = win 0x9a6a0;
    virtual TodoReturn registerTouch() = win 0x9b060, imac 0x4f6530;
    virtual void onInfo(cocos2d::CCObject* sender) = win 0x9ae10;
    virtual void onRecord(cocos2d::CCObject* sender) = win 0x9a510, imac 0x4f5880;
    virtual TodoReturn recordingDidStop() = win 0x9a800;
}

[[link(android)]]
class CreateMenuItem : CCMenuItemSpriteExtra {
    // virtual ~CreateMenuItem();

    static CreateMenuItem* create(cocos2d::CCNode*, cocos2d::CCNode*, cocos2d::CCObject*, cocos2d::SEL_MenuHandler) = win 0x1276e0, imac 0x2ec00;

    bool init(cocos2d::CCNode*, cocos2d::CCNode*, cocos2d::CCObject*, cocos2d::SEL_MenuHandler);

    gd::string m_spriteFileName;
    int m_objectID;
}

[[link(android)]]
class CreateParticlePopup : FLAlertLayer, TextInputDelegate, ColorSelectDelegate, SliderDelegate {
    // virtual ~CreateParticlePopup();

    static CreateParticlePopup* create(gd::string);
    static CreateParticlePopup* create(ParticleGameObject*, cocos2d::CCArray*, gd::string);
    static CreateParticlePopup* create(ParticleGameObject*, cocos2d::CCArray*) = win 0x414000, imac 0x45af90;

    TodoReturn centerAlignParticle(cocos2d::CCObject*);
    TodoReturn createParticleSlider(gjParticleValue, int, bool, cocos2d::CCPoint, cocos2d::CCArray*);
    TodoReturn getPage(int);
    TodoReturn getPageButton(int);
    TodoReturn getPageContainer(int);
    TodoReturn getPageInputNodes(int);
    TodoReturn getPageMenu(int);
    TodoReturn getPageSliders(int);
    bool init(ParticleGameObject*, cocos2d::CCArray*, gd::string) = win 0x4141f0;
    TodoReturn maxSliderValueForType(gjParticleValue);
    TodoReturn minSliderValueForType(gjParticleValue);
    void onAnimateActiveOnly(cocos2d::CCObject* sender);
    void onAnimateOnTrigger(cocos2d::CCObject* sender);
    void onCalcEmission(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender) = win 0x41cda0, imac 0x45f890;
    void onCopySettings(cocos2d::CCObject* sender);
    void onDuplicateColor(cocos2d::CCObject* sender);
    void onDurationForever(cocos2d::CCObject* sender);
    void onDynamicColor(cocos2d::CCObject* sender);
    void onDynamicRotation(cocos2d::CCObject* sender);
    void onEmitterMode(cocos2d::CCObject* sender);
    void onEndRGBVarSync(cocos2d::CCObject* sender);
    void onMaxEmission(cocos2d::CCObject* sender);
    void onMode(cocos2d::CCObject* sender);
    void onOrderSensitive(cocos2d::CCObject* sender);
    void onPage(cocos2d::CCObject* sender);
    void onPasteSettings(cocos2d::CCObject* sender);
    void onPosType(cocos2d::CCObject* sender);
    void onQuickStart(cocos2d::CCObject* sender);
    void onSelectColor(cocos2d::CCObject* sender);
    void onSelectParticleTexture(cocos2d::CCObject* sender);
    void onStartRGBVarSync(cocos2d::CCObject* sender);
    void onToggleBlending(cocos2d::CCObject* sender);
    void onToggleStartRadiusEqualToEnd(cocos2d::CCObject* sender);
    void onToggleStartRotationIsDir(cocos2d::CCObject* sender);
    void onToggleStartSizeEqualToEnd(cocos2d::CCObject* sender);
    void onToggleStartSpinEqualToEnd(cocos2d::CCObject* sender);
    void onUniformColor(cocos2d::CCObject* sender);
    TodoReturn particleValueIsInt(gjParticleValue);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn titleForParticleValue(gjParticleValue);
    TodoReturn toggleGravityMode(bool);
    TodoReturn updateColorSprite(int);
    TodoReturn updateInputNodeStringForType(gjParticleValue);
    TodoReturn updateParticleValueForType(float, gjParticleValue, cocos2d::CCParticleSystemQuad*);
    TodoReturn updateSliderForType(gjParticleValue);
    TodoReturn valueForParticleValue(gjParticleValue);
    void willClose();

    virtual void update(float) = imac 0x462d80;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x41cef0, imac 0x463900;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x41cff0, imac 0x463a10;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x41d420;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void keyBackClicked() = win 0x41cee0;
    virtual void sliderBegan(Slider*) = win 0x41c620, imac 0x463620;
    virtual void sliderEnded(Slider*) = win 0x41c6e0, imac 0x463700;
    virtual void colorSelectClosed(cocos2d::CCNode*) = win 0x419c90, imac 0x462af0;
    virtual void textInputShouldOffset(CCTextInputNode*, float);
    virtual void textInputReturn(CCTextInputNode*);
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x41a530, imac 0x462f30;

    ParticleGameObject* m_targetObject;
    cocos2d::CCArray* m_targetObjects;
    cocos2d::CCArray* m_particles;
    bool m_unkBool;
    cocos2d::CCParticleSystemQuad* m_particle;
    // there's more but idc about them
}

[[link(android)]]
class CreatorLayer : cocos2d::CCLayer, cocos2d::CCSceneTransitionDelegate, DialogDelegate {
    // virtual ~CreatorLayer();
    	CreatorLayer() {
    	m_secretDoorSprite = nullptr;
    	m_questsSprite = nullptr;
    	m_vaultDialogIndex = -1;
    	m_versusDialogIndex = 0;
    }

    static CreatorLayer* create() {
    	auto ret = new CreatorLayer();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static cocos2d::CCScene* scene() = win 0x9b9a0;

    bool canPlayOnlineLevels();
    void checkQuestsStatus() = imac 0x286740;
    void onAdventureMap(cocos2d::CCObject* sender) = win 0x9dbe0, imac 0x286190;
    void onBack(cocos2d::CCObject* sender);
    void onChallenge(cocos2d::CCObject* sender) = win 0x9ddb0, imac 0x286200;
    void onDailyLevel(cocos2d::CCObject* sender) = win 0x9dd50;
    void onEventLevel(cocos2d::CCObject* sender);
    void onFameLevels(cocos2d::CCObject* sender);
    void onFeaturedLevels(cocos2d::CCObject* sender) = win 0x9d2a0;
    void onGauntlets(cocos2d::CCObject* sender);
    void onLeaderboards(cocos2d::CCObject* sender) = win 0x9d0f0;
    void onMapPacks(cocos2d::CCObject* sender) = win 0x9d4d0;
    void onMultiplayer(cocos2d::CCObject* sender) = win 0x9d610;
    void onMyLevels(cocos2d::CCObject* sender) = win 0x9cce0;
    void onOnlineLevels(cocos2d::CCObject* sender) = win 0x9d450;
    void onOnlyFullVersion(cocos2d::CCObject* sender);
    void onPaths(cocos2d::CCObject* sender);
    void onSavedLevels(cocos2d::CCObject* sender) = win 0x9cef0;
    void onSecretVault(cocos2d::CCObject* sender);
    void onTopLists(cocos2d::CCObject* sender) = win 0x9d380, imac 0x286360;
    void onTreasureRoom(cocos2d::CCObject* sender);
    void onWeeklyLevel(cocos2d::CCObject* sender) = win 0x9dd70;

    virtual bool init() = win 0x9bb10;
    virtual void keyBackClicked() = win 0x9f2b0;
    virtual void sceneWillResume();
    virtual void dialogClosed(DialogLayer*) = win 0x9f0d0;

    cocos2d::CCSprite* m_secretDoorSprite;
    cocos2d::CCSprite* m_questsSprite;
    int m_vaultDialogIndex;
    int m_versusDialogIndex;
}

[[link(android)]]
class CurrencyRewardDelegate {
    virtual void currencyWillExit(CurrencyRewardLayer*) {}
}

[[link(android)]]
class CurrencyRewardLayer : cocos2d::CCLayer {
    // virtual ~CurrencyRewardLayer();
    // CurrencyRewardLayer();

    static CurrencyRewardLayer* create(int orbs, int stars, int moons, int diamonds, CurrencySpriteType demonKey, int keyCount, CurrencySpriteType shardType, int shardsCount, cocos2d::CCPoint position, CurrencyRewardType, float, float time) = win 0x9f500, imac 0x78f310;

    void createObjects(CurrencySpriteType type, int count, cocos2d::CCPoint position, float time) {
    	this->createObjectsFull(type, count, nullptr, position, time);
    }
    void createObjectsFull(CurrencySpriteType, int, cocos2d::CCSprite*, cocos2d::CCPoint, float) = win 0xa1520, imac 0x7915e0;
    void createUnlockObject(cocos2d::CCSprite* sprite, cocos2d::CCPoint position, float time) {
    	this->createObjectsFull(CurrencySpriteType::Icon, 1, sprite, position, time);
    }
    void incrementCount(int count) {
    	if (m_orbsLabel == nullptr) return;
    	m_orbs += count;
    	this->pulseSprite(m_orbsSprite);
    	m_orbsLabel->setString(cocos2d::CCString::createWithFormat("%i", count)->getCString());
    }
    void incrementDiamondsCount(int count) {
    	if (m_diamondsLabel == nullptr) return;
    	m_diamonds += count;
    	this->pulseSprite(m_diamondsSprite);
    	m_diamondsLabel->setString(cocos2d::CCString::createWithFormat("%i", count)->getCString());
    }
    void incrementMoonsCount(int count) {
    	if (m_moonsLabel == nullptr) return;
    	m_moons += count;
    	this->pulseSprite(m_moonsSprite);
    	m_moonsLabel->setString(cocos2d::CCString::createWithFormat("%i", count)->getCString());
    }
    void incrementSpecialCount1(int count) {
    	if (m_keysLabel == nullptr) return;
    	m_keys += count;
    	this->pulseSprite(m_keysSprite);
    	m_keysLabel->setString(cocos2d::CCString::createWithFormat("%i", count)->getCString());
    }
    void incrementSpecialCount2(int count) {
    	if (m_shardsLabel == nullptr) return;
    	m_shards += count;
    	this->pulseSprite(m_shardsSprite);
    	m_shardsLabel->setString(cocos2d::CCString::createWithFormat("%i", count)->getCString());
    }
    void incrementStarsCount(int count) {
    	if (m_starsLabel == nullptr) return;
    	m_stars += count;
    	this->pulseSprite(m_starsSprite);
    	m_starsLabel->setString(cocos2d::CCString::createWithFormat("%i", count)->getCString());
    }
    bool init(int, int, int, int, CurrencySpriteType, int, CurrencySpriteType, int, cocos2d::CCPoint, CurrencyRewardType, float, float) = win 0x9f750, imac 0x78f3f0;
    void pulseSprite(cocos2d::CCSprite*) = win 0xa2c00, imac 0x7933b0;

    virtual void update(float) = win 0xa2230, imac 0x7923e0;

    CurrencyRewardDelegate* m_delegate;
    cocos2d::CCArray* m_objects;
    cocos2d::CCLabelBMFont* m_orbsLabel;
    cocos2d::CCLabelBMFont* m_starsLabel;
    cocos2d::CCLabelBMFont* m_moonsLabel;
    cocos2d::CCLabelBMFont* m_diamondsLabel;
    cocos2d::CCLabelBMFont* m_keysLabel;
    cocos2d::CCLabelBMFont* m_shardsLabel;
    cocos2d::CCSprite* m_orbsSprite;
    cocos2d::CCSprite* m_starsSprite;
    cocos2d::CCSprite* m_moonsSprite;
    cocos2d::CCSprite* m_diamondsSprite;
    CurrencySprite* m_keysSprite;
    CurrencySprite* m_shardsSprite;
    cocos2d::CCSpriteBatchNode* m_currencyBatchNode;
    cocos2d::CCSpriteBatchNode* m_orbBatchNode;
    int m_orbs;
    int m_stars;
    int m_moons;
    int m_diamonds;
    int m_keys;
    int m_shards;
    float m_elapsed;
    int m_unknown;
    float m_time;
    cocos2d::CCPoint m_orbsPosition;
    cocos2d::CCPoint m_starsPosition;
    cocos2d::CCPoint m_moonsPosition;
    cocos2d::CCPoint m_diamondsPosition;
    cocos2d::CCPoint m_keysPosition;
    cocos2d::CCPoint m_shardsPosition;
    bool m_particlesAdded;
    bool m_objectsAdded;
    cocos2d::CCNode* m_mainNode;
    int m_rewardCount;
    CurrencyRewardType m_rewardType;
}

[[link(android)]]
class CurrencySprite : CCSpritePlus {
    // virtual ~CurrencySprite();
    CurrencySprite() = win 0x9f3c0;

    static CurrencySprite* create(CurrencySpriteType type, bool burst) {
    	auto ret = new CurrencySprite();
    	if (ret->init(type, burst)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    static CurrencySprite* createWithSprite(cocos2d::CCSprite*) = win 0xa44b0;
    bool init(CurrencySpriteType, bool) = win 0xa2cd0;
    bool initWithSprite(cocos2d::CCSprite*) = imac 0x793ee0;
    static CurrencySpriteType rewardToSpriteType(int);
    static gd::string spriteTypeToStat(CurrencySpriteType) = win 0xa4780, imac 0x791330;

    float m_unkFloat1;
    float m_unkFloat2;
    float m_unkFloat3;
    float m_remaining;
    int m_count;
    cocos2d::CCParticleSystemQuad* m_particleSystem;
    CurrencySpriteType m_spriteType;
    cocos2d::CCPoint m_position;
    cocos2d::CCSprite* m_burstSprite;
}

[[link(android)]]
class CustomizeObjectLayer : FLAlertLayer, TextInputDelegate, HSVWidgetDelegate, ColorSelectDelegate, ColorSetupDelegate {
    // virtual ~CustomizeObjectLayer();
    //CustomizeObjectLayer() = ios 0x577b8;

    static CustomizeObjectLayer* create(GameObject*, cocos2d::CCArray*) = win 0xa4b60;

    TodoReturn createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint);
    TodoReturn determineStartValues();
    int getActiveMode(bool) = win 0xa8cb0, imac 0x1e5ce0;
    TodoReturn getButtonByTag(int) = win 0xa9520;
    TodoReturn getHSV();
    void highlightSelected(ButtonSprite*) = win 0xa97d0, imac 0x1e6600;
    bool init(GameObject*, cocos2d::CCArray*) = win 0xa4d00, imac 0x1e2a20;
    void onBreakApart(cocos2d::CCObject* sender);
    void onBrowse(cocos2d::CCObject* sender);
    void onClear(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender) = win 0xa9900;
    void onCopy(cocos2d::CCObject* sender);
    void onEditColor(cocos2d::CCObject* sender);
    void onHSV(cocos2d::CCObject* sender) = win 0xa8470;
    void onLiveEdit(cocos2d::CCObject* sender);
    void onNextColorChannel(cocos2d::CCObject* sender);
    void onPaste(cocos2d::CCObject* sender);
    void onSelectColor(cocos2d::CCObject* sender) = win 0xa95a0, imac 0x1e5390;
    void onSelectMode(cocos2d::CCObject* sender) = win 0xa88e0, imac 0x1e4e00;
    void onSettings(cocos2d::CCObject* sender);
    void onUpdateCustomColor(cocos2d::CCObject* sender) = win 0xa8ea0, imac 0x1e5440;
    TodoReturn recreateLayer();
    void sliderChanged(cocos2d::CCObject*);
    void toggleVisible() = win 0xa8af0, imac 0x1e6b20;
    void updateChannelLabel(int channel) {
    	if (channel > 999) {
    		m_selectedColorLabel->setString(GJSpecialColorSelect::textForColorIdx(channel));
    	}
    	else if (channel > 0) {
    		// Technically not identical to RobTop impl which uses `CCString::createWithFormat`
    		m_selectedColorLabel->setString(std::to_string(channel).c_str());
    	}
    	else {
    		m_selectedColorLabel->setString(" ");
    	}
    }
    void updateColorSprite() = win 0xa7e20, imac 0x1e5eb0;
    void updateCurrentSelection();
    void updateCustomColorLabels() = win 0xa9490, imac 0x1e5510;
    void updateHSVButtons() = win 0xa8270;
    void updateKerningLabel();
    void updateSelected(int) = win 0xa9660, imac 0x1e6470;

    virtual void keyBackClicked();
    virtual void textInputOpened(CCTextInputNode*) = win 0xa8f70, imac 0x1e6c80;
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0xa9100, imac 0x1e6dd0;
    virtual void hsvPopupClosed(HSVWidgetPopup*, cocos2d::ccHSVValue) = win 0xa86a0, imac 0x1e6a30;
    virtual void colorSelectClosed(cocos2d::CCNode*) = win 0xa8030, imac 0x1e67d0;
    virtual void colorSetupClosed(int) = win 0xa7c90, imac 0x1e6360;

    GameObject* m_targetObject;
    cocos2d::CCArray* m_targetObjects;
    cocos2d::CCArray* m_colorButtons;
    cocos2d::CCArray* m_colorTabNodes;
    cocos2d::CCArray* m_textTabNodes;
    cocos2d::CCArray* m_unkArray;
    cocos2d::CCArray* m_detailTabNodes;
    int m_selectedMode;
    int m_customColorChannel;
    bool m_unk0x200;
    bool m_unk0x201;
    bool m_glowDisabled;
    CCMenuItemSpriteExtra* m_baseButton;
    CCMenuItemSpriteExtra* m_detailButton;
    CCMenuItemSpriteExtra* m_textButton;
    CCMenuItemSpriteExtra* m_baseColorHSV;
    CCMenuItemSpriteExtra* m_detailColorHSV;
    cocos2d::CCLabelBMFont* m_titleLabel;
    cocos2d::CCLabelBMFont* m_selectedColorLabel;
    CCTextInputNode* m_customColorInput;
    CCTextInputNode* m_textInput;
    int m_kerningAmount;
    cocos2d::CCLabelBMFont* m_kerningLabel;
    Slider* m_kerningSlider;
    ButtonSprite* m_customColorButtonSprite;
    CCMenuItemSpriteExtra* m_customColorButton;
    CCMenuItemSpriteExtra* m_arrowDown;
    CCMenuItemSpriteExtra* m_arrowUp;
    cocos2d::extension::CCScale9Sprite* m_customColorInputBG;
    ColorChannelSprite* m_colorSprite;
    CCMenuItemSpriteExtra* m_colorSpriteButton;
    CCMenuItemSpriteExtra* m_liveSelectButton;
    bool m_showTextInput;
    bool m_customColorSelected;
}

[[link(android)]]
class CustomizeObjectSettingsPopup : SetupTriggerPopup {
    // virtual ~CustomizeObjectSettingsPopup();

    static CustomizeObjectSettingsPopup* create(GameObject*, cocos2d::CCArray*, CustomizeObjectLayer*);

    bool init(GameObject*, cocos2d::CCArray*, CustomizeObjectLayer*);

    virtual void onClose(cocos2d::CCObject* sender) = win 0xa9e50, imac 0x1e7620;
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = win 0xa9da0, imac 0x1e75b0;
}

[[link(android)]]
class CustomListView : BoomListView {
    inline CustomListView() {}
    ~CustomListView() {}

    static CustomListView* create(cocos2d::CCArray*, TableViewCellDelegate*, float, float, int, BoomListType, float) = win 0xaa010, imac 0x22e450;

    static CustomListView* create(cocos2d::CCArray* entries, BoomListType type, float width, float height) {
    	return CustomListView::create(entries, nullptr, width, height, 0, type, 0.0f);
    }

    float getCellHeight(BoomListType) = imac 0x22f660;
    void reloadAll() = win 0xabc90;

    virtual void setupList(float) = win 0xab5c0;
    virtual TableViewCell* getListCell(char const*) = win 0xaa140, imac 0x22e590;
    virtual void loadCell(TableViewCell*, int) = win 0xaaf00, imac 0x230130;

    int m_unknown;
}

[[link(android)]]
class CustomMusicCell : CustomSongCell {
    // virtual ~CustomMusicCell();
    CustomMusicCell(char const*, float, float);

    void loadFromObject(SongInfoObject*) = win 0xb46f0, imac 0x231ea0;
    void updateBGColor(int);
}

[[link(android)]]
class CustomSFXCell : TableViewCell, CustomSFXDelegate {
    // virtual ~CustomSFXCell();
    CustomSFXCell(char const*, float, float);

    void loadFromObject(SFXInfoObject*) = win 0xb4430;
    TodoReturn shouldReload();
    void updateBGColor(int) = win 0xb4560;

    virtual bool init() = win 0xb4410, imac 0x241aa0;
    virtual void draw();
    virtual void sfxObjectSelected(SFXInfoObject*) = win 0xb4520, imac 0x241ac0;
    virtual TodoReturn getActiveSFXID() = win 0xb4110;
}

[[link(android)]]
class CustomSFXDelegate {
    virtual void sfxObjectSelected(SFXInfoObject*);
    virtual TodoReturn getActiveSFXID();
    virtual TodoReturn overridePlaySFX(SFXInfoObject*);
}

[[link(android)]]
class CustomSFXWidget : cocos2d::CCNode, MusicDownloadDelegate, FLAlertLayerProtocol {
    // virtual ~CustomSFXWidget();

    static CustomSFXWidget* create(SFXInfoObject*, CustomSFXDelegate*, bool, bool, bool, bool, bool);

    TodoReturn deleteSFX();
    void downloadFailed();
    TodoReturn hideLoadingArt();
    bool init(SFXInfoObject*, CustomSFXDelegate*, bool, bool, bool, bool, bool) = imac 0x5c9b50;
    void onCancelDownload(cocos2d::CCObject* sender);
    void onDelete(cocos2d::CCObject* sender);
    void onDownload(cocos2d::CCObject* sender);
    void onPlayback(cocos2d::CCObject* sender);
    void onSelect(cocos2d::CCObject* sender);
    void showLoadingArt();
    TodoReturn startDownload();
    TodoReturn startMonitorDownload();
    TodoReturn updateDownloadProgress(float);
    TodoReturn updateError(GJSongError);
    TodoReturn updateLengthMod(float);
    TodoReturn updatePlaybackBtn();
    TodoReturn updateProgressBar(int);
    TodoReturn updateSFXInfo() = imac 0x5cb040;
    TodoReturn updateSFXObject(SFXInfoObject*);
    TodoReturn verifySFXID(int);

    virtual void downloadSFXFinished(int) = win 0xc18e0;
    virtual void downloadSFXFailed(int, GJSongError) = win 0xc1960, imac 0x5cbd30;
    virtual void songStateChanged() = win 0xc1230;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xc1a60, imac 0x5cbf10;
}

[[link(android)]]
class CustomSongCell : TableViewCell, CustomSongDelegate {
    // virtual ~CustomSongCell();
    CustomSongCell(char const*, float, float);

    void loadFromObject(SongInfoObject*) = win 0xb3f10, imac 0x231ca0;
    void onDelete(cocos2d::CCObject* sender);
    TodoReturn shouldReload();
    void updateBGColor(int);

    virtual bool init();
    virtual void draw();
    virtual TodoReturn songIDChanged(int) = win 0xb40d0, imac 0x241790;
    virtual TodoReturn getActiveSongID();
    virtual TodoReturn getSongFileName() = win 0xb4130;
    virtual LevelSettingsObject* getLevelSettings();

    SongInfoObject* m_songInfoObject;
    bool m_unkBool;
}

[[link(android)]]
class CustomSongDelegate {
    virtual TodoReturn songIDChanged(int);
    virtual TodoReturn getActiveSongID();
    virtual TodoReturn getSongFileName();
    virtual LevelSettingsObject* getLevelSettings();
}

[[link(android)]]
class CustomSongLayer : FLAlertLayer, TextInputDelegate, GJDropDownLayerDelegate, MusicBrowserDelegate {
    // virtual ~CustomSongLayer();
    CustomSongLayer() {
    	m_songDelegate = nullptr;
    	m_songIDInput = nullptr;
    	m_delegate = nullptr;
    }

    static CustomSongLayer* create(CustomSongDelegate* delegate) {
    	auto ret = new CustomSongLayer();
    	if (ret->init(delegate)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(CustomSongDelegate*) = win 0xc1f00;
    void onClose(cocos2d::CCObject* sender) = win 0xc3690;
    void onCreateLines(cocos2d::CCObject* sender);
    void onMusicBrowser(cocos2d::CCObject* sender) = win 0xc31a0, imac 0x203750;
    void onNCSBrowser(cocos2d::CCObject* sender) = imac 0x203730;
    void onNewgroundsBrowser(cocos2d::CCObject* sender) = win 0xc3300;
    void onOptions(cocos2d::CCObject* sender) = imac 0x203800;
    void onSearch(cocos2d::CCObject* sender) = win 0xc2c80;
    void onSongBrowser(cocos2d::CCObject* sender);
    void showNewgroundsMessage();

    virtual void keyBackClicked() = win 0xc3760;
    virtual void show() = win 0xc3770, imac 0x2042a0;
    virtual void textChanged(CCTextInputNode*);
    virtual void textInputOpened(CCTextInputNode*);
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textInputShouldOffset(CCTextInputNode*, float);
    virtual void textInputReturn(CCTextInputNode*);
    virtual void dropDownLayerWillClose(GJDropDownLayer*);
    virtual void musicBrowserClosed(MusicBrowser*);

    CustomSongDelegate* m_songDelegate;
    CCTextInputNode* m_songIDInput;
    CustomSongWidget* m_songWidget;
    CustomSongLayerDelegate* m_delegate;
}

[[link(android)]]
class CustomSongLayerDelegate {
    virtual void customSongLayerClosed() {}
}

[[link(android), depends(GJAssetDownloadAction)]]
class CustomSongWidget : cocos2d::CCNode, MusicDownloadDelegate, FLAlertLayerProtocol {
    // virtual ~CustomSongWidget();
    	CustomSongWidget() {
    	m_songInfoObject = nullptr;
    	m_buttonMenu = nullptr;
    	m_songLabel = nullptr;
    	m_artistLabel = nullptr;
    	m_songIDLabel = nullptr;
    	m_errorLabel = nullptr;
    	m_downloadBtn = nullptr;
    	m_cancelDownloadBtn = nullptr;
    	m_selectSongBtn = nullptr;
    	m_getSongInfoBtn = nullptr;
    	m_playbackBtn = nullptr;
    	m_moreBtn = nullptr;
    	m_deleteBtn = nullptr;
    	m_infoBtn = nullptr;
    	m_sliderGroove = nullptr;
    	m_sliderBar = nullptr;
    	m_ncsLogo = nullptr;
    	m_bgSpr = nullptr;
    	m_songDelegate = nullptr;
    	m_showSelectSongBtn = false;
    	m_showPlayMusicBtn = false;
    	m_showDownloadBtn = false;
    	m_isNotDownloading = false;
    	m_isRobtopSong = false;
    	m_isMusicLibrary = false;
    	m_customSongID = 0;
    	m_lengthMod = 0.f;
    	m_unkPtr = nullptr;
    	m_unkPtr2 = nullptr;
    	m_hasLibrarySongs = false;
    	m_hasSFX = false;
    	m_unkBool2 = false;
    	m_songs = {};
    	m_sfx = {};
    	m_undownloadedAssets = {};
    }

    static CustomSongWidget* create(SongInfoObject* songInfo, CustomSongDelegate* songDelegate, bool showSongSelect, bool showPlayMusic, bool showDownload, bool isRobtopSong, bool unkBool, bool isMusicLibrary, int unk) = win 0xc74f0, imac 0x602400;

    void deleteSong() = win 0xc9160;
    void downloadAssetFailed(int, GJAssetType, GJSongError) = win 0xcc4a0;
    void downloadAssetFinished(int, GJAssetType) = win 0xcc3e0, imac 0x6082e0;
    void downloadFailed() = imac 0x608190;
    void getSongInfoIfUnloaded() = win 0xc9af0, imac 0x606830;
    bool init(SongInfoObject* songInfo, CustomSongDelegate* songDelegate, bool showSongSelect, bool showPlayMusic, bool showDownload, bool isRobtopSong, bool unkBool, bool isMusicLibrary, int unk) = win 0xc7700;
    void onCancelDownload(cocos2d::CCObject* sender);
    void onDelete(cocos2d::CCObject* sender) = win 0xc9040;
    void onDownload(cocos2d::CCObject* sender) = win 0xc9cd0, imac 0x603720;
    void onGetSongInfo(cocos2d::CCObject* sender) = win 0xc9c40, imac 0x603b30;
    void onInfo(cocos2d::CCObject* sender) = win 0xc8d50;
    void onMore(cocos2d::CCObject* sender) = win 0xc9360;
    void onPlayback(cocos2d::CCObject* sender) = win 0xc9fd0, imac 0x603bc0;
    void onSelect(cocos2d::CCObject* sender) = win 0xc9f70, imac 0x603ad0;
    void processNextMultiAsset() = win 0xcc240, imac 0x608810;
    void showError(bool) = win 0xcc710;
    void startDownload() = win 0xc9eb0;
    TodoReturn startMonitorDownload();
    void startMultiAssetDownload() = win 0xcc0a0;
    TodoReturn toggleUpdateButton(bool);
    void updateDownloadProgress(float) = win 0xca4a0;
    void updateError(GJSongError) = win 0xcc640, imac 0x608060;
    void updateLengthMod(float lengthMod) {
    	this->m_lengthMod = lengthMod;
    	this->updateSongInfo();
    }
    void updateMultiAssetInfo(bool) = win 0xcb760, imac 0x607780;
    void updatePlaybackBtn() = win 0xca3b0, imac 0x6062c0;
    void updateProgressBar(int);
    void updateSongInfo() = win 0xca600;
    void updateSongObject(SongInfoObject*) = imac 0x605200;
    void updateWithMultiAssets(gd::string, gd::string, int) = win 0xcb410;
    TodoReturn verifySongID(int);
    void positionInfoObjects() = win 0xc88c0;

    virtual void loadSongInfoFinished(SongInfoObject*) = win 0xcbd40, imac 0x607df0;
    virtual void loadSongInfoFailed(int, GJSongError) = win 0xcbe90, imac 0x607fd0;
    virtual void downloadSongFinished(int) = win 0xcbf20, imac 0x608220;
    virtual void downloadSongFailed(int, GJSongError) = win 0xcbfe0, imac 0x608500;
    virtual void downloadSFXFinished(int) = win 0xcc060, imac 0x608690;
    virtual void downloadSFXFailed(int, GJSongError) = win 0xcc080, imac 0x6086c0;
    virtual void musicActionFinished(GJMusicAction) = win 0xcc5c0, imac 0x6089c0;
    virtual void musicActionFailed(GJMusicAction) = win 0xcc5f0;
    virtual void songStateChanged() = win 0xca5d0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xcc960, imac 0x608ac0;

    SongInfoObject* m_songInfoObject;
    cocos2d::CCMenu* m_buttonMenu;
    cocos2d::CCLabelBMFont* m_songLabel;
    cocos2d::CCLabelBMFont* m_artistLabel;
    cocos2d::CCLabelBMFont* m_songIDLabel;
    cocos2d::CCLabelBMFont* m_errorLabel;
    CCMenuItemSpriteExtra* m_downloadBtn;
    CCMenuItemSpriteExtra* m_cancelDownloadBtn;
    CCMenuItemSpriteExtra* m_selectSongBtn;
    CCMenuItemSpriteExtra* m_getSongInfoBtn;
    CCMenuItemSpriteExtra* m_playbackBtn;
    CCMenuItemSpriteExtra* m_moreBtn;
    CCMenuItemSpriteExtra* m_deleteBtn;
    CCMenuItemSpriteExtra* m_infoBtn;
    cocos2d::CCSprite* m_sliderGroove;
    cocos2d::CCSprite* m_sliderBar;
    cocos2d::CCSprite* m_ncsLogo;
    cocos2d::extension::CCScale9Sprite* m_bgSpr;
    CustomSongDelegate* m_songDelegate;
    bool m_showSelectSongBtn;
    bool m_showPlayMusicBtn;
    bool m_showDownloadBtn;
    bool m_isNotDownloading;
    bool m_isRobtopSong;
    bool m_isMusicLibrary;
    int m_customSongID;
    float m_lengthMod;
    void* m_unkPtr;
    void* m_unkPtr2;
    bool m_hasLibrarySongs;
    bool m_hasSFX;
    bool m_unkBool2;
    gd::map<int, bool> m_songs;
    gd::map<int, bool> m_sfx;
    gd::vector<CCObject*> m_undownloadedAssets;
}

[[link(android)]]
class DailyLevelNode : cocos2d::CCNode, FLAlertLayerProtocol {
    // virtual ~DailyLevelNode();

    static DailyLevelNode* create(GJGameLevel*, DailyLevelPage*, bool) = imac 0x21fac0;

    bool init(GJGameLevel*, DailyLevelPage*, bool) = win 0xd0c90, imac 0x2202a0;
    void onClaimReward(cocos2d::CCObject* sender) = win 0xd18f0, imac 0x220d00;
    void onSkipLevel(cocos2d::CCObject* sender) = win 0xd1a10;
    void showSkipButton() = win 0xd1890;
    void updateTimeLabel(gd::string);

    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xd1c30, imac 0x220fd0;

    GJGameLevel* m_level;
    DailyLevelPage* m_page;
    cocos2d::CCLabelBMFont* m_timeLabel;
    cocos2d::CCPoint m_unkPoint;
    CCMenuItemSpriteExtra* m_skipButton;
    bool m_unkBool;
    bool m_needsDownloading;
}

[[link(android)]]
class DailyLevelPage : FLAlertLayer, FLAlertLayerProtocol, GJDailyLevelDelegate, LevelDownloadDelegate {
    // virtual ~DailyLevelPage();
    //DailyLevelPage() = ios 0x1c66c0;

    static DailyLevelPage* create(GJTimedLevelType) = win 0xccfd0;

    void claimLevelReward(DailyLevelNode*, GJGameLevel*, cocos2d::CCPoint) = win 0xd06b0;
    void createDailyNode(GJGameLevel*, bool, float, bool) = win 0xcee40, imac 0x21f0b0;
    void createNodeIfLoaded();
    void downloadAndCreateNode();
    void exitDailyNode(DailyLevelNode*, float) = imac 0x21f520;
    int getDailyTime();
    gd::string getDailyTimeString(int timeLeft) = win 0xcf200, imac 0x21ea20;
    bool init(GJTimedLevelType) = win 0xcd110, imac 0x21dd40;
    void onClose(cocos2d::CCObject* sender) = win 0x86940;
    void onTheSafe(cocos2d::CCObject* sender);
    void refreshDailyPage();
    void skipDailyLevel(DailyLevelNode*, GJGameLevel*);
    void tryGetDailyStatus() = win 0xcec10;
    callback void updateTimers(float) = win 0xd0360;

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void show();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) {}
    virtual void dailyStatusFinished(GJTimedLevelType) = win 0xce560;
    virtual void dailyStatusFailed(GJTimedLevelType, GJErrorCode) = win 0xce860, imac 0x21f6e0;
    virtual void levelDownloadFinished(GJGameLevel*) = win 0xceb90, imac 0x21f930;
    virtual void levelDownloadFailed(int) = win 0xcebf0, imac 0x21f9f0;

    cocos2d::CCLabelBMFont* m_timeLabel;
    LoadingCircle* m_timeCircle;
    LoadingCircle* m_nodeCircle;
    bool m_gettingDailyStatus;
    DailyLevelNode* m_dailyNode;
    bool m_downloadStarted;
    GJTimedLevelType m_type;
    int m_downloadLevelID;
}

[[link(android)]]
class DashRingObject : RingObject {
    // virtual ~DashRingObject();

    static DashRingObject* create(char const*);

    bool init(char const*);

    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class DemonFilterDelegate {
    virtual void demonFilterSelectClosed(int) {}
}

[[link(android)]]
class DemonFilterSelectLayer : FLAlertLayer {
    // virtual ~DemonFilterSelectLayer();
    DemonFilterSelectLayer() {}

    static DemonFilterSelectLayer* create() {
    	auto ret = new DemonFilterSelectLayer();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void onClose(cocos2d::CCObject* sender) = win 0x3032c0;
    void selectRating(cocos2d::CCObject* sender) = win 0x303200;

    virtual bool init() = win 0x302bc0, imac 0x617ec0;
    virtual void keyBackClicked() = win 0x303310;

    cocos2d::CCArray* m_demons;
    void* m_unkPtr;
    int m_currentDemon;
    DemonFilterDelegate* m_delegate;
}

[[link(android)]]
class DemonInfoPopup : FLAlertLayer {
    // ~DemonInfoPopup();

    static DemonInfoPopup* create(int easyClassic, int mediumClassic, int hardClassic, int insaneClassic, int extremeClassic, int easyPlatformer, int mediumPlatformer, int hardPlatformer, int insanePlatformer, int extremePlatformer, int weekly, int gauntlet) = win 0x3afab0, imac 0x7aae90;
    static DemonInfoPopup* createFromString(gd::string) = win 0x3af6e0, imac 0x7a8a50;

    bool init(int easyClassic, int mediumClassic, int hardClassic, int insaneClassic, int extremeClassic, int easyPlatformer, int mediumPlatformer, int hardPlatformer, int insanePlatformer, int extremePlatformer, int weekly, int gauntlet) = win 0x3afc10;
    void onClose(cocos2d::CCObject* sender);

    virtual void keyBackClicked();
}

[[link(android)]]
class DialogDelegate {
    virtual void dialogClosed(DialogLayer*) {}
}

[[link(android)]]
class DialogLayer : cocos2d::CCLayerColor, TextAreaDelegate {
    // virtual ~DialogLayer();

    static DialogLayer* create(DialogObject* object, int background) {
    	return DialogLayer::createDialogLayer(object, nullptr, background);
    }

    void addToMainScene() = win 0xd2a70;
    void animateIn(DialogAnimationType) = imac 0x3b49a0;
    void animateInDialog() = imac 0x3b4be0;
    // 	this->animateIn(m_animationType);
    // }
    void animateInRandomSide() = win 0xd2c40;
    static DialogLayer* createDialogLayer(DialogObject* object, cocos2d::CCArray* objects, int background) = win 0xd1f60, imac 0x3b36c0;
    static DialogLayer* createWithObjects(cocos2d::CCArray* objects, int background) {
    	return DialogLayer::createDialogLayer(nullptr, objects, background);
    }
    void displayDialogObject(DialogObject*) = win 0xd2570;
    void displayNextObject() = win 0xd2510;
    void finishCurrentAnimation() = imac 0x3b4430;
    void handleDialogTap() = win 0xd2940;
    bool init(DialogObject*, cocos2d::CCArray*, int) = win 0xd20b0, imac 0x3b3820;
    void onClose() = win 0xd2ae0;
    void updateChatPlacement(DialogChatPlacement placement) {
    	auto winSize = cocos2d::CCDirector::sharedDirector()->getWinSize();
    		switch (placement) {
        		case DialogChatPlacement::Center:
            			m_mainLayer->setPosition({winSize.width * 0.5F, winSize.height * 0.5F});
            			break;
        		case DialogChatPlacement::Top:
            			m_mainLayer->setPosition({winSize.width * 0.5F, (winSize.height - 50.F) - 20.F});
            			break;
        		case DialogChatPlacement::Bottom:
            			m_mainLayer->setPosition({winSize.width * 0.5F, 70.F});
            			break;
    		}
    }
    void updateNavButtonFrame() = win 0xd28c0, imac 0x3b41b0;

    virtual void onEnter();
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0xd2b60, imac 0x3b4700;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0xd2bb0, imac 0x3b47c0;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0xd2ad0;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0xd2e80, imac 0x3b4bf0;
    virtual TodoReturn fadeInTextFinished(TextArea*) = win 0xd2bd0;

    float m_animateTime;
    cocos2d::CCLayer* m_mainLayer;
    cocos2d::CCLabelBMFont* m_characterLabel;
    TextArea* m_textArea;
    cocos2d::CCSprite* m_characterSprite;
    cocos2d::CCArray* m_dialogObjects;
    int m_touchID;
    cocos2d::CCSprite* m_navButtonSprite;
    bool m_animating;
    bool m_skippable;
    DialogDelegate* m_delegate;
    bool m_handleTap;
    DialogAnimationType m_animationType;
    bool m_noRemove;
}

[[link(android)]]
class DialogObject : cocos2d::CCObject {
    // virtual ~DialogObject();

    static DialogObject* create(gd::string character, gd::string text, int characterFrame, float textScale, bool skippable, cocos2d::ccColor3B color) = win 0xd1da0;

    bool init(gd::string character, gd::string text, int characterFrame, float textScale, bool skippable, cocos2d::ccColor3B color) {
    	m_character = character;
    	m_text = text;
    	m_characterFrame = characterFrame;
    	m_textScale = textScale;
    	m_color = color;
    	m_skippable = skippable;
    	return true;
    }

    gd::string m_text;
    gd::string m_character;
    int m_characterFrame;
    cocos2d::ccColor3B m_color;
    float m_textScale;
    bool m_skippable;
}

[[link(android)]]
class DownloadMessageDelegate {
    virtual TodoReturn downloadMessageFinished(GJUserMessage*);
    virtual TodoReturn downloadMessageFailed(int);
}

[[link(android)]]
class DrawGridLayer : cocos2d::CCLayer {
    // virtual ~DrawGridLayer();

    static DrawGridLayer* create(cocos2d::CCNode*, LevelEditorLayer*) = win 0x2db010;

    void addAudioLineObject(AudioLineGuideGameObject*);
    TodoReturn addToEffects(EffectGameObject*);
    TodoReturn addToGuides(GameObject*);
    TodoReturn addToSpeedObjects(EffectGameObject*);
    TodoReturn getPortalMinMax(GameObject*);
    bool init(cocos2d::CCNode*, LevelEditorLayer*);
    void loadTimeMarkers(gd::string) = win 0x2db1f0, imac 0xdef00;
    float posForTime(float);
    void postUpdate();
    TodoReturn removeAudioLineObject(AudioLineGuideGameObject*);
    TodoReturn removeFromEffects(EffectGameObject*);
    TodoReturn removeFromGuides(GameObject*);
    TodoReturn removeFromSpeedObjects(EffectGameObject*);
    TodoReturn sortSpeedObjects();
    float timeForPos(cocos2d::CCPoint, int, int, bool, bool, bool, int);
    TodoReturn updateMusicGuideTime(float);
    void updateTimeMarkers();

    virtual void update(float) = win 0x2db510, imac 0xf5530;
    virtual void draw() = win 0x2db710;

    PAD = win 0x70, android32 0x40, android64 0x68, mac 0x58;
    LevelEditorLayer* m_editorLayer;
    PAD = win 0x6c, android32 0x3c, android64 0x54, mac 0x64;
    float m_gridSize;
}

[[link(android)]]
class DungeonBarsSprite : cocos2d::CCNode {
    // virtual ~DungeonBarsSprite();
    	DungeonBarsSprite() {
    	m_barsSprite = nullptr;
    }

    static DungeonBarsSprite* create() {
    	auto ret = new DungeonBarsSprite();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void animateOutBars() {
    	auto a1 = cocos2d::CCMoveBy::create(0.08, { -1.5f, 0.0f });
    	auto a2 = cocos2d::CCMoveBy::create(0.08, { 1.5f, 0.0f });
    	auto a3 = cocos2d::CCMoveBy::create(0.08, { -1.5f, 0.0f });
    	auto a4 = cocos2d::CCMoveBy::create(0.08, { 1.5f, 0.0f });
    	auto a5 = cocos2d::CCMoveBy::create(0.08, { -1.5f, 0.0f });
    	auto a6 = cocos2d::CCMoveBy::create(0.08, { 1.5f, 0.0f });
    	auto a7 = cocos2d::CCMoveBy::create(2.5, { 0.0f, -130.0f });

    	auto seq = cocos2d::CCSequence::create(
    		a1, a2, a3, a4, a5, a6,
    		cocos2d::CCEaseElasticIn::create(a7, 1.6f),
    		nullptr
    	);
    	this->m_barsSprite->runAction(seq);
    }

    virtual bool init() = win 0x3d8270;
    virtual void visit() = win 0x3d82f0, imac 0x494920;

    cocos2d::CCSprite* m_barsSprite;
}

[[link(android)]]
class DynamicBitset {
    TodoReturn resize(unsigned int);
}

[[link(android)]]
class DynamicScrollDelegate {
    virtual void updatePageWithObject(cocos2d::CCObject* p0, cocos2d::CCObject* p1) {}
}

[[link(android)]]
class EditButtonBar : cocos2d::CCNode {
    // virtual ~EditButtonBar();

    static EditButtonBar* create(cocos2d::CCArray* objects, cocos2d::CCPoint size, int unk, bool unkBool, int columns, int rows) = win 0xd2f40, imac 0x5c8d60;

    int getPage();
    void goToPage(int);
    bool init(cocos2d::CCArray* objects, cocos2d::CCPoint size, int unk, bool unkBool, int columns, int rows) = imac 0x5c8e50;
    void loadFromItems(cocos2d::CCArray*, int, int, bool) = win 0xd30a0, imac 0x5c8f00;
    void onLeft(cocos2d::CCObject* sender) = win 0xd3a90;
    void onRight(cocos2d::CCObject* sender) = win 0xd3a20;
    void reloadItems(int rowCount, int columnCount) {
    	if (m_buttonArray) this->loadFromItems(m_buttonArray, rowCount, columnCount, false);
    }

    cocos2d::CCPoint m_position;
    int m_unknown;
    bool m_unknownBool;
    cocos2d::CCArray* m_buttonArray;
    BoomScrollLayer* m_scrollLayer;
    cocos2d::CCArray* m_pagesArray;
}

[[link(android)]]
class EditGameObjectPopup : SetupTriggerPopup {
    // virtual ~EditGameObjectPopup();

    static EditGameObjectPopup* create(EffectGameObject*, cocos2d::CCArray*, bool);

    bool init(EffectGameObject*, cocos2d::CCArray*, bool);
}

[[link(android)]]
class EditLevelLayer : cocos2d::CCLayer, TextInputDelegate, FLAlertLayerProtocol, UploadActionDelegate, UploadPopupDelegate, SetIDPopupDelegate {
    EditLevelLayer() {}
    virtual ~EditLevelLayer() = win 0xd3c10;

    static EditLevelLayer* create(GJGameLevel* level) {
    	auto ret = new EditLevelLayer();
    	if (ret && ret->init(level)) {
    		ret->autorelease();
    		return ret;
    	}
    	CC_SAFE_DELETE(ret);
    	return nullptr;
    }

    void closeTextInputs() = win 0xd5f60;
    void confirmClone(cocos2d::CCObject*);
    void confirmDelete(cocos2d::CCObject*) = imac 0x1ea640;
    void confirmMoveToTop(cocos2d::CCObject*);
    bool init(GJGameLevel*) = win 0xd3f10, imac 0x1e80a0;
    void onBack(cocos2d::CCObject* sender) = win 0xd80e0;
    void onClone();
    void onDelete();
    void onEdit(cocos2d::CCObject* sender);
    void onGuidelines(cocos2d::CCObject* sender) = win 0xd52e0, imac 0x1eaee0;
    void onHelp(cocos2d::CCObject* sender);
    void onLevelInfo(cocos2d::CCObject* sender) = win 0xd5500;
    void onLevelLeaderboard(cocos2d::CCObject* sender);
    void onLevelOptions(cocos2d::CCObject* sender);
    void onMoveToTop();
    void onPlay(cocos2d::CCObject* sender) = win 0xd6920;
    void onSetFolder(cocos2d::CCObject* sender) = win 0xd7fc0, imac 0x1ea9b0;
    void onShare(cocos2d::CCObject* sender) = win 0xd6f20;
    void onTest(cocos2d::CCObject* sender);
    void onUpdateDescription(cocos2d::CCObject* sender);
    void playStep2();
    void playStep3();
    static cocos2d::CCScene* scene(GJGameLevel*) = win 0xd3d80;
    void setupLevelInfo() = win 0xd5720;
    void updateDescText(char const*);
    void verifyLevelName() = win 0xd8290;

    virtual void keyBackClicked() = win 0xd8570;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0xd8580, imac 0x1ec070;
    virtual void setIDPopupClosed(SetIDPopup*, int);
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xd7710;
    virtual void textInputOpened(CCTextInputNode*) = win 0xd65c0;
    virtual void textInputClosed(CCTextInputNode*) = win 0xd5fc0;
    virtual void textChanged(CCTextInputNode*) = win 0xd6730, imac 0x1eb470;
    virtual void uploadActionFinished(int, int) = win 0xd85f0;
    virtual void uploadActionFailed(int, int) = win 0xd8730, imac 0x1ec2c0;
    virtual void onClosePopup(UploadActionPopup*);

    cocos2d::CCMenu* m_buttonMenu;
    GJGameLevel* m_level;
    cocos2d::CCArray* m_textInputs;
    cocos2d::CCLabelBMFont* m_folderLabel;
    bool m_exiting;
    GJLevelType m_levelType;
    gd::string m_levelName;
    UploadActionPopup* m_descriptionPopup;
}

[[link(android)]]
class EditorOptionsLayer : GJOptionsLayer {
    // virtual ~EditorOptionsLayer();

    static EditorOptionsLayer* create() = imac 0x28b420;

    void onButtonRows(cocos2d::CCObject* sender) = win 0x289f50, imac 0x28bfe0;
    void onButtonsPerRow(cocos2d::CCObject* sender) = win 0x289ec0, imac 0x28bf60;

    virtual bool init() = win 0x2895b0, imac 0x28b680;
    virtual void onClose(cocos2d::CCObject* sender) = win 0x289fe0;
    virtual void setupOptions() = win 0x2895e0, imac 0x28b6b0;

    int m_buttonsPerRow;
    int m_buttonRows;
    cocos2d::CCLabelBMFont* m_buttonsPerRowLabel;
    cocos2d::CCLabelBMFont* m_buttonRowsLabel;
}

[[link(android)]]
class EditorPauseLayer : CCBlockLayer, FLAlertLayerProtocol {
    // virtual ~EditorPauseLayer();
    	EditorPauseLayer() {
    	m_saved = false;
    	m_guidelinesOffButton = nullptr;
    	m_guidelinesOnButton = nullptr;
    	m_editorLayer = nullptr;
    }

    static EditorPauseLayer* create(LevelEditorLayer*) {
    	auto ret = new EditorPauseLayer();
    	if (ret && ret->init(LevelEditorLayer::get())) {
    		ret->autorelease();
    		return ret;
    	}
    	CC_SAFE_DELETE(ret);
    	return nullptr;
    }

    TodoReturn doResetUnused() = win 0x2d29a0;
    bool init(LevelEditorLayer*) = win 0xd8990, imac 0x1eb020;
    void onAlignX(cocos2d::CCObject* sender);
    void onAlignY(cocos2d::CCObject* sender);
    void onBuildHelper(cocos2d::CCObject* sender);
    void onCopyWColor(cocos2d::CCObject* sender);
    void onCreateExtras(cocos2d::CCObject* sender) = win 0xdb760;
    void onCreateLoop(cocos2d::CCObject* sender);
    void onCreateTemplate(cocos2d::CCObject* sender);
    void onExitEditor(cocos2d::CCObject* sender) = win 0xdcd60;
    void onExitNoSave(cocos2d::CCObject* sender);
    void onHelp(cocos2d::CCObject* sender);
    void onKeybindings(cocos2d::CCObject* sender);
    void onNewGroupX(cocos2d::CCObject* sender);
    void onNewGroupY(cocos2d::CCObject* sender);
    void onOptions(cocos2d::CCObject* sender);
    void onPasteWColor(cocos2d::CCObject* sender);
    void onReGroup(cocos2d::CCObject* sender);
    void onResetUnusedColors(cocos2d::CCObject* sender) = imac 0x281670;
    void onResume(cocos2d::CCObject* sender) = win 0xdc140;
    void onSave(cocos2d::CCObject* sender) = win 0xdcbf0;
    void onSaveAndExit(cocos2d::CCObject* sender) = win 0xdcd20, imac 0x2811c0;
    void onSaveAndPlay(cocos2d::CCObject* sender) = win 0xdc9a0, imac 0x281150;
    void onSelectAll(cocos2d::CCObject* sender) = win 0xdb870;
    void onSelectAllLeft(cocos2d::CCObject* sender);
    void onSelectAllRight(cocos2d::CCObject* sender);
    void onSong(cocos2d::CCObject* sender);
    void onUnlockAllLayers(cocos2d::CCObject* sender);
    TodoReturn playStep2();
    TodoReturn playStep3() = win 0xdcb50;
    void saveLevel() = win 0xdc310;
    TodoReturn toggleDebugDraw(cocos2d::CCObject*);
    TodoReturn toggleEditorBackground(cocos2d::CCObject*);
    TodoReturn toggleEditorColorMode(cocos2d::CCObject*);
    TodoReturn toggleEditorGrid(cocos2d::CCObject*);
    TodoReturn toggleEditorGround(cocos2d::CCObject*);
    TodoReturn toggleEffectDuration(cocos2d::CCObject*);
    TodoReturn toggleEffectLines(cocos2d::CCObject*);
    TodoReturn toggleFollowPlayer(cocos2d::CCObject*);
    TodoReturn toggleGridOnTop(cocos2d::CCObject*);
    TodoReturn toggleHideInvisible(cocos2d::CCObject*);
    TodoReturn toggleIgnoreDamage(cocos2d::CCObject*);
    TodoReturn togglePlaytestMusic(cocos2d::CCObject*);
    void togglePreviewAnim(cocos2d::CCObject*) = win 0xdbc10;
    TodoReturn togglePreviewParticles(cocos2d::CCObject*);
    TodoReturn togglePreviewShaders(cocos2d::CCObject*);
    TodoReturn toggleRecordOrder(cocos2d::CCObject*);
    TodoReturn toggleSelectFilter(cocos2d::CCObject*);
    void toggleShowObjectInfo(cocos2d::CCObject* sender);
    TodoReturn uncheckAllPortals(cocos2d::CCObject*) = imac 0x2815a0;
    TodoReturn updateSongButton();

    virtual void keyBackClicked() = win 0xdd0c0;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0xdd0d0, imac 0x282990;
    virtual void customSetup() = win 0xd9020, imac 0x27f2b0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xdcfa0, imac 0x2827c0;

    bool m_saved;
    CCMenuItemSpriteExtra* m_guidelinesOffButton;
    CCMenuItemSpriteExtra* m_guidelinesOnButton;
    LevelEditorLayer* m_editorLayer;
    PAD = win 0x20;

}

[[link(android), depends(GJTransformState)]]
class EditorUI : cocos2d::CCLayer, FLAlertLayerProtocol, ColorSelectDelegate, GJRotationControlDelegate, GJScaleControlDelegate, GJTransformControlDelegate, MusicDownloadDelegate, SetIDPopupDelegate {
    // virtual ~EditorUI();
    EditorUI() = win 0xdd4b0;

    static EditorUI* create(LevelEditorLayer*) = imac 0x8fc0;
    static EditorUI* get() {
    	auto lel = LevelEditorLayer::get();
    	if (!lel) return nullptr;
    	return lel->m_editorUI;
    }

    void activateRotationControl(cocos2d::CCObject*) = win 0x121400;
    void activateScaleControl(cocos2d::CCObject*) = win 0x113260;
    void activateTransformControl(cocos2d::CCObject*) = win 0x1138b0;
    TodoReturn addObjectsToSmartTemplate(GJSmartTemplate*, cocos2d::CCArray*);
    TodoReturn addSnapPosition(cocos2d::CCPoint);
    TodoReturn alignObjects(cocos2d::CCArray*, bool);
    void applyOffset(GameObject*) = win 0x120d20;
    TodoReturn applySpecialOffset(cocos2d::CCPoint, GameObject*, cocos2d::CCPoint);
    TodoReturn arrayContainsClass(cocos2d::CCArray*, int);
    TodoReturn assignNewGroups(bool) = imac 0x45270;
    TodoReturn canAllowMultiActivate(GameObject*, cocos2d::CCArray*);
    TodoReturn canSelectObject(GameObject*);
    TodoReturn centerCameraOnObject(GameObject*);
    TodoReturn changeSelectedObjects(cocos2d::CCArray*, bool);
    TodoReturn checkDiffAfterTransformAnchor(cocos2d::CCPoint, cocos2d::CCArray*) = win 0x1140c0;
    TodoReturn checkLiveColorSelect();
    void clickOnPosition(cocos2d::CCPoint) = win 0xe1020, imac 0x2d8a0;
    TodoReturn closeLiveColorSelect();
    TodoReturn closeLiveHSVSelect();
    void colorSelectClosed(cocos2d::ccColor3B);
    void constrainGameLayerPosition();
    void constrainGameLayerPosition(float, float) = win 0x120db0, imac 0x2a8c0;
    TodoReturn convertKeyBasedOnNeighbors(int, int, cocos2d::CCPoint, cocos2d::CCArray*);
    TodoReturn convertToBaseKey(int);
    gd::string copyObjects(cocos2d::CCArray* objects, bool copyColors, bool sort) = win 0x111540, imac 0x30b80;
    TodoReturn copyObjectsDetailed(cocos2d::CCArray*);
    cocos2d::CCArray* createCustomItems() = win 0xe30c0, imac 0x31480;
    TodoReturn createEdgeForObject(GameObject*, int);
    TodoReturn createExtraObject(int, cocos2d::CCPoint, GameObject*, cocos2d::CCArray*, int, int);
    TodoReturn createExtras(cocos2d::CCArray*);
    TodoReturn createExtrasForObject(int, GameObject*, cocos2d::CCArray*);
    TodoReturn createGlow();
    void createLoop();
    void createMoveMenu() = win 0x119330;
    TodoReturn createNewKeyframeAnim();
    TodoReturn createObject(int, cocos2d::CCPoint) = win 0x10e820;
    TodoReturn createOutlines(cocos2d::CCArray*);
    TodoReturn createPrefab(GJSmartTemplate*, gd::string, int);
    TodoReturn createRockBases(cocos2d::CCArray*) = win 0x12d9e0, imac 0x5fc970;
    TodoReturn createRockEdges(cocos2d::CCArray*);
    TodoReturn createSmartObjectsFromTemplate(GJSmartTemplate*, cocos2d::CCArray*, bool, bool, bool, bool);
    TodoReturn createSmartObjectsFromType(int, cocos2d::CCArray*, bool, bool);
    UndoObject* createUndoObject(UndoCommand, bool) = win 0x10f810, imac 0x3cce0;
    TodoReturn createUndoSelectObject(bool) = win 0x10fb30;
    TodoReturn deactivateRotationControl();
    TodoReturn deactivateScaleControl() = win 0x113460;
    TodoReturn deactivateTransformControl() = win 0x113ab0;
    void deleteObject(GameObject*, bool) = imac 0x32870;
    TodoReturn deleteSmartBlocksFromObjects(cocos2d::CCArray*);
    TodoReturn deleteTypeFromObjects(int, cocos2d::CCArray*);
    void deselectAll() = win 0x10fd60, imac 0x32b40;
    void deselectObject() = imac 0x32d50;
    void deselectObject(GameObject*) = win 0x10fc40, imac 0x32aa0;
    void deselectObjectsColor();
    TodoReturn deselectTargetPortals() = imac 0x32710;
    TodoReturn disableButton(CreateMenuItem*);
    void doCopyObjects(bool) = win 0x1118e0, imac 0x3e000;
    TodoReturn doPasteInPlace(bool);
    void doPasteObjects(bool) = win 0x111a70;
    void dynamicGroupUpdate(bool) = win 0x116fe0, imac 0x44710;
    TodoReturn edgeForObject(int, int);
    TodoReturn editButton2Usable() = imac 0x48be0;
    TodoReturn editButtonUsable() = imac 0x47e80;
    TodoReturn editColor();
    TodoReturn editColorButtonUsable();
    void editGroup(cocos2d::CCObject*) = win 0x11d860, imac 0x2c1f0;
    TodoReturn editHSV();
    void editObject(cocos2d::CCObject*) = win 0x11a4f0;
    void editObject2(cocos2d::CCObject*);
    void editObject3(cocos2d::CCObject*);
    TodoReturn editObjectSpecial(int);
    TodoReturn editorLayerForArray(cocos2d::CCArray*, bool);
    TodoReturn enableButton(CreateMenuItem*);
    TodoReturn findAndSelectObject(int, bool);
    void findSnapObject(cocos2d::CCArray*, float) = win 0x121670;
    void findSnapObject(cocos2d::CCPoint, float) = win 0x121770;
    TodoReturn findTriggerTest();
    void flipObjectsX(cocos2d::CCArray*);
    void flipObjectsY(cocos2d::CCArray*);
    TodoReturn getButton(char const*, int, cocos2d::SEL_MenuHandler, cocos2d::CCMenu*);
    CreateMenuItem* getCreateBtn(int id, int bg) = win 0x10d280;
    TodoReturn getCreateMenuItemButton(cocos2d::CCSprite*, cocos2d::SEL_MenuHandler, cocos2d::CCMenu*, float, int, cocos2d::CCPoint) = imac 0x2ea90;
    TodoReturn getCycledObject(cocos2d::CCArray*, bool);
    TodoReturn getEditColorTargets(ColorAction*&, ColorAction*&, EffectGameObject*&) = imac 0x49a20;
    cocos2d::CCPoint getGridSnappedPos(cocos2d::CCPoint pos) {
    	auto size = m_editorLayer->m_drawGridLayer->m_gridSize;
    	auto xVal = std::floorf(pos.x / size);
    	auto yVal = std::floorf(pos.y / size);
    	return this->getLimitedPosition(ccp((xVal + 0.5) * size, (yVal + 0.5) * size));
    }
    cocos2d::CCPoint getGroupCenter(cocos2d::CCArray* objs, bool) = win 0x121170;
    TodoReturn getGroupInfo(GameObject*, cocos2d::CCArray*, int&, int&, int&);
    cocos2d::CCPoint getLimitedPosition(cocos2d::CCPoint) = win 0x11e6d0;
    CCMenuItemSpriteExtra* getModeBtn(char const*, int);
    TodoReturn getNeighbor(int, cocos2d::CCPoint, GJSmartDirection, cocos2d::CCArray*);
    TodoReturn getRandomStartKey(int);
    TodoReturn getRelativeOffset(GameObject*) = imac 0x4db480;
    cocos2d::CCArray* getSelectedObjects() = win 0x10f760;
    TodoReturn getSimpleButton(gd::string, cocos2d::SEL_MenuHandler, cocos2d::CCMenu*);
    TodoReturn getSmartNeighbor(SmartGameObject*, cocos2d::CCPoint, GJSmartDirection, cocos2d::CCArray*);
    TodoReturn getSmartObjectKey(int, GJSmartDirection);
    TodoReturn getSnapAngle(GameObject*, cocos2d::CCArray*) = imac 0x4a660;
    CCMenuItemSpriteExtra* getSpriteButton(char const* spriteFrameName, cocos2d::SEL_MenuHandler selector, cocos2d::CCMenu* menu, float scale, int buttonKind, cocos2d::CCPoint offset) = win 0xe11b0;
    CCMenuItemSpriteExtra* getSpriteButton(char const* spriteFrameName, cocos2d::SEL_MenuHandler selector, cocos2d::CCMenu* menu, float scale) {
    	return this->getSpriteButton(spriteFrameName, selector, menu, scale, 1, {0, 0});
    }
    CCMenuItemSpriteExtra* getSpriteButton(cocos2d::CCSprite* sprite, cocos2d::SEL_MenuHandler selector, cocos2d::CCMenu* menu, float scale, int buttonKind, cocos2d::CCPoint offset) = win 0xe1240;
    TodoReturn getTouchPoint(cocos2d::CCTouch*, cocos2d::CCEvent*);
    TodoReturn getTransformState();
    TodoReturn getXMin(int) = imac 0x2ed70;
    bool init(LevelEditorLayer* editorLayer) = win 0xdde60;
    bool isLiveColorSelectTrigger(GameObject*);
    bool isSpecialSnapObject(int) = win 0x127290, imac 0x4bbf0;
    TodoReturn liveEditColorUsable();
    CreateMenuItem* menuItemFromObjectString(gd::string, int) = win 0x10d070;
    cocos2d::CCPoint moveForCommand(EditCommand command) = win 0x11de00, imac 0x4a0d0;
    void moveGamelayer(cocos2d::CCPoint) = win 0xe1690, imac 0x2f100;
    void moveObject(GameObject*, cocos2d::CCPoint) = win 0x11e270;
    void moveObjectCall(cocos2d::CCObject*) = imac 0x49270;
    void moveObjectCall(EditCommand) = win 0x11dfe0, imac 0x4a2d0;
    cocos2d::CCPoint offsetForKey(int) = win 0x124bd0;
    TodoReturn onAssignNewGroupID();
    void onColorFilter(cocos2d::CCObject* sender);
    void onCopy(cocos2d::CCObject* sender);
    void onCopyState(cocos2d::CCObject* sender) = win 0x112aa0;
    bool onCreate() = win 0x10dcf0, imac 0x2df00;
    void onCreateButton(cocos2d::CCObject* sender) = win 0x10d860;
    void onCreateObject(int) = win 0x10def0;
    void onDelete(cocos2d::CCObject* sender) = win 0xe4740;
    void onDeleteAll(cocos2d::CCObject* sender);
    void onDeleteCustomItem(cocos2d::CCObject* sender) = win 0xe2e60;
    void onDeleteInfo(cocos2d::CCObject* sender);
    void onDeleteSelected(cocos2d::CCObject* sender) = win 0xe4d60;
    void onDeleteSelectedType(cocos2d::CCObject* sender) = win 0xe52f0, imac 0x31b40;
    void onDeleteStartPos(cocos2d::CCObject* sender) = win 0xe5340;
    void onDeselectAll(cocos2d::CCObject* sender) = win 0x10fd20;
    void onDuplicate(cocos2d::CCObject* sender) = win 0x1113c0;
    void onEditColor(cocos2d::CCObject* sender) = win 0x11d090;
    void onFindObject(cocos2d::CCObject* sender);
    void onGoToBaseLayer(cocos2d::CCObject* sender) = win 0x112f20;
    void onGoToLayer(cocos2d::CCObject* sender) = win 0x112dc0;
    void onGroupDown(cocos2d::CCObject* sender) = win 0x11da70;
    void onGroupIDFilter(cocos2d::CCObject* sender) = win 0xe5a60;
    void onGroupSticky(cocos2d::CCObject* sender);
    void onGroupUp(cocos2d::CCObject* sender) = win 0x11da50;
    void onLockLayer(cocos2d::CCObject* sender);
    void onNewCustomItem(cocos2d::CCObject* sender) = win 0xe2970;
    void onPaste(cocos2d::CCObject* sender);
    void onPasteColor(cocos2d::CCObject* sender) = win 0x112cb0;
    void onPasteInPlace(cocos2d::CCObject* sender);
    void onPasteState(cocos2d::CCObject* sender) = win 0x112b20;
    void onPause(cocos2d::CCObject* sender) = win 0xe03b0, imac 0x2a660;
    void onPlayback(cocos2d::CCObject* sender) = win 0x110370, imac 0xc240;
    void onPlaytest(cocos2d::CCObject* sender) = win 0x110980, imac 0xc4a0;
    void onResetSpecialFilter(cocos2d::CCObject* sender);
    void onSelectBuildTab(cocos2d::CCObject* sender) = imac 0x33c10;
    void onSettings(cocos2d::CCObject* sender) = win 0xe0350;
    void onStopPlaytest(cocos2d::CCObject* sender) = win 0x110d20;
    TodoReturn onTargetIDChange(int);
    void onToggleGuide(EffectGameObject*);
    TodoReturn onToggleSelectedOrder(EffectGameObject*);
    void onUngroupSticky(cocos2d::CCObject* sender);
    void onUpdateDeleteFilter(cocos2d::CCObject* sender);
    void orderDownCustomItem(cocos2d::CCObject*);
    void orderUpCustomItem(cocos2d::CCObject*);
    cocos2d::CCArray* pasteObjects(gd::string, bool, bool) = win 0x111cf0;
    TodoReturn playCircleAnim(cocos2d::CCPoint, float, float);
    TodoReturn playerTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*);
    TodoReturn playerTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*);
    void playtestStopped() = win 0x110d60, imac 0x3d880;
    TodoReturn positionIsInSnapped(cocos2d::CCPoint);
    TodoReturn positionWithoutOffset(GameObject*);
    TodoReturn processSelectObjects(cocos2d::CCArray*) = imac 0x3d180;
    TodoReturn processSmartObjectsFromType(int, cocos2d::CCArray*, cocos2d::CCArray*, cocos2d::CCArray*, cocos2d::CCArray*);
    void recreateButtonTabs();
    void redoLastAction(cocos2d::CCObject*) = win 0x110170;
    void reloadCustomItems() {
    	GameManager* gm = GameManager::sharedState();
    	int buttonsPerRow = gm->getIntGameVariable("0049");
    	int buttonRows = gm->getIntGameVariable("0050");
    	cocos2d::CCArray* customItems = createCustomItems();
    	m_buttonBar->loadFromItems(customItems,buttonsPerRow,buttonRows,true);
    }
    void removeOffset(GameObject*) = win 0x120c90;
    TodoReturn replaceGroupID(GameObject*, int, int);
    void repositionObjectsToCenter(cocos2d::CCArray*, cocos2d::CCPoint, bool) = win 0x112a00;
    void resetObjectEditorValues(cocos2d::CCArray*);
    TodoReturn resetSelectedObjectsColor();
    void resetUI() = win 0xe36b0, imac 0x2a550;
    void rotateObjects(cocos2d::CCArray*, float, cocos2d::CCPoint) = win 0x11f490, imac 0x3bcd0;
    TodoReturn rotationforCommand(EditCommand);
    void scaleObjects(cocos2d::CCArray*, float, float, cocos2d::CCPoint, ObjectScaleType, bool) = win 0x11f8b0;
    void selectAll();
    void selectAllWithDirection(bool) = imac 0x3d260;
    void selectBuildTab(int) = win 0x112f70, imac 0x33c40;
    void selectObject(GameObject*, bool) = win 0x10ee30, imac 0x2e530;
    void selectObjects(cocos2d::CCArray*, bool) = win 0x10f120, imac 0x3c130;
    void selectObjectsInRect(cocos2d::CCRect);
    void setupCreateMenu() = win 0xe68f0, imac 0xd820;
    void setupDeleteMenu() = win 0xe38b0;
    void setupEditMenu() {
    	this->createMoveMenu();
    	this->updateEditMenu();
    }
    TodoReturn setupTransformControl();
    bool shouldDeleteObject(GameObject*) = win 0xe4c30, imac 0x32640;
    TodoReturn shouldSnap(GameObject*);
    void showDeleteConfirmation();
    void showLiveColorSelectForMode(int);
    void showLiveColorSelectForModeSpecial(int);
    void showMaxBasicError();
    void showMaxCoinError();
    void showMaxError() = win 0x111150;
    void showUI(bool) = win 0x1101e0;
    void sliderChanged(cocos2d::CCObject*) = win 0xe1380, imac 0xb660;
    TodoReturn smartTypeForKey(int);
    cocos2d::CCSprite* spriteFromObjectString(gd::string str, bool, bool, int objLimit, cocos2d::CCArray*, cocos2d::CCArray*, GameObject*) = win 0x10c770;
    TodoReturn toggleDuplicateButton();
    void toggleEditObjectButton() = win 0x118ef0;
    void toggleEnableRotate(cocos2d::CCObject*);
    void toggleFreeMove(cocos2d::CCObject*);
    TodoReturn toggleLockUI(bool);
    void toggleMode(cocos2d::CCObject*) = win 0xe37d0, imac 0x2a810;
    TodoReturn toggleObjectInfoLabel();
    void toggleSnap(cocos2d::CCObject*);
    TodoReturn toggleSpecialEditButtons();
    void toggleStickyControls(bool enable) {
    	m_stickyControlsEnabled = enable;
    	m_linkBtn->setEnabled(enable);
      		m_linkBtn->setVisible(enable);
      		m_unlinkBtn->setEnabled(enable);
      		m_unlinkBtn->setVisible(enable);
    }
    void toggleSwipe(cocos2d::CCObject*);
    void transformObject(GameObject*, EditCommand, bool) = win 0x11ece0, imac 0x4b730;
    void transformObjectCall(cocos2d::CCObject*);
    void transformObjectCall(EditCommand) = win 0x11e790, imac 0x4a710;
    void transformObjects(cocos2d::CCArray* objs, cocos2d::CCPoint anchor, float scaleX, float scaleY, float rotateX, float rotateY, float warpX, float warpY) = win 0x11fea0;
    TodoReturn transformObjectsActive();
    TodoReturn transformObjectsReset();
    TodoReturn triggerSwipeMode();
    TodoReturn tryUpdateTimeMarkers();
    void undoLastAction(cocos2d::CCObject*) = win 0x110100;
    void updateButtons() = win 0xe07c0;
    void updateCreateMenu(bool) = win 0x10d8a0;
    void updateDeleteButtons() = win 0xe5f90;
    void updateDeleteMenu() {
    	m_deleteMenu->setVisible(m_selectedMode == 1);
    }
    TodoReturn updateEditButtonColor(int, cocos2d::ccColor3B) = imac 0x3ea20;
    TodoReturn updateEditColorButton() = imac 0x490f0;
    void updateEditMenu() {
    	m_editButtonBar->setVisible(m_selectedMode == 3);
    }
    void updateGridNodeSize() = win 0xe1540, imac 0x2ef20;
    TodoReturn updateGridNodeSize(int);
    TodoReturn updateGroupIDBtn2();
    void updateGroupIDLabel() = imac 0x2c5d0;
    void updateObjectInfoLabel() = win 0xe17a0;
    TodoReturn updatePlaybackBtn() = imac 0x2cef0;
    TodoReturn updateSlider() = win 0xe1480;
    TodoReturn updateSpecialUIElements();
    void updateZoom(float) = win 0x110ed0;
    float valueFromXPos(float);
    float xPosFromValue(float);
    void zoomGameLayer(bool);
    void zoomIn(cocos2d::CCObject*) = win 0x110e30, imac 0xc7e0;
    void zoomOut(cocos2d::CCObject*) = win 0x110e80, imac 0xc830;

    virtual void draw() = win 0x121100, imac 0x4e0d0;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x121c40, imac 0x4eb90;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x1222c0, imac 0x4f1b0;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x122a10, imac 0x4f760;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x1130c0;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x123750, imac 0x50100;
    virtual TodoReturn getUI() = win 0xdd8f0;
    virtual void setIDPopupClosed(SetIDPopup*, int) = win 0xe5560, imac 0x330d0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xe5370, imac 0x32f40;
    virtual void updateTransformControl() = win 0x113b40, imac 0x40450;
    virtual void transformChangeBegin() = win 0x114030;
    virtual void transformChangeEnded() {}
    virtual TodoReturn getTransformNode();
    virtual void transformScaleXChanged(float) = win 0x11fc80;
    virtual void transformScaleYChanged(float) = win 0x11fca0;
    virtual void transformScaleXYChanged(float, float) = win 0x11fcc0, imac 0x4cc70;
    virtual void transformSkewXChanged(float) = win 0x11fce0;
    virtual void transformSkewYChanged(float) = win 0x11fd00;
    virtual void transformRotationXChanged(float) = win 0x11fd20;
    virtual void transformRotationYChanged(float) = win 0x11fd40;
    virtual void transformRotationChanged(float) = win 0x11fd60, imac 0x4d360;
    virtual void transformResetRotation() = win 0x11fd80, imac 0x4d4d0;
    virtual void transformRestoreRotation() = win 0x11fdb0, imac 0x4d5c0;
    virtual void songStateChanged() = win 0x110970;
    virtual void colorSelectClosed(cocos2d::CCNode*) = win 0x11dcb0, imac 0x49ea0;
    virtual void keyUp(cocos2d::enumKeyCodes) = win 0x1249e0;
    virtual void scrollWheel(float, float) = win 0x124a20, imac 0x512c0;
    virtual void angleChangeBegin() = win 0x121540;
    virtual void angleChangeEnded() {}
    virtual void angleChanged(float) = win 0x121550, imac 0x4e210;
    virtual void updateScaleControl() = win 0x113530, imac 0x3ee40;
    virtual void anchorPointMoved(cocos2d::CCPoint) = win 0x114040;
    virtual void scaleChangeBegin() = win 0x113690;
    virtual void scaleChangeEnded() {}
    virtual void scaleXChanged(float, bool);
    virtual void scaleYChanged(float, bool);
    virtual void scaleXYChanged(float, float, bool) = win 0x113800, imac 0x3fe90;


    PAD = win 0x40, android32 0x1c, android64 0x38, mac 0x28, ios 0x28;

    GJTransformState m_transformState;
    bool m_isPlayingMusic;
    EditButtonBar* m_buttonBar;
    PAD = win 0x8, android32 0x4, android64 0x8, mac 0x8, ios 0x8;
    cocos2d::CCArray* m_unk1cc;
    float m_gridSize;
    PAD = win 0x34, android32 0x30, android64 0x34, mac 0x34, ios 0x34;
    cocos2d::CCLabelBMFont* m_objectInfoLabel;
    GJRotationControl* m_rotationControl;
    cocos2d::CCPoint m_pivotPoint;
    PAD = win 0x8, android32 0x4, android64 0x8, mac 0x8, ios 0x8;
    GJScaleControl* m_scaleControl;
    GJTransformControl* m_transformControl;
    cocos2d::CCNode* m_unk220;
    cocos2d::CCNode* m_unk224;
    cocos2d::CCDictionary* m_editButtonDict;
    EditButtonBar* m_createButtonBar;
    EditButtonBar* m_editButtonBar;
    Slider* m_positionSlider;
    float m_unk238;
    float m_unk23c;
    float m_toolbarHeight;
    float m_unk244;
    bool m_updatedSpeedObjects;
    bool m_unkBool1;
    bool m_unkBool2;
    bool m_stickyControlsEnabled;

    PAD = win 0xc, android32 0xc, android64 0xc, mac 0xc, ios 0xc;
    cocos2d::CCArray* m_unk258;
    PAD = win 0x8, android32 0x8, android64 0x8, mac 0x8, ios 0x8;

    cocos2d::CCArray* m_selectedObjects;

    // most of these are not tested
    cocos2d::CCMenu* m_deleteMenu;
    cocos2d::CCArray* m_unknownArray4;
    CCMenuItemSpriteExtra* m_deleteModeBtn;
    CCMenuItemSpriteExtra* m_buildModeBtn;
    CCMenuItemSpriteExtra* m_editModeBtn;
    CCMenuItemSpriteExtra* m_swipeBtn;
    CCMenuItemSpriteExtra* m_freeMoveBtn;
    CCMenuItemSpriteExtra* m_deselectBtn;
    CCMenuItemSpriteExtra* m_snapBtn;
    CCMenuItemSpriteExtra* m_rotateBtn;
    CCMenuItemSpriteExtra* m_playbackBtn;
    CCMenuItemSpriteExtra* m_playtestBtn;
    CCMenuItemSpriteExtra* m_playtestStopBtn;
    CCMenuItemSpriteExtra* m_trashBtn;
    CCMenuItemSpriteExtra* m_linkBtn;
    CCMenuItemSpriteExtra* m_unlinkBtn;
    CCMenuItemSpriteExtra* m_undoBtn;
    CCMenuItemSpriteExtra* m_redoBtn;
    CCMenuItemSpriteExtra* m_editObjectBtn;
    CCMenuItemSpriteExtra* m_editGroupBtn;
    CCMenuItemSpriteExtra* m_editHSVBtn;
    CCMenuItemSpriteExtra* m_editSpecialBtn;
    cocos2d::CCObject* m_unk3F0;
    CCMenuItemSpriteExtra* m_copyPasteBtn;
    CCMenuItemSpriteExtra* m_copyBtn;
    CCMenuItemSpriteExtra* m_pasteBtn;
    CCMenuItemSpriteExtra* m_copyValuesBtn;
    CCMenuItemSpriteExtra* m_pasteStateBtn;
    CCMenuItemSpriteExtra* m_pasteColorBtn;
    CCMenuItemSpriteExtra* m_goToLayerBtn;
    // CCMenuItemToggler* m_guideToggle;
    cocos2d::CCArray* m_createButtonBars;
    cocos2d::CCMenu* m_tabsMenu;
    cocos2d::CCArray* m_tabsArray;
    cocos2d::CCSprite* m_idkSprite0;
    cocos2d::CCSprite* m_idkSprite1;
    CCMenuItemSpriteExtra* m_button27;
    CCMenuItemSpriteExtra* m_button28;
    CCMenuItemSpriteExtra* m_deleteFilterNone;
    CCMenuItemSpriteExtra* m_deleteFilterStatic;
    CCMenuItemSpriteExtra* m_deleteFilterDetails;
    CCMenuItemSpriteExtra* m_deleteFilterCustom;
    cocos2d::CCLabelBMFont* m_currentLayerLabel;
    CCMenuItemSpriteExtra* m_layerNextBtn;
    CCMenuItemSpriteExtra* m_layerPrevBtn;
    CCMenuItemSpriteExtra* m_goToBaseBtn;
    ButtonSprite* m_unk31c;
    ButtonSprite* m_unk320;
    int m_selectedCreateObjectID;
    void* m_unk324;
    int m_selectedObjectIndex;
    cocos2d::CCArray* m_createButtonArray;
    cocos2d::CCArray* m_customObjectButtonArray;
    cocos2d::CCArray* m_unknownArray9;
    int m_selectedMode;
    LevelEditorLayer* m_editorLayer;
    cocos2d::CCPoint m_swipeStart;
    cocos2d::CCPoint m_swipeEnd;
    cocos2d::CCPoint m_unk508;
    cocos2d::CCPoint m_lastTouchPoint;
    cocos2d::CCPoint m_cameraTest;
    cocos2d::CCPoint m_clickAtPosition;
    GameObject* m_selectedObject;
    GameObject* m_snapObject;
    bool m_isDraggingCamera;
    void* m_unk540;
    int m_selectedTab;
    PAD = win 0x3c;
    bool m_unk3b4;

    PAD = win 0x8;
}

[[link(android)]]
class EditTriggersPopup : SetupTriggerPopup {
    // virtual ~EditTriggersPopup();

    static EditTriggersPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*) = win 0x287490;

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
}

[[link(android)]]
class EffectGameObject : EnhancedGameObject {
    // virtual ~EffectGameObject();
    // EffectGameObject() = imac 0x1edce0;

    static EffectGameObject* create(char const*);

    TodoReturn getTargetColorIndex();
    bool init(char const*);
    TodoReturn playTriggerEffect() = win 0x48d130;
    TodoReturn resetSpawnTrigger();
    void setTargetID(int);
    void setTargetID2(int);
    TodoReturn triggerEffectFinished();
    TodoReturn updateInteractiveHover(float);
    TodoReturn updateSpecialColor();
    TodoReturn updateSpeedModType() = win 0x492e90;

    virtual void setOpacity(unsigned char);
    virtual void firstSetup() = win 0x48fe30, imac 0x1a9bd0;
    virtual void customSetup();
    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = win 0x48d650, imac 0x1a7ed0;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = win 0x4900b0;
    virtual gd::string getSaveString(GJBaseGameLayer*) = win 0x493130;
    virtual void setRScaleX(float);
    virtual void setRScaleY(float);
    virtual void triggerActivated(float) = imac 0x1a9b60;
    virtual void restoreObject() = imac 0x1a9920;
    virtual float spawnXPosition() = imac 0x1a9b20;
    virtual bool canReverse() = imac 0x1a9cb0;
    virtual bool isSpecialSpawnObject();
    virtual bool canBeOrdered() = imac 0x1a9d30;
    virtual cocos2d::CCLabelBMFont* getObjectLabel();
    virtual void setObjectLabel(cocos2d::CCLabelBMFont*);
    virtual TodoReturn stateSensitiveOff(GJBaseGameLayer*) = imac 0x1a9890;

    // this is probably pretty wrong :D

    bool m_unknownBool;
    cocos2d::ccColor3B m_triggerTargetColor;
    // property 10
    float m_duration;
    // property 35
    float m_opacity;
    PAD = android32 0x4, android64 0x4, win 0x4, mac 0x4;
    // property 51
    int m_targetGroupID;
    // property 71
    int m_centerGroupID;
    // property 11
    bool m_isTouchTriggered;
    // property 62
    bool m_isSpawnTriggered;
    // property 369
    bool m_hasCenterEffect;
    // property 75
    float m_shakeStrength;
    // property 84
    float m_shakeInterval;
    // property 14
    bool m_tintGround;
    // property 15
    bool m_usesPlayerColor1;
    // property 16
    bool m_usesPlayerColor2;
    // property 17
    bool m_usesBlending;
    // property 28
    float m_moveOffsetX;
    // property 29
    float m_moveOffsetY;
    // property 30
    EasingType m_easingType;
    // property 85
    float m_easingRate;
    // property 58
    bool m_lockToPlayerX;
    // property 59
    bool m_lockToPlayerY;
    // property 141
    bool m_lockToCameraX;
    // property 142
    bool m_lockToCameraY;
    // property 100
    bool m_useMoveTarget;
    // property 101
    MoveTargetType m_moveTargetMode;
    // property 143
    float m_moveModX;
    // property 144
    float m_moveModY;
    // property 393
    bool m_property393;
    // property 394
    bool m_isDirectionFollowSnap360;
    // property 395
    int m_targetModCenterID;
    // property 396
    float m_directionModeDistance;
    // property 397
    bool m_isDynamicMode;
    // property 544
    bool m_isSilent;
    PAD = android 0x6, win 0x6, mac 0x6;
    // property 68
    float m_rotationDegrees;
    // property 69
    int m_times360;
    // property 70
    bool m_lockObjectRotation;
    // property 401
    int m_rotationTargetID;
    // property 402
    float m_rotationOffset;
    // property 403
    EasingType m_dynamicModeEasing;
    // property 72
    float m_followXMod;
    // property 73
    float m_followYMod;
    // property 90
    float m_followYSpeed;
    // property 91
    float m_followYDelay;
    // property 92
    int m_followYOffset;
    // property 105
    float m_followYMaxSpeed;
    // property 45
    float m_fadeInDuration;
    // property 46
    float m_holdDuration;
    // property 47
    float m_fadeOutDuration;
    // property 48
    int m_pulseMode;
    // property 52
    int m_pulseTargetType;
    // property 49
    cocos2d::ccHSVValue m_hsvValue;
    // property 50
    int m_copyColorID;
    // property 60
    bool m_copyOpacity;
    // property 65
    bool m_pulseMainOnly;
    // property 66
    bool m_pulseDetailOnly;
    // property 86
    bool m_pulseExclusive;
    // property 210
    bool m_property210;
    // property 56
    bool m_activateGroup;
    // property 81
    bool m_touchHoldMode;
    // property 82
    TouchToggleMode m_touchToggleMode;
    // property 198
    int m_touchPlayerMode;
    // property 89
    bool m_isDualMode;
    // property 76
    int m_animationID;
    PAD = android 0x8, win 0x8, mac 0x8;
    // property 87
    bool m_isMultiTriggered;
    PAD = android 0x2, win 0x2, mac 0x2;
    // property 93
    bool m_triggerOnExit;
    // property 95
    int m_itemID2;
    // property 534
    int m_property534;
    PAD = android 0x1, win 0x1, mac 0x1;
    // property 94
    bool m_isDynamicBlock;
    // property 80
    int m_itemID;
    // property 138
    bool m_targetPlayer1;
    // property 200
    bool m_targetPlayer2;
    // property 201
    bool m_followCPP;
    // property 78
    bool m_subtractCount;
    // property 381
    bool m_collectibleIsPickupItem;
    // property 382
    bool m_collectibleIsToggleTrigger;
    // property 440
    int m_collectibleParticleID;
    // property 383
    int m_collectiblePoints;
    // property 463
    bool m_hasNoAnimation;
    PAD = android32 0x1f, android64 0x23, win 0x23, mac 0x23;
    // property 148
    float m_gravityValue;
    // property 284
    bool m_isSinglePTouch;
    PAD = android 0x3, win 0x3, mac 0x3;
    // property 371
    float m_zoomValue;
    // property 111
    bool m_cameraIsFreeMode;
    // property 112
    bool m_cameraEditCameraSettings;
    // property 113
    float m_cameraEasingValue;
    // property 114
    float m_cameraPaddingValue;
    // property 370
    bool m_cameraDisableGridSnap;
    // property 118
    bool m_property118;
    // property 120
    float m_timeWarpTimeMod;
    // property 13
    bool m_shouldPreview;
    // property 115
    int m_ordValue;
    // property 170
    int m_channelValue;
    // property 117
    bool m_isReverse;
    PAD = android 0xb, win 0xb, mac 0xb;
    // property 12
    int m_secretCoinID;
    PAD = android32 0x1c, android64 0x24, win 0x24, mac 0x24;
    // property 280
    bool m_ignoreGroupParent;
    // property 281
    bool m_ignoreLinkedObjects;
    PAD = android 0x1, win 0x1, mac 0x1;
}

[[link(android), depends(CAState), depends(PulseEffectAction), depends(CountTriggerAction), depends(OpacityEffectAction), depends(TouchToggleAction), depends(CollisionTriggerAction), depends(ToggleTriggerAction), depends(SpawnTriggerAction), depends(GroupCommandObject2), depends(TimerItem), depends(TimerTriggerAction)]]
class EffectManagerState {
    // ~EffectManagerState();
    // EffectManagerState();

    gd::vector<CAState> m_unkVecCAState;
    gd::vector<PulseEffectAction> m_unkVecPulseEffectAction;
    gd::unordered_map<int,gd::vector<PulseEffectAction>> m_unorderedMapInt_vectorPulseEffectAction;
    gd::unordered_map<int,gd::vector<CountTriggerAction>> m_unorderedMapInt_vectorCountTriggerAction;
    gd::unordered_set<int> m_unorderedSet_int1;
    gd::map<int,int> m_mapInt_Int;
    gd::unordered_map<int,OpacityEffectAction> m_unorderedMapInt_OpacityEffectAction;
    gd::vector<TouchToggleAction> m_vectorTouchToggleAction;
    gd::vector<CollisionTriggerAction> m_vectorCollisionTriggerAction;
    gd::vector<ToggleTriggerAction> m_vectorToggleTriggerAction;
    gd::vector<SpawnTriggerAction> m_vectorSpawnTriggerAction;
    gd::unordered_map<int,int> m_unorderedMapInt_int;
    gd::unordered_map<int,bool> m_unorderedMapInt_bool;
    gd::vector<GroupCommandObject2> m_vectorGroupCommandObject2;
    gd::unordered_map<int,std::pair<double,double>> m_unorderedMapInt_pair_double_double;
    gd::unordered_set<int> m_unorderedSet_int2;
    gd::unordered_map<int,TimerItem> m_unorderedMapInt_TimerItem;
    gd::unordered_map<int,gd::vector<TimerTriggerAction>> m_unorderedMapInt_vectorTimerTriggerAction;
}

[[link(android)]]
class EndLevelLayer : GJDropDownLayer {
    // virtual ~EndLevelLayer();
    // EndLevelLayer();

    static EndLevelLayer* create(PlayLayer* playLayer);

    TodoReturn coinEnterFinished(cocos2d::CCPoint) = win 0x134230;
    TodoReturn coinEnterFinishedO(cocos2d::CCObject*) = win 0x1341f0;
    TodoReturn currencyEnterFinished();
    TodoReturn diamondEnterFinished();
    TodoReturn getCoinString() = win 0x132d30;
    const char* getEndText() = win 0x135190;
    void goEdit() = win 0x1336e0;
    bool init(PlayLayer* playLayer);
    void onEdit(cocos2d::CCObject* sender) = win 0x1335e0;
    void onEveryplay(cocos2d::CCObject* sender);
    void onHideLayer(cocos2d::CCObject* sender) = win 0x1337b0, imac 0x4ae2f0;
    void onLevelLeaderboard(cocos2d::CCObject* sender) = win 0x132c30;
    void onMenu(cocos2d::CCObject* sender) = win 0x133460;
    void onReplay(cocos2d::CCObject* sender) = win 0x133250;
    void onRestartCheckpoint(cocos2d::CCObject* sender) = win 0x133890;
    void playCoinEffect(float) = win 0x133fb0, imac 0x4ae8d0;
    void playCurrencyEffect(float) = win 0x134560;
    void playDiamondEffect(float) = win 0x1349f0;
    void playEndEffect() = win 0x134e80;
    void playStarEffect(float) = win 0x133ab0;
    TodoReturn starEnterFinished() = win 0x133e50;
    TodoReturn tryShowBanner(float);

    virtual void keyBackClicked() = win 0x133aa0;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x135140, imac 0x4af9a0;
    virtual void customSetup() = imac 0x4ac0f0;
    virtual void showLayer(bool) = win 0x133070;
    virtual void enterAnimFinished() {}
    virtual void keyUp(cocos2d::enumKeyCodes) {}

    PlayLayer* m_playLayer;
    bool m_notLocal;
    bool m_coinsVerified;
    bool m_unknown3;
    bool m_exiting;
    bool m_animateCoins;
    bool m_endEffectPlayed;
    cocos2d::CCMenu* m_sideMenu;
    cocos2d::CCArray* m_coinsToAnimate;
    cocos2d::CCPoint m_starsPosition;
    cocos2d::CCPoint m_orbsPosition;
    cocos2d::CCPoint m_diamondsPosition;
    int m_orbs;
    int m_stars;
    int m_moons;
    int m_diamonds;
    bool m_secretKey;
    bool m_hidden;
}

[[link(android)]]
class EndPortalObject : GameObject {
    // virtual ~EndPortalObject();

    static EndPortalObject* create() = imac 0x3885f0;

    cocos2d::CCPoint getSpawnPos() = win 0x136560;
    void triggerObject(GJBaseGameLayer*);
    TodoReturn updateColors(cocos2d::ccColor3B);
    void updateEndPos(bool) = win 0x1367d0;

    virtual bool init() = imac 0x388690;
    virtual void setPosition(cocos2d::CCPoint const&);
    virtual void setVisible(bool) = imac 0x388ca0;

    cocos2d::CCSprite* m_gradientBar;
    bool m_flippedX;
    bool m_startPosHeightRelated;
}

[[link(android)]]
class EndTriggerGameObject : EffectGameObject {
    // virtual ~EndTriggerGameObject();

    static EndTriggerGameObject* create();

    virtual bool init();
    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = win 0x4a4000, imac 0x1c9a80;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);

    bool m_noEffects;
    bool m_noSFX;
    bool m_instant;
}

[[link(android)]]
class EnhancedGameObject : GameObject {
    // virtual ~EnhancedGameObject();
    // EnhancedGameObject();

    static EnhancedGameObject* create(char const*);

    TodoReturn createRotateAction(float, int);
    bool init(char const*) = win 0x1a16e0;
    TodoReturn previewAnimateOnTrigger();
    TodoReturn refreshRotateAction();
    TodoReturn resetSyncedAnimation();
    TodoReturn setupAnimationVariables();
    TodoReturn triggerAnimation();
    TodoReturn updateRotateAction(float);
    TodoReturn updateState(int);
    void updateUserCoin() = win 0x1a3850, imac 0x5a8af0;
    TodoReturn waitForAnimationTrigger();

    virtual void customSetup() = win 0x1a1ed0, imac 0x5b3660;
    virtual void resetObject() = win 0x1a1890;
    virtual void deactivateObject(bool);
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = imac 0x5b3170;
    virtual gd::string getSaveString(GJBaseGameLayer*);
    virtual void triggerActivated(float);
    virtual void restoreObject() = imac 0x5b2f30;
    virtual void animationTriggered();
    virtual void activatedByPlayer(PlayerObject*) = imac 0x5b3010;
    virtual bool hasBeenActivatedByPlayer(PlayerObject*) = imac 0x5b3060;
    TodoReturn resumeAudio();
    TodoReturn resumeAudioDelayed();
    virtual bool hasBeenActivated();
    virtual void saveActiveColors() = imac 0x5b30f0;
    virtual bool canAllowMultiActivate() = imac 0x5b2b90;
    virtual bool getHasSyncedAnimation();
    virtual bool getHasRotateAction();
    virtual bool canMultiActivate(bool) = imac 0x5b2fe0;
    virtual TodoReturn powerOnObject(int) = imac 0x5b2f70;
    virtual TodoReturn powerOffObject() = imac 0x5b2f90;
    virtual TodoReturn stateSensitiveOff(GJBaseGameLayer*);
    virtual void updateSyncedAnimation(float, int) = win 0x1a4d10, imac 0x2492e0;
    virtual TodoReturn updateAnimateOnTrigger(bool) = imac 0x24b220;

    PAD = android32 0x25, win 0x2a, android64 0x22, mac 0x22;

    bool m_hasCustomAnimation;
    bool m_hasCustomRotation;
    // property 98
    bool m_disableRotation;
    PAD = android32 0x3, win 0x3, android64 0x3, mac 0x3;

    // property 97
    float m_rotationSpeed;
    PAD = android32 0xc, win 0xc, android64 0xc, mac 0xc;

    // property 106
    bool m_animationRandomizedStart;
    // property 107
    float m_animationSpeed;
    // property 122
    bool m_animationShouldUseSpeed;
    // property 123
    bool m_animateOnTrigger;
    // property 126
    bool m_disableDelayedLoop;
    // property 127
    bool m_disableAnimShine;
    // property 462
    int m_singleFrame;
    // property 592
    bool m_animationOffset;
    PAD = android32 0xf, win 0xf, android64 0xf, mac 0xf;

    // property 214
    bool m_animateOnlyWhenActive;
    // property 444
    bool m_isNoMultiActivate;
    // property 99
    bool m_isMultiActivate;
    PAD = android32 0x4, win 0x4, android64 0x8, mac 0x8;
}

[[link(android)]]
class EnhancedTriggerObject : EffectGameObject {
    // virtual ~EnhancedTriggerObject();

    static EnhancedTriggerObject* create(char const*);

    bool init(char const*);

    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class EnterEffectInstance {
    // ~EnterEffectInstance();
    // EnterEffectInstance(EnterEffectInstance const&);
    // EnterEffectInstance(EnterEffectInstance&&);
    EnterEffectInstance(EnterEffectObject*, int, int, int, int, int, int);

    TodoReturn animateValue(int, float, float, float, int, float, int);
    TodoReturn getValue(int);
    TodoReturn loadTransitions(EnterEffectObject*, float);
    TodoReturn loadValuesFromObject(EnterEffectObject*);
    void setValue(int, float);
    void updateTransitions(float, GJBaseGameLayer*) = imac 0x5baa00;

    gd::map<int,EnterEffectAnimValue> m_enterEffectAnimMap;
    PAD = win 0x8c;
    GameObject* m_gameObject;
    PAD = win 0x1c;
    gd::vector<int> m_unkVecInt;
    PAD = win 0x4;
}

[[link(android)]]
class EnterEffectObject : EffectGameObject {
    // virtual ~EnterEffectObject();

    static EnterEffectObject* create(char const*);

    bool init(char const*);
    TodoReturn resetEnterAnimValues();

    virtual void customSetup() = imac 0x185e70;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class EventLinkTrigger : EffectGameObject {
    // virtual ~EventLinkTrigger();

    static EventLinkTrigger* create();

    virtual bool init();
    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = imac 0x1bf720;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = imac 0x1c05f0;
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class ExplodeItemNode : cocos2d::CCNode {
    // virtual ~ExplodeItemNode();

    static ExplodeItemNode* create(cocos2d::CCRenderTexture*);

    TodoReturn createSprites(int, int, float, float, float, float, float, float, cocos2d::ccColor4F, cocos2d::ccColor4F, bool);
    bool init(cocos2d::CCRenderTexture*);

    virtual void update(float) = imac 0x202430;

    cocos2d::CCRenderTexture* m_renderTexture;
    cocos2d::CCArray* m_sprites;
    float m_unk1;
    float m_unk2;
    bool m_unk3;
}

[[link(android)]]
class ExplodeItemSprite : cocos2d::CCSprite {
    // virtual ~ExplodeItemSprite();

    static ExplodeItemSprite* create();

    virtual bool init();

    float m_unk1;
    float m_unk2;
    float m_unk3;
    float m_unk4;
    float m_unk5;
    cocos2d::CCParticleSystemQuad* m_unk6;
}

[[link(android)]]
class ExtendedLayer : cocos2d::CCLayer {
    // virtual ~ExtendedLayer();
    ExtendedLayer() {}

    static ExtendedLayer* create() {
    	auto ret = new ExtendedLayer();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    virtual bool init();
    virtual void setPosition(cocos2d::CCPoint const&) = win 0x3ecb0;

    BoomScrollLayerDelegate* m_delegate;
}

[[link(android)]]
class FileOperation {
    static gd::string getFilePath();
    static void readFile();
    static void saveFile();
}

[[link(android)]]
class FileSaveManager : GManager {
    // virtual ~FileSaveManager();

    static FileSaveManager* sharedState();

    TodoReturn getStoreData();
    TodoReturn loadDataFromFile(char const*);

    virtual bool init();
    virtual void firstLoad();
}

[[link(android)]]
class FindBPMLayer : CreateGuidelinesLayer {
    // virtual ~FindBPMLayer();

    static FindBPMLayer* create(int);

    TodoReturn calculateBPM();
    bool init(int);

    virtual void onClose(cocos2d::CCObject* sender);
    virtual TodoReturn playMusic();
    virtual TodoReturn registerTouch() = win 0x9b780, imac 0x4f6c80;
    virtual void onInfo(cocos2d::CCObject* sender) {}
    virtual void onRecord(cocos2d::CCObject* sender) = win 0x9b4a0;
    virtual TodoReturn recordingDidStop() = win 0x9b660, imac 0x4f6b20;
}

[[link(android)]]
class FindObjectPopup : SetIDPopup {
    // virtual ~FindObjectPopup();

    static FindObjectPopup* create();

    void onFindObjectID(cocos2d::CCObject* sender) {
    	m_unknownBool = !m_unknownBool;
    }

    virtual bool init() = imac 0x299810;

    bool m_unknownBool;
}

[[link(android)]]
class FLAlertLayer : cocos2d::CCLayerColor {
    ~FLAlertLayer();
    	FLAlertLayer() { // ios 0xa7ec : this seems too small?
    	m_buttonMenu = nullptr;
    	m_controlConnected = -1;
    	m_mainLayer = nullptr;
    	m_ZOrder = 0;
    	m_noElasticity = false;
    	m_reverseKeyBack = false;
    	m_scene = nullptr;
    	m_alertProtocol = nullptr;
    	m_scrollingLayer = nullptr;
    	m_button2 = nullptr;
    	m_button1 = nullptr;
    	m_joystickConnected = -1;
    	m_containsBorder = 0;
    	m_forcePrioRegistered = false;
    }

    static FLAlertLayer* create(FLAlertLayerProtocol* delegate, char const* title, gd::string desc, char const* btn1, char const* btn2, float width, bool scroll, float height, float textScale) = win 0x51940, imac 0x487550;
    static FLAlertLayer* create(FLAlertLayerProtocol* delegate, char const* title, gd::string desc, char const* btn1, char const* btn2, float width) = win 0x51890;
    static FLAlertLayer* create(FLAlertLayerProtocol* delegate, char const* title, gd::string desc, char const* btn1, char const* btn2) {
    	return FLAlertLayer::create(delegate, title, desc, btn1, btn2, 300.0);
    }

    static FLAlertLayer* create(char const* title, const gd::string& desc, char const* btn) {
    	return FLAlertLayer::create(nullptr, title, desc, btn, nullptr, 300.0);
    }

    void incrementForcePrio();
    bool init(FLAlertLayerProtocol*, char const*, gd::string, char const*, char const*, float, bool, float, float) = win 0x51b60, imac 0x4877d0;
    bool init(int) = win 0x51a50, imac 0x488250;
    void onBtn1(cocos2d::CCObject* sender) = win 0x52940;
    void onBtn2(cocos2d::CCObject* sender) = win 0x529a0;

    // virtual void onEnter() = ios 0x2bd0d8; // only exists on armv7...
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x52a00, imac 0x488600;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x52aa0, imac 0x488720;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x52880, imac 0x4884e0;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x52800, imac 0x488430;
    virtual void show() = win 0x52b90, imac 0x4888c0;

    cocos2d::CCMenu* m_buttonMenu;
    FLAlertLayerProtocol* m_alertProtocol;
    cocos2d::CCNode* m_scene;
    bool m_reverseKeyBack;
    cocos2d::ccColor3B m_color;
    cocos2d::CCLayer* m_mainLayer;
    int m_ZOrder;
    bool m_noElasticity;
    cocos2d::ccColor3B m_color2;
    ButtonSprite* m_button1;
    ButtonSprite* m_button2;
    ScrollingLayer* m_scrollingLayer;
    int m_controlConnected;
    bool m_containsBorder;
    bool m_noAction;
    int m_joystickConnected;
    bool m_forcePrioRegistered;
}

[[link(android)]]
class FLAlertLayerProtocol {
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) {}
}

[[link(android)]]
class FMODQueuedEffect {
    PAD = win 0x70, android32 0x48, android64 0x58;
}

[[link(android), depends(FMODAudioState), depends(FMODSoundState), depends(FMODMusic), depends(FMODSound), depends(FMODQueuedEffect), depends(FMODQueuedMusic), depends(FMODSoundTween)]]
class FMODAudioEngine : cocos2d::CCNode {
    // virtual ~FMODAudioEngine();
    FMODAudioEngine() = win 0x530d0;

    static FMODAudioEngine* sharedEngine() {
    	auto** instancePtr = reinterpret_cast<FMODAudioEngine**>(geode::base::get() + 0x6a3e18);
    	if (!*instancePtr) {
    		*instancePtr = new FMODAudioEngine();
    		(*instancePtr)->init();
    	}
    	return *instancePtr;
    }
    static FMODAudioEngine* get() {
    	return FMODAudioEngine::sharedEngine();
    }

    TodoReturn activateQueuedMusic(int);
    FMOD::Channel* channelForChannelID(int) = win 0x58480;
    TodoReturn channelForUniqueID(int);
    TodoReturn channelIDForUniqueID(int);
    TodoReturn channelLinkSound(int, FMODSound*);
    TodoReturn channelStopped(FMOD::Channel*, bool);
    TodoReturn channelUnlinkSound(int);
    void clearAllAudio() = win 0x552e0;
    TodoReturn countActiveEffects();
    TodoReturn countActiveMusic();
    TodoReturn createStream(gd::string);
    void disableMetering() {
    	this->m_metering = false;
    }
    void enableMetering() {
    	this->m_metering = true;
    	this->m_pulse1 = 0.1f;
    	this->m_pulse2 = 0.1f;
    	this->m_pulse3 = 0.0f;
    }
    TodoReturn fadeInBackgroundMusic(float) = imac 0x3d3c80;
    void fadeInMusic(float, int) = win 0x5c3c0;
    float fadeOutMusic(float, int) = win 0x5c500;
    TodoReturn getActiveMusic(int);
    FMOD::Channel* getActiveMusicChannel(int musicChannel) {
    	// TODO: this might do other checks or whatever but i cant be bothered
    	return m_channelIDToChannel[m_musicChannels[musicChannel].m_channelID];
    }
    float getBackgroundMusicVolume() {
    	return m_musicVolume;
    }
    FMOD::ChannelGroup* getChannelGroup(int, bool) = win 0x56b20;
    float getEffectsVolume() {
    	return m_sfxVolume;
    }
    gd::string getFMODStatus(int) = win 0x5cdb0, imac 0x3d76f0;
    float getMeteringValue();
    TodoReturn getMusicChannelID(int);
    unsigned int getMusicLengthMS(int channel) = win 0x5c330;
    TodoReturn getMusicTime(int);
    unsigned int getMusicTimeMS(int channel) = win 0x5c2d0;
    TodoReturn getNextChannelID();
    TodoReturn getTweenContainer(AudioTargetType);
    bool isChannelStopping(int);
    bool isEffectLoaded(gd::string path);
    bool isMusicPlaying(gd::string path, int p1) = win 0x59ee0, imac 0x3d3e60;
    bool isMusicPlaying(int channel) = win 0x59d00, imac 0x3d3d30;
    bool isSoundReady(FMOD::Sound* sound);
    TodoReturn lengthForSound(gd::string path);
    TodoReturn loadAndPlayMusic(gd::string path, unsigned int p1, int p2);
    TodoReturn loadAudioState(FMODAudioState&);
    void loadMusic(gd::string path, float speed, float p2, float volume, bool shouldLoop, int p5, int p6) = win 0x5a280;
    void loadMusic(gd::string path) {
    	this->loadMusic(path, 1.f, 0.f, 1.f, false, 0, 0);
    }
    void pauseAllAudio() = imac 0x3ca6d0;
    void pauseAllEffects() {
    	m_globalChannel->setPaused(true);
    }
    void pauseAllMusic() {
    	for (auto& [id, channel] : m_musicChannels) {
    		auto ch = this->channelForChannelID(channel.m_channelID);
    		if (ch)
    			ch->setPaused(true);
    	}
    }
    TodoReturn pauseEffect(unsigned int);
    void pauseMusic(int musicChannel) {
    	auto* channel = this->getActiveMusicChannel(musicChannel);
    	if (channel)
    		channel->setPaused(true);
    }
    TodoReturn pitchForIdx(int);
    void playEffect(gd::string path, float speed, float p2, float volume) = win 0x56e10;
    void playEffect(gd::string path) = win 0x56d90;
    void playEffectAdvanced(gd::string path, float speed, float p2, float volume, float pitch, bool fastFourierTransform, bool reverb, int startMillis, int endMillis, int fadeIn, int fadeOut, bool loopEnabled, int p12, bool override, bool p14, int p15, int uniqueID, float minInterval, int sfxGroup) = win 0x56f00;
    TodoReturn playEffectAsync(gd::string path);
    void playMusic(gd::string path, bool shouldLoop, float fadeInTime, int channel);
    FMODSound& preloadEffect(gd::string path) = win 0x59260;
    void preloadEffectAsync(gd::string path);
    TodoReturn preloadMusic(gd::string path, bool p1, int p2);
    TodoReturn printResult(FMOD_RESULT);
    TodoReturn queuedEffectFinishedLoading(gd::string);
    TodoReturn queuePlayEffect(gd::string, float, float, float, float, bool, bool, int, int, int, int, bool, int, bool, int, float, int) = win 0x57920;
    void queueStartMusic(gd::string audioFilename, float, float, float, bool, int ms, int, int, int, int, bool, int, bool) = win 0x3de860;
    TodoReturn registerChannel(FMOD::Channel*, int, int);
    void releaseRemovedSounds();
    void resumeAllAudio() = imac 0x3ca720;
    void resumeAllEffects() {
    	m_globalChannel->setPaused(false);
    }
    void resumeAllMusic() = win 0x59e80, imac 0x3d3e00;
    void resumeAudio() {
    	this->start();
    }
    void resumeEffect(unsigned int) {}
    void resumeMusic(int musicChannel) {
    	auto* channel = this->getActiveMusicChannel(musicChannel);
    	if (channel)
    		channel->setPaused(false);
    }
    TodoReturn reverbToString(FMODReverbPreset);
    TodoReturn saveAudioState(FMODAudioState&) = win 0x558f0;
    void setBackgroundMusicVolume(float volume) {
    	m_musicVolume = volume;
    	if (m_backgroundMusicChannel) m_backgroundMusicChannel->setVolume(volume);
    }
    void setChannelPitch(int, AudioTargetType, float);
    void setChannelVolume(int, AudioTargetType, float) = imac 0x3d0380;
    void setChannelVolumeMod(int, AudioTargetType, float) = win 0x58f80;
    void setEffectsVolume(float volume) {
    	m_sfxVolume = volume;
    	if (m_globalChannel) m_globalChannel->setVolume(volume);
    }
    void setMusicTimeMS(unsigned int ms, bool, int channel) = win 0x5c190, imac 0x3cf6d0;
    void setup() = win 0x53bc0;
    void setupAudioEngine() = win 0x540a0, imac 0x3c9ab0;
    void start() = win 0x55280;
    TodoReturn startMusic(int, int, int, int, bool, int);
    void stop();
    void stopAllEffects() = win 0x598b0;
    void stopAllMusic() {
    	if (m_backgroundMusicChannel) m_backgroundMusicChannel->stop();
    	m_audioState.m_unkMapIntFloat7.clear();
    	m_audioState.m_unkMapIntFloat8.clear();
    	m_audioState.m_unkMapIntFloat9.clear();
    }
    TodoReturn stopAndGetFade(FMOD::Channel*);
    TodoReturn stopAndRemoveMusic(int);
    void stopChannel(FMOD::Channel*, bool, float) = win 0x58810;
    TodoReturn stopChannel(int, AudioTargetType, bool, float);
    TodoReturn stopChannel(int);
    TodoReturn stopChannelTween(int, AudioTargetType, AudioModType);
    TodoReturn stopChannelTweens(int, AudioTargetType);
    TodoReturn stopMusic(int);
    TodoReturn stopMusicNotInSet(std::unordered_set<int, std::hash<int>, std::equal_to<int>, std::allocator<int> >&);
    TodoReturn storeEffect(FMOD::Sound* sound, gd::string path) = win 0x59510;
    TodoReturn swapMusicIndex(int, int);
    TodoReturn testFunction(int);
    TodoReturn triggerQueuedMusic(FMODQueuedMusic);
    TodoReturn unloadAllEffects() = win 0x59aa0;
    TodoReturn unloadEffect(gd::string path);
    TodoReturn unregisterChannel(int);
    void updateBackgroundFade();
    TodoReturn updateChannel(int, AudioTargetType, AudioModType, float, float);
    TodoReturn updateChannelTweens(float) = imac 0x3cc660;
    void updateMetering();
    void updateQueuedEffects() = win 0x5aec0;
    void updateQueuedMusic();
    void updateReverb(FMODReverbPreset, bool) = win 0x54400, imac 0x3ca090;
    void updateTemporaryEffects() = win 0x5b410, imac 0x3cbc60;
    TodoReturn waitUntilSoundReady(FMOD::Sound*);

    virtual void update(float) = win 0x55390;

    // not sure on the name, the system is quite confusing
    gd::unordered_map<int, FMODMusic> m_musicChannels;
    gd::unordered_map<gd::string, FMODMusic> m_unkMap180;
    gd::unordered_set<gd::string> m_unkMap1c0;
    float m_musicVolume;
    float m_sfxVolume;
    int m_unusedInt164;
    int m_unusedInt168;
    float m_pulse1;
    float m_pulse2;
    float m_pulse3;
    int m_pulseCounter;
    bool m_metering;
    FMOD::ChannelGroup* m_backgroundMusicChannel;
    FMOD::System* m_system;
    FMOD::DSP* m_mainDSP;
    FMOD::DSP* m_globalChannelDSP;
    FMOD::ChannelGroup* m_globalChannel;
    FMOD::ChannelGroup* m_channelGroup2;
    FMOD_RESULT m_lastResult;
    int m_sampleRate;
    bool m_reducedQuality;
    bool m_unkBool1a1;
    int m_musicOffset;
    bool m_unkBool1a8;
    int m_unkInt1ac;
    FMODAudioState m_audioState;
    gd::vector<FMOD::Sound*> m_unkSoundVector;
    gd::unordered_map<int, FMOD::DSP*> m_unkDSPMap384;
    gd::unordered_map<int, FMOD::Channel*> m_channelIDToChannel;
    gd::unordered_set<int> m_unkIntSet3bc;
    FMODReverbPreset m_reverbPreset;
    gd::unordered_map<int, int> m_unkMapIntInt3dc;
    gd::unordered_map<int, int> m_unkMapIntInt3f8;
    gd::unordered_map<int, gd::string> m_unkMapIntString414;
    gd::vector<FMODQueuedEffect> m_queuedEffects;
    gd::unordered_map<gd::string, FMOD::Sound*> m_unkMapStringSound43c;
    gd::unordered_map<int, FMOD::ChannelGroup*> m_unkMapIntChannelGroup458;
    gd::unordered_map<int, FMOD::ChannelGroup*> m_unkMapIntChannelGroup474;
    int m_unkInt490;
    int m_unkInt494;
    int m_unkInt498;
    int m_unkInt49c;
    int m_unkInt4a0;
    int m_unkInt4a4;
    int m_unkInt4a8;
    int m_unkInt4ac;
}

[[link(android)]]
class FMODAudioState {
    // ~FMODAudioState();
    // FMODAudioState();

    float m_unkFloat1;
    float m_unkFloat2;
    gd::map<std::pair<int,int>,FMODSoundTween> m_unkMapPairIntIntFMODSoundTween1;
    gd::map<std::pair<int,int>,FMODSoundTween> m_unkMapPairIntIntFMODSoundTween2;
    gd::map<std::pair<int,int>,FMODSoundTween> m_unkMapPairIntIntFMODSoundTween3;
    gd::unordered_map<int,float> m_unkMapIntFloat1;
    gd::unordered_map<int,float> m_unkMapIntFloat2;
    gd::unordered_map<int,float> m_unkMapIntFloat3;
    gd::unordered_map<int,float> m_unkMapIntFloat4;
    gd::unordered_map<int,float> m_unkMapIntFloat5;
    gd::unordered_map<int,float> m_unkMapIntFloat6;
    gd::unordered_map<int,float> m_unkMapIntFloat7;
    gd::unordered_map<int,float> m_unkMapIntFloat8;
    gd::unordered_map<int,float> m_unkMapIntFloat9;
    gd::unordered_map<int,float> m_unkMapIntFloat10;
    gd::unordered_map<int,FMODQueuedMusic> m_unkMapIntFMODQueuedMusic1;
    gd::unordered_map<int,FMODQueuedMusic> m_unkMapIntFMODQueuedMusic2;
    gd::unordered_map<int,FMODSoundState> m_unkMapIntFMODSoundState;
    int64_t m_unkInt1;
}

[[link(android)]]
class FMODLevelVisualizer : cocos2d::CCNode {
    // virtual ~FMODLevelVisualizer();

    static FMODLevelVisualizer* create() = win 0x297030;

    void updateVisualizer(float, float, float) = win 0x297570, imac 0x29cca0;

    virtual bool init();

    float m_width;
}

[[]]
class FMODMusic {
    int m_channelID;
    void* m_unk;
    gd::string m_filePath;
    // there might be other things, hard to know the size
}

[[link(android)]]
class FollowRewardPage : FLAlertLayer, FLAlertLayerProtocol, GameRateDelegate, RewardedVideoDelegate {
    // virtual ~FollowRewardPage();

    static FollowRewardPage* create() = win 0x137fc0;

    void onClose(cocos2d::CCObject* sender);
    void onRewardedVideo(cocos2d::CCObject* sender);
    void onSpecialItem(cocos2d::CCObject* sender) = win 0x13a340;
    void switchToOpenedState(CCMenuItemSpriteExtra*) = win 0x13b510, imac 0x40dd50;

    virtual bool init() = imac 0x40c640;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void show();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x13b5f0, imac 0x40e6d0;
    virtual void rewardedVideoFinished();
    virtual void updateRate();

    cocos2d::CCArray* m_chests;
    bool m_videoPlaying;
}

[[link(android)]]
class FontObject : cocos2d::CCObject {
    // virtual ~FontObject();
    FontObject() {}

    static FontObject* createWithConfigFile(char const* p0, float p1) {
    	auto ret = new FontObject();
    	if (ret->initWithConfigFile(p0, p1)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    int getFontWidth(int p0) {
    	return m_hugeIntArray[p0];
    }
    bool initWithConfigFile(char const* p0, float p1) {
    	this->parseConfigFile(p0, p1);
    	return true;
    }
    void parseConfigFile(char const*, float) = win 0x3b620, imac 0x20e1e0;

    std::array<int, 300> m_hugeIntArray;
}

[[link(android)]]
class ForceBlockGameObject : EffectGameObject {
    // virtual ~ForceBlockGameObject();

    static ForceBlockGameObject* create(char const*);

    TodoReturn calculateForceToTarget(GameObject*);
    bool init(char const*);

    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class FRequestProfilePage : FLAlertLayer, FLAlertLayerProtocol, UploadActionDelegate, UploadPopupDelegate, FriendRequestDelegate {
    // virtual ~FRequestProfilePage();

    static FRequestProfilePage* create(bool) = imac 0x778ce0;

    TodoReturn deleteSelected();
    bool init(bool) = win 0x13be30;
    bool isCorrect(char const*);
    void loadPage(int);
    void onClose(cocos2d::CCObject* sender);
    void onDeleteSelected(cocos2d::CCObject* sender);
    void onNextPage(cocos2d::CCObject* sender);
    void onPrevPage(cocos2d::CCObject* sender);
    void onSentRequests(cocos2d::CCObject* sender);
    void onToggleAllObjects(cocos2d::CCObject* sender);
    void onUpdate(cocos2d::CCObject* sender);
    void setupCommentsBrowser(cocos2d::CCArray*) = win 0x13da30;
    TodoReturn untoggleAll();
    TodoReturn updateLevelsLabel();
    TodoReturn updatePageArrows();

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x13d070, imac 0x77a4a0;
    virtual void onClosePopup(UploadActionPopup*);
    virtual void uploadActionFinished(int, int);
    virtual void uploadActionFailed(int, int);
    virtual TodoReturn loadFRequestsFinished(cocos2d::CCArray*, char const*) = win 0x13dbd0;
    virtual TodoReturn loadFRequestsFailed(char const*, GJErrorCode);
    virtual void setupPageInfo(gd::string, char const*) = win 0x13dcf0;
    virtual TodoReturn forceReloadRequests(bool) = win 0x13dcd0;
}

[[link(android)]]
class FriendRequestDelegate {
    virtual TodoReturn loadFRequestsFinished(cocos2d::CCArray*, char const*);
    virtual TodoReturn loadFRequestsFailed(char const*, GJErrorCode);
    virtual void setupPageInfo(gd::string, char const*);
    virtual TodoReturn forceReloadRequests(bool);
}

[[link(android)]]
class FriendRequestPopup : FLAlertLayer, UploadActionDelegate, UploadPopupDelegate, FLAlertLayerProtocol {
    // virtual ~FriendRequestPopup();

    static FriendRequestPopup* create(GJFriendRequest*);

    void blockUser();
    bool init(GJFriendRequest*) = imac 0x290ef0;
    void loadFromGJFriendRequest(GJFriendRequest*);
    void onAccept(cocos2d::CCObject* sender);
    void onBlock(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    void onRemove(cocos2d::CCObject* sender);

    virtual void keyBackClicked() = win 0x28f830;
    virtual void uploadActionFinished(int, int) = win 0x28f840;
    virtual void uploadActionFailed(int, int) = win 0x28f9f0, imac 0x292600;
    virtual void onClosePopup(UploadActionPopup*) = win 0x28fab0, imac 0x292750;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x28fb10;
}

[[link(android)]]
class FriendsProfilePage : FLAlertLayer, FLAlertLayerProtocol, UploadActionDelegate, UploadPopupDelegate, UserListDelegate {
    // virtual ~FriendsProfilePage();

    static FriendsProfilePage* create(UserListType) = win 0x13e010, imac 0x640b70;

    bool init(UserListType type) = win 0x13e160, imac 0x640d00;
    void onBlocked(cocos2d::CCObject* sender) = win 0x13ef50;
    void onClose(cocos2d::CCObject* sender) = win 0x13efe0;
    void onUpdate(cocos2d::CCObject* sender);
    void setupUsersBrowser(cocos2d::CCArray* users, UserListType type) = win 0x13e870, imac 0x6415a0;

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = imac 0x641b90;
    virtual void getUserListFinished(cocos2d::CCArray*, UserListType) = win 0x13ebd0, imac 0x641810;
    virtual void getUserListFailed(UserListType, GJErrorCode) = win 0x13ed20, imac 0x641950;
    virtual void userListChanged(cocos2d::CCArray*, UserListType);
    virtual void forceReloadList(UserListType) = win 0x13ed90, imac 0x641aa0;

    UserListType m_type;
    cocos2d::CCLabelBMFont* m_noInternet;
    cocos2d::CCLabelBMFont* m_totalFriends;
    GJCommentListLayer* m_listLayer;
    LoadingCircle* m_circle;
    void* m_unk532;
    cocos2d::CCArray* m_users;
    CCMenuItemSpriteExtra* m_refreshBtn;
}

[[link(android)]]
class GameCell : TableViewCell {
    // virtual ~GameCell();
    GameCell(char const*, float, float);

    void loadFromString(gd::string);
    void onTouch(cocos2d::CCObject* sender);
    void updateBGColor(int);

    virtual bool init();
    virtual void draw() = win 0x3cbf0;
}

[[link(android)]]
class GameEffectsManager : cocos2d::CCNode {
    // virtual ~GameEffectsManager();

    static GameEffectsManager* create(PlayLayer*);

    TodoReturn addParticleEffect(cocos2d::CCParticleSystemQuad*, int);
    bool init(PlayLayer*);
    TodoReturn scaleParticle(cocos2d::CCParticleSystemQuad*, float);
}

[[link(android)]]
class GameLevelManager : cocos2d::CCNode {
    // virtual ~GameLevelManager();

    static GameLevelManager* sharedState();
    static GameLevelManager* get() {
    	return GameLevelManager::sharedState();
    }

    void acceptFriendRequest(int, int) = imac 0x53dbc0;
    int accountIDForUserID(int userID);
    void addDLToActive(char const*);
    bool areGauntletsLoaded();
    void banUser(int);
    void blockUser(int);
    void cleanupDailyLevels() = win 0x1485e0;
    bool createAndGetAccountComments(gd::string, int);
    bool createAndGetCommentsFull(gd::string, int, bool);
    bool createAndGetLevelComments(gd::string, int);
    cocos2d::CCArray* createAndGetLevelLists(gd::string);
    cocos2d::CCArray* createAndGetLevels(gd::string);
    cocos2d::CCArray* createAndGetMapPacks(gd::string);
    cocos2d::CCArray* createAndGetScores(gd::string, GJScoreType);
    GJGameLevel* createNewLevel() = win 0x142800, imac 0x515950;
    GJLevelList* createNewLevelList() = win 0x1432b0;
    TodoReturn createPageInfo(int, int, int);
    GJSmartTemplate* createSmartTemplate();
    void dataLoaded(DS_Dictionary*) = win 0x149310, imac 0x5246e0;
    void deleteAccountComment(int, int);
    void deleteComment(int, CommentType, int);
    bool deleteFriendRequests(int, cocos2d::CCArray*, bool);
    void deleteLevel(GJGameLevel*) = win 0x142fe0, imac 0x516390;
    void deleteLevelComment(int, int);
    void deleteLevelList(GJLevelList*) = win 0x143890, imac 0x516c00;
    bool deleteSentFriendRequest(int) = imac 0x53d190;
    void deleteServerLevel(int) = win 0x152350;
    void deleteServerLevelList(int);
    void deleteSmartTemplate(GJSmartTemplate*);
    void deleteUserMessages(GJUserMessage* message, cocos2d::CCArray* messages, bool isSender) = win 0x158f20, imac 0x606fb0;
    void downloadLevel(int, bool) = win 0x14fde0;
    void downloadUserMessage(int, bool);
    void encodeDataTo(DS_Dictionary*) = win 0x148e00, imac 0x5241b0;
    void firstSetup();
    void followUser(int);
    GJFriendRequest* friendRequestFromAccountID(int);
    void friendRequestWasRemoved(int, bool);
    char const* getAccountCommentKey(int p0, int p1) {
    	return cocos2d::CCString::createWithFormat("%i_%i", p0, p1)->getCString();
    }
    void getAccountComments(int accountID, int page, int total) = imac 0x538db0;
    int getActiveDailyID(GJTimedLevelType);
    GJSmartTemplate* getActiveSmartTemplate();
    cocos2d::CCArray* getAllSmartTemplates();
    cocos2d::CCDictionary* getAllUsedSongIDs();
    gd::string getBasePostString() = win 0x14a4b0;
    bool getBoolForKey(char const* key) {
    	return m_searchFilters->valueForKey(key)->boolValue();
    }
    gd::string getCommentKey(int ID, int page, int mode, CommentKeyType keytype) {
    	return cocos2d::CCString::createWithFormat("comment_%i_%i_%i_%i", ID, page, mode, (int) keytype)->getCString();
    }
    cocos2d::CCArray* getCompletedLevels(bool) = win 0x145860;
    int getDailyID(GJTimedLevelType);
    double getDailyTimer(GJTimedLevelType);
    char const* getDeleteCommentKey(int, int, int);
    char const* getDeleteMessageKey(int, bool);
    char const* getDescKey(int);
    gd::string getActiveDailyID(bool, bool, bool, bool, bool, bool, bool, bool);
    char const* getDiffKey(int);
    bool getDiffVal(int);
    gd::string getFolderName(int, bool) = win 0x148910, imac 0x523960;
    char const* getFriendRequestKey(bool, int);
    void getFriendRequests(bool, int, int);
    char const* getGauntletKey(int);
    void getGauntletLevels(int);
    void getGauntlets();
    void getGauntletsearchKey(int);
    void getGJChallenges() = win 0x164ad0;
    void getGJDailyLevelState(GJTimedLevelType);
    void getGJRewards(int) = imac 0x5418c0;
    void getGJUserInfo(int) = win 0x157880, imac 0x535a90;
    int getHighestLevelOrder() = imac 0x51e060;
    int getIntForKey(char const* key) {
    	return m_searchFilters->valueForKey(key)->intValue();
    }
    void getLeaderboardScores(char const*) = win 0x1554b0;
    gd::string getLengthStr(bool, bool, bool, bool, bool, bool) = imac 0x527e60;
    const char * getLenKey(int len);
    bool getLenVal(int);
    void getLevelComments(int ID, int page, int total, int mode, CommentKeyType keytype) = win 0x159870;
    const char* getLevelDownloadKey(int levelID, bool isGauntlet) {
    	return cocos2d::CCString::createWithFormat("%i_%i", levelID, isGauntlet)->getCString();
    }
    const char* getLevelKey(int levelID) {
    	return cocos2d::CCString::createWithFormat("%i", levelID)->getCString();
    }
    void getLevelLeaderboard(GJGameLevel*, LevelLeaderboardType, LevelLeaderboardMode) = win 0x155ff0, imac 0x13b680;
    char const* getLevelLeaderboardKey(int, LevelLeaderboardType, LevelLeaderboardMode);
    char const* getLevelListKey(int);
    void getLevelLists(GJSearchObject*) = win 0x14e6e0;
    void getLevelSaveData() = win 0x14cd40;
    char const* getLikeAccountItemKey(LikeItemType, int, bool, int);
    char const* getLikeItemKey(LikeItemType, int, bool, int);
    GJGameLevel* getLocalLevel(int);
    GJGameLevel* getLocalLevelByName(gd::string);
    GJLevelList* getAllUsedSongIDs(int);
    int getLowestLevelOrder() = imac 0x51e0a0;
    GJGameLevel* getMainLevel(int levelID, bool dontGetLevelString) = win 0x1423e0;
    const char* getMapPackKey(int pack);
    void getMapPacks(GJSearchObject*) = win 0x14d470, imac 0x529df0;
    char const* getMessageKey(int);
    char const* getMessagesKey(bool, int);
    void getNews();
    int getNextFreeTemplateID();
    gd::string getNextLevelName(gd::string);
    void getOnlineLevels(GJSearchObject*) = win 0x14bb70;
    char const* getPageInfo(char const*);
    char const* getPostCommentKey(int);
    const char * getRateStarsKey(int key);
    char const* getReportKey(int);
    GJGameLevel* getSavedDailyLevel(int);
    GJGameLevel* getSavedDailyLevelFromLevelID(int) = imac 0x520980;
    GJMapPack* getSavedGauntlet(int);
    GJGameLevel* getSavedGauntletLevel(int);
    GJGameLevel* getSavedLevel(GJGameLevel*);
    GJGameLevel* getSavedLevel(int);
    GJLevelList* getSavedLevelList(int);
    cocos2d::CCArray* getSavedLevelLists(int);
    cocos2d::CCArray* getSavedLevels(bool, int) = win 0x145410;
    GJMapPack* getSavedMapPack(int);
    cocos2d::CCScene* getSearchScene(char const*) = imac 0x522180;
    int getSplitIntFromKey(char const*, int);
    cocos2d::CCArray* getStoredLevelComments(char const*);
    cocos2d::CCArray* getStoredOnlineLevels(char const*) = win 0x147780;
    cocos2d::CCArray* getStoredUserList(UserListType) = imac 0x53eb10;
    GJUserMessage* getStoredUserMessage(int);
    GJUserMessage* getStoredUserMessageReply(int);
    double getTimeLeft(char const*, float);
    void getTopArtists(int page, int total);
    const char* getTopArtistsKey(int page) {
    	return cocos2d::CCString::createWithFormat("topArtists_%i", page)->getCString();
    }
    char const* getUploadMessageKey(int);
    char const* getUserInfoKey(int);
    void getUserList(UserListType) = win 0x15ffa0, imac 0x53f630;
    void getUserMessages(bool, int, int);
    void getUsers(GJSearchObject*) = win 0x1571c0;
    void gotoLevelPage(GJGameLevel*);
    void handleIt(bool, gd::string, gd::string, GJHttpType) = win 0x140e00;
    void handleItDelayed(bool, gd::string, gd::string, GJHttpType);
    void handleItND(cocos2d::CCNode*, void*);
    bool hasDailyStateBeenLoaded(GJTimedLevelType) = imac 0x542ce0;
    bool hasDownloadedLevel(int);
    bool hasDownloadedList(int);
    bool hasLikedAccountItem(LikeItemType, int, bool, int);
    bool hasLikedItem(LikeItemType, int, bool, int) = win 0x1623d0;
    bool hasLikedItemFullCheck(LikeItemType, int, int) = win 0x162340, imac 0x540880;
    bool hasRatedDemon(int);
    bool hasRatedLevelStars(int);
    bool hasReportedLevel(int);
    void invalidateMessages(bool, bool);
    void invalidateRequests(bool, bool);
    void invalidateUserList(UserListType, bool) = win 0x160840;
    bool isDLActive(char const* tag);
    bool isFollowingUser(int);
    bool isTimeValid(char const*, float);
    bool isUpdateValid(int id) {
    	const char* str = cocos2d::CCString::createWithFormat("%i", id)->getCString();

    	return this->isTimeValid(str, 3600.f);
    }
    int itemIDFromLikeKey(char const*);
    bool keyHasTimer(char const*);
    int levelIDFromCommentKey(char const*);
    int levelIDFromPostCommentKey(char const*);
    int likeFromLikeKey(char const*);
    void likeItem(LikeItemType, int, bool, int) = win 0x161270;
    void limitSavedLevels() = win 0x148090, imac 0x573a80;
    void makeTimeStamp(char const*) = win 0x147b90, imac 0x521610;
    void markItemAsLiked(LikeItemType, int, bool, int);
    void markLevelAsDownloaded(int) = win 0x151510;
    void markLevelAsRatedDemon(int);
    void markLevelAsRatedStars(int);
    void markLevelAsReported(int);
    void markListAsDownloaded(int id) {
    	this->markLevelAsDownloaded(-id);
    }
    void messageWasRemoved(int, bool);
    void onAcceptFriendRequestCompleted(gd::string response, gd::string tag);
    void onBanUserCompleted(gd::string response, gd::string tag);
    void onBlockUserCompleted(gd::string response, gd::string tag);
    void onDeleteCommentCompleted(gd::string response, gd::string tag);
    void onDeleteFriendRequestCompleted(gd::string response, gd::string tag);
    void onDeleteServerLevelCompleted(gd::string response, gd::string tag);
    void onDeleteServerLevelListCompleted(gd::string response, gd::string tag) = imac 0x5142c0;
    void onDeleteUserMessagesCompleted(gd::string response, gd::string tag);
    void onDownloadLevelCompleted(gd::string response, gd::string tag);
    void onDownloadUserMessageCompleted(gd::string response, gd::string tag);
    void onGetAccountCommentsCompleted(gd::string response, gd::string tag);
    void onGetFriendRequestsCompleted(gd::string response, gd::string tag) = win 0x15d510;
    void onGetGauntletsCompleted(gd::string response, gd::string tag);
    void onGetGJChallengesCompleted(gd::string response, gd::string tag) = imac 0x50fe80;
    void onGetGJDailyLevelStateCompleted(gd::string response, gd::string tag);
    void onGetGJRewardsCompleted(gd::string response, gd::string tag);
    void onGetGJUserInfoCompleted(gd::string response, gd::string tag);
    void onGetLeaderboardScoresCompleted(gd::string response, gd::string tag) = win 0x155b80;
    void onGetLevelCommentsCompleted(gd::string response, gd::string tag);
    void onGetLevelLeaderboardCompleted(gd::string response, gd::string tag);
    void onGetLevelListsCompleted(gd::string response, gd::string tag) = win 0x14e970;
    void onGetLevelSaveDataCompleted(gd::string response, gd::string tag);
    void onGetMapPacksCompleted(gd::string response, gd::string tag) = win 0x14d680;
    void onGetNewsCompleted(gd::string response, gd::string tag);
    void onGetOnlineLevelsCompleted(gd::string response, gd::string tag) = win 0x14c3d0;
    void onGetTopArtistsCompleted(gd::string response, gd::string tag);
    void onGetUserListCompleted(gd::string response, gd::string tag);
    void onGetUserMessagesCompleted(gd::string response, gd::string tag);
    void onGetUsersCompleted(gd::string response, gd::string tag);
    void onLikeItemCompleted(gd::string response, gd::string tag);
    void onProcessHttpRequestCompleted(cocos2d::extension::CCHttpClient*, cocos2d::extension::CCHttpResponse*) = win 0x140d10;
    void onRateDemonCompleted(gd::string response, gd::string tag);
    void onRateStarsCompleted(gd::string response, gd::string tag);
    void onReadFriendRequestCompleted(gd::string response, gd::string tag);
    void onRemoveFriendCompleted(gd::string response, gd::string tag);
    void onReportLevelCompleted(gd::string response, gd::string tag);
    void onRequestUserAccessCompleted(gd::string response, gd::string tag);
    void onRestoreItemsCompleted(gd::string response, gd::string tag) = imac 0x50bfa0;
    void onSetLevelFeaturedCompleted(gd::string response, gd::string tag);
    void onSetLevelStarsCompleted(gd::string response, gd::string tag);
    void onSubmitUserInfoCompleted(gd::string response, gd::string tag);
    void onSuggestLevelStarsCompleted(gd::string response, gd::string tag);
    void onUnblockUserCompleted(gd::string response, gd::string tag);
    void onUpdateDescriptionCompleted(gd::string response, gd::string tag);
    void onUpdateLevelCompleted(gd::string response, gd::string tag);
    void onUpdateUserScoreCompleted(gd::string response, gd::string tag) = imac 0x509a40;
    void onUploadCommentCompleted(gd::string response, gd::string tag) = win 0x15bde0, imac 0x50abb0;
    void onUploadFriendRequestCompleted(gd::string response, gd::string tag);
    void onUploadLevelCompleted(gd::string response, gd::string tag) = win 0x14b1a0;
    void onUploadLevelListCompleted(gd::string response, gd::string tag) = imac 0x5140d0;
    void onUploadUserMessageCompleted(gd::string response, gd::string tag);
    int pageFromCommentKey(char const*);
    void parseRestoreData(gd::string);
    void performNetworkTest();
    void ProcessHttpRequest(gd::string endpoint, gd::string params, gd::string tag, GJHttpType httpType) = win 0x140b70, imac 0x504320;
    void processOnDownloadLevelCompleted(gd::string response, gd::string tag, bool) = win 0x150350;
    void purgeUnusedLevels() = win 0x148330;
    void rateDemon(int, int, bool);
    void rateStars(int, int);
    void readFriendRequest(int);
    TodoReturn removeDelimiterChars(gd::string, bool) = win 0x167f10;
    void removeDLFromActive(char const*);
    void removeFriend(int);
    void removeLevelDownloadedKeysFromDict(cocos2d::CCDictionary*);
    void removeUserFromList(int, UserListType);
    void reportLevel(int);
    void requestUserAccess();
    void resetAccountComments(int accountID) {
    	for(int i = 0; i <= 1; i++) {
    		auto key = getAccountCommentKey(accountID, i);
    		if(getStoredOnlineLevels(key)) {
    			m_storedLevels->removeObjectForKey(key);
    		}
    	}
    }
    void resetAllTimers();
    void resetCommentTimersForLevelID(int, CommentKeyType) = win 0x15c770, imac 0x53b810;
    void resetDailyLevelState(GJTimedLevelType) = imac 0x542ca0;
    void resetGauntlets();
    void resetStoredUserInfo(int id) {
        m_storedUserInfo->removeObjectForKey(id);
    }
    void resetStoredUserList(UserListType);
    void resetTimerForKey(char const*);
    static cocos2d::CCDictionary* responseToDict(gd::string, bool) = win 0x168140;
    void restoreItems();
    void saveFetchedLevelLists(cocos2d::CCArray* lists) {
    	for (int i = 0; i < lists->count(); i++) {
    		this->saveLevelList(static_cast<GJLevelList*>(lists->objectAtIndex(i)));
    	}
    }
    void saveFetchedLevels(cocos2d::CCArray*) = imac 0x51a8c0;
    void saveFetchedMapPacks(cocos2d::CCArray*);
    void saveGauntlet(GJMapPack*);
    void saveLevel(GJGameLevel*) = win 0x146d40, imac 0x5209d0;
    void saveLevelList(GJLevelList*);
    void saveLocalScore(int, int, int);
    void saveMapPack(GJMapPack*);
    void setActiveSmartTemplate(GJSmartTemplate*);
    void setBoolForKey(bool value, char const* key) {
    	m_searchFilters->setObject(cocos2d::CCString::createWithFormat("%i", (int)value), key);
    }
    void setDiffVal(int, bool);
    void setFolderName(int, gd::string, bool) = imac 0x523b10;
    void setIntForKey(int value, char const* key) {
    	m_searchFilters->setObject(cocos2d::CCString::createWithFormat("%i", value), key);
    }
    void setLenVal(int, bool);
    void setLevelFeatured(int, int, bool);
    void setLevelStars(int, int, bool);
    int specialFromLikeKey(char const*);
    void storeCommentsResult(cocos2d::CCArray*, gd::string, char const*);
    void storeDailyLevelState(int, int, GJTimedLevelType) = imac 0x542b80;
    void storeFriendRequest(GJFriendRequest*);
    void storeSearchResult(cocos2d::CCArray* levels, gd::string pageInfo, char const* searchKey) = win 0x147570;
    void storeUserInfo(GJUserScore*);
    void storeUserMessage(GJUserMessage*);
    void storeUserMessageReply(int, GJUserMessage*);
    void storeUserName(int userID, int accountID, gd::string userName) = win 0x143ca0;
    void storeUserNames(gd::string usernameString) = imac 0x516d50;
    void submitUserInfo();
    void suggestLevelStars(int, int, int);
    gd::string tryGetUsername(int) = win 0x144000;
    CommentType typeFromCommentKey(char const*);
    LikeItemType typeFromLikeKey(char const*);
    void unblockUser(int);
    void unfollowUser(int) = imac 0x523460;
    void updateDescription(int, gd::string);
    void updateLevel(GJGameLevel*) = imac 0x52ed20;
    void updateLevelOrders() = win 0x145680;
    void updateLevelRewards(GJGameLevel*);
    void updateSavedLevelList(GJLevelList*);
    void updateUsernames();
    void updateUserScore() = win 0x153790;
    void uploadAccountComment(gd::string);
    void uploadComment(gd::string, CommentType, int, int);
    void uploadFriendRequest(int, gd::string);
    void uploadLevel(GJGameLevel*);
    void uploadLevelComment(int, gd::string, int);
    void uploadLevelList(GJLevelList*);
    void uploadUserMessage(int, gd::string, gd::string) = win 0x1588b0;
    int userIDForAccountID(int);
    GJUserScore* userInfoForAccountID(int);
    gd::string userNameForUserID(int) = win 0x143e80;
    void verifyLevelState(GJGameLevel*);
    gd::string writeSpecialFilters(GJSearchObject*) = win 0x14b8b0, imac 0x5285e0;

    virtual bool init() = win 0x142230;

    gd::set<gd::string> m_queuedLists;
    cocos2d::CCDictionary* m_mainLevels;
    cocos2d::CCDictionary* m_searchFilters;
    cocos2d::CCDictionary* m_onlineLevels;
    cocos2d::CCDictionary* m_unkDict;
    cocos2d::CCDictionary* m_followedCreators;
    cocos2d::CCDictionary* m_favoriteLists;
    cocos2d::CCDictionary* m_downloadedLevels;
    cocos2d::CCDictionary* m_likedLevels;
    cocos2d::CCDictionary* m_ratedLevels;
    cocos2d::CCDictionary* m_ratedDemons;
    cocos2d::CCDictionary* m_reportedLevels;
    cocos2d::CCDictionary* m_onlineFolders;
    cocos2d::CCDictionary* m_localLevelsFolders;
    cocos2d::CCDictionary* m_dailyLevels;
    int m_dailyTimeLeft;
    int m_dailyID;
    int m_dailyIDUnk;
    int m_weeklyTimeLeft;
    int m_weeklyID;
    int m_weeklyIDUnk;
    int m_eventTimeLeft;
    int m_eventID;
    int m_eventIDUnk;
    cocos2d::CCDictionary* m_gauntletLevels;
    gd::map<gd::string, bool> m_availableFilters;
    cocos2d::CCDictionary* m_timerDict;
    cocos2d::CCDictionary* m_knownUsers;
    cocos2d::CCDictionary* m_accountIDtoUserIDDict;
    cocos2d::CCDictionary* m_userIDtoAccountIDDict;
    cocos2d::CCDictionary* m_storedLevels;
    cocos2d::CCDictionary* m_pageInfo;
    cocos2d::CCDictionary* m_unkDict20;
    cocos2d::CCDictionary* m_savedPacks;
    cocos2d::CCDictionary* m_savedGauntlets;
    cocos2d::CCDictionary* m_downloadObjects;
    cocos2d::CCDictionary* m_friendReqAndUserBlocks;
    cocos2d::CCDictionary* m_storedUserInfo;
    cocos2d::CCDictionary* m_friendRequests;
    cocos2d::CCDictionary* m_userMessages;
    cocos2d::CCDictionary* m_userReplies;
    gd::string m_searchSceneStr;
    gd::string m_searchType9Str;
    LeaderboardState m_leaderboardState;
    bool m_unkEditLevelLayerOnBack;
    LevelManagerDelegate* m_levelManagerDelegate;
    LevelDownloadDelegate* m_levelDownloadDelegate;
    LevelCommentDelegate* m_levelCommentDelegate;
    CommentUploadDelegate* m_commentUploadDelegate;
    LevelUploadDelegate* m_levelUploadDelegate;
    ListUploadDelegate* m_listUploadDelegate;
    LevelUpdateDelegate* m_levelUpdateDelegate;
    LeaderboardManagerDelegate* m_leaderboardManagerDelegate;
    LevelDeleteDelegate* m_levelDeleteDelegate;
    LevelListDeleteDelegate* m_levelListDeleteDelegate;
    UserInfoDelegate* m_userInfoDelegate;
    UploadPopupDelegate* m_uploadPopupDelegate;
    UserListDelegate* m_userListDelegate;
    FriendRequestDelegate* m_friendRequestDelegate;
    MessageListDelegate* m_messageListDelegate;
    DownloadMessageDelegate* m_downloadMessageDelegate;
    UploadMessageDelegate* m_uploadMessageDelegate;
    GJRewardDelegate* m_GJRewardDelegate;
    GJChallengeDelegate* m_GJChallengeDelegate;
    GJDailyLevelDelegate* m_GJDailyLevelDelegate;
    OnlineListDelegate* m_onlineListDelegate;
    int m_unkDownload;
    int m_mapPack;
    gd::string m_unkStr3;
    cocos2d::CCString* m_unkStr4;
    cocos2d::CCArray* m_smartTemplates;
    GJSmartTemplate* m_smartTemplate;
    bool m_testedNetwork;
}

[[link(android)]]
class GameLevelOptionsLayer : GJOptionsLayer {
    // virtual ~GameLevelOptionsLayer();

    static GameLevelOptionsLayer* create(GJGameLevel*) = win 0x2992a0;

    bool init(GJGameLevel*) = imac 0x29e690;

    virtual void setupOptions() = win 0x299400, imac 0x29e6f0;
    virtual void didToggle(int) = win 0x299480, imac 0x29e760;

    GJGameLevel* m_level;
}

[[link(android), depends(UIButtonConfig)]]
class GameManager : GManager {
    virtual ~GameManager();
    // GameManager() = win 0x1721e0, ios 0x32eafc;

    static GameManager* get() {
    	return GameManager::sharedState();
    }

    static GameManager* sharedState() = win 0x178480, imac 0x362c40;

    PlayLayer* getPlayLayer() {
    	return m_playLayer;
    }

    LevelEditorLayer* getEditorLayer() {
    	return m_levelEditorLayer;
    }

    GJBaseGameLayer* getGameLayer() {
    	return m_gameLayer;
    }

    int getPlayerFrame() {
        return m_playerFrame;
    }
    int getPlayerShip() {
        return m_playerShip;
    }
    int getPlayerBall() {
        return m_playerBall;
    }
    int getPlayerBird() {
        return m_playerBird;
    }
    int getPlayerDart() {
        return m_playerDart;
    }
    int getPlayerRobot() {
        return m_playerRobot;
    }
    int getPlayerSpider() {
        return m_playerSpider;
    }
    int getPlayerSwing() {
        return m_playerSwing;
    }
    int getPlayerGlowColor() {
        return m_playerGlowColor;
    }
    int getPlayerStreak() {
        return m_playerStreak;
    }
    int getPlayerShipFire() {
    	return m_playerShipFire;
    }
    int getPlayerDeathEffect() {
        return m_playerDeathEffect;
    }
    int getPlayerJetpack() {
    	return m_playerJetpack;
    }
    int getPlayerColor() {
        return m_playerColor;
    }
    int getPlayerColor2() {
        return m_playerColor2;
    }
    bool getPlayerGlow() {
        return m_playerGlow;
    }
    void setPlayerFrame(int id) {
        m_playerFrame = id;
    }
    void setPlayerShip(int id) {
        m_playerShip = id;
    }
    void setPlayerBall(int id) {
        m_playerBall = id;
    }
    void setPlayerBird(int id) {
        m_playerBird = id;
    }
    void setPlayerDart(int id) {
        m_playerDart = id;
    }
    void setPlayerRobot(int id) {
        m_playerRobot = id;
    }
    void setPlayerSpider(int id) {
        m_playerSpider = id;
    }
    void setPlayerSwing(int id) {
    	m_playerSwing = id;
    }
    void setPlayerColor3(int id) {
    	m_playerGlowColor = id;
    }
    void setPlayerStreak(int id) {
        m_playerStreak = id;
    }
    void setPlayerShipStreak(int id) {
        m_playerShipFire = id;
    }
    void setPlayerDeathEffect(int id) {
        m_playerDeathEffect = id;
    }
    void setPlayerJetpack(int id) {
    	m_playerJetpack = id;
    }
    void setPlayerColor(int id) {
        m_playerColor = id;
    }
    void setPlayerColor2(int id) {
        m_playerColor2 = id;
    }
    void setPlayerGlow(bool v) {
        m_playerGlow = v;
    }
    bool getGameVariableDefault(const char* key, bool defaultValue) {
    	//helper function
        auto object = static_cast<cocos2d::CCString*>(m_valueKeeper->objectForKey(std::string("gv_") + key));
        if (object == nullptr)
            return defaultValue;
        return object->boolValue();
    }
    int getIntGameVariableDefault(const char* key, int defaultValue) {
    	//helper function
        auto object = static_cast<cocos2d::CCString*>(m_valueKeeper->objectForKey(std::string("gv_") + key));
        if (object == nullptr)
            return defaultValue;
        return object->intValue();
    }

    TodoReturn accountStatusChanged();
    int activeIconForType(IconType) = win 0x17ea70, imac 0x36ccc0;
    TodoReturn addCustomAnimationFrame(int, int, gd::string, gd::string);
    TodoReturn addDuplicateLastFrame(int);
    TodoReturn addGameAnimation(int, int, float, gd::string, gd::string, int);
    TodoReturn addIconDelegate(cocos2d::CCObject*, int);
    void addNewCustomObject(gd::string str) = win 0x1807d0;
    TodoReturn addToGJLog(cocos2d::CCString*);
    void applicationDidEnterBackground();
    TodoReturn applicationWillEnterForeground() = win 0x186bb0;
    TodoReturn calculateBaseKeyForIcons();
    TodoReturn canShowRewardedVideo();
    TodoReturn checkSteamAchievementUnlock();
    TodoReturn checkUsedIcons() = win 0x1811b0, imac 0x36b0a0;
    TodoReturn claimItemsResponse(gd::string);
    TodoReturn clearGJLog();
    cocos2d::ccColor3B colorForIdx(int) = win 0x17e330, imac 0x36bd60;
    TodoReturn colorForPos(int);
    TodoReturn colorKey(int, UnlockType);
    bool completedAchievement(gd::string) = win 0x17a1d0;
    int countForType(IconType) = win 0x17ebe0;
    TodoReturn defaultFrameForAnimation(int);
    TodoReturn defaultYOffsetForBG2(int);
    TodoReturn didExitPlayscene() = imac 0x377980;
    void doQuickSave();
    TodoReturn dpadConfigToString(UIButtonConfig&) = win 0x183350, imac 0x3736a0;
    TodoReturn eventUnlockFeature(char const*);
    void fadeInMenuMusic() = win 0x178a90, imac 0x3634e0;
    void fadeInMusic(gd::string) = win 0x178b80;
    TodoReturn finishedLoadingBGAsync(cocos2d::CCObject*);
    TodoReturn finishedLoadingGAsync(int);
    TodoReturn finishedLoadingGAsync1(cocos2d::CCObject*);
    TodoReturn finishedLoadingGAsync2(cocos2d::CCObject*);
    TodoReturn finishedLoadingIconAsync(cocos2d::CCObject*);
    TodoReturn finishedLoadingMGAsync(int);
    TodoReturn finishedLoadingMGAsync1(cocos2d::CCObject*);
    TodoReturn finishedLoadingMGAsync2(cocos2d::CCObject*);
    TodoReturn followTwitch();
    TodoReturn followTwitter();
    TodoReturn framesForAnimation(int);
    TodoReturn frameTimeForAnimation(int);
    TodoReturn generateSecretNumber();

    const char* getBGTexture(int id) {
    	return cocos2d::CCString::createWithFormat(
    		"game_bg_%02d_001.png",
    		std::clamp(id, 1, 59)
    	)->getCString();
    }

    void getFontFile(int) = imac 0x36f240;
    TodoReturn getFontTexture(int);
    bool getGameVariable(char const*) = win 0x1800f0, imac 0x363380;
    TodoReturn getGTexture(int) = imac 0x36fd40;
    int getIconRequestID() {
    	return m_iconRequestID++;
    }
    int getIntGameVariable(char const*) = win 0x1806f0, imac 0x3704e0;
    gd::string getMenuMusicFile() = win 0x178700;
    TodoReturn getMGTexture(int);
    TodoReturn getNextUniqueObjectKey();
    TodoReturn getNextUsedKey(int, bool);
    TodoReturn getOrderedCustomObjectKeys() = imac 0x370680;
    TodoReturn getPracticeMusicFile();
    bool getUGV(char const*) = win 0x180480, imac 0x370250;
    TodoReturn getUnlockForAchievement(gd::string, int&, UnlockType&);
    TodoReturn groundHasSecondaryColor(int);
    TodoReturn iconAndTypeForKey(int, int&, int&);
    gd::string iconKey(int, IconType) = win 0x1792b0;
    UnlockType iconTypeToUnlockType(IconType) = win 0x1795c0;
    bool isColorUnlocked(int, UnlockType) = win 0x1798c0, imac 0x364780;
    bool isIconLoaded(int, int) = imac 0x36d130;
    bool isIconUnlocked(int, IconType) = win 0x1794e0, imac 0x364110;
    TodoReturn itemPurchased(char const*);
    TodoReturn joinDiscord();
    void joinReddit();
    int keyForIcon(int iconIdx, int iconEnum) {
    	return m_keyStartForIcon.at(iconEnum) + iconIdx - 1;
    }
    TodoReturn levelIsPremium(int, int);
    TodoReturn likeFacebook();
    void loadBackground(int) = win 0x17f880, imac 0x36f480;
    void loadBackgroundAsync(int);

    void loadDeathEffect(int id) {
    	if (id < 1) id = 1;
    	if (id > 19) id = 20;
    	if (id != m_loadedDeathEffect) {
    		if (1 < m_loadedDeathEffect) {
    			cocos2d::CCTextureCache::sharedTextureCache()->removeTextureForKey(
    				cocos2d::CCString::createWithFormat("PlayerExplosion_%02d.png", m_loadedDeathEffect-1)->getCString()
    			);
    		}
    		if (1 < id) {
    			cocos2d::CCTextureCache::sharedTextureCache()->addImage(
    				cocos2d::CCString::createWithFormat("PlayerExplosion_%02d.png", id-1)->getCString(),
    				false
    			);
    			cocos2d::CCSpriteFrameCache::sharedSpriteFrameCache()->addSpriteFramesWithFile(
    				cocos2d::CCString::createWithFormat("PlayerExplosion_%02d.plist", id-1)->getCString()
    			);
    		}
    		m_loadedDeathEffect = id;
    	}
    }

    TodoReturn loadDpadFromString(UIButtonConfig&, gd::string) = imac 0x374380;
    TodoReturn loadDPadLayout(int, bool);
    TodoReturn loadFont(int) = imac 0x36f1a0;
    void loadGround(int) = win 0x17fc30, imac 0x36f960;
    void loadGroundAsync(int);
    cocos2d::CCTexture2D* loadIcon(int, int, int) = win 0x17ecf0, imac 0x36e030;
    TodoReturn loadIconAsync(int, int, int, cocos2d::CCObject*);
    void loadMiddleground(int) = win 0x17f9e0, imac 0x36f650;
    void loadMiddlegroundAsync(int);
    void loadVideoSettings() = imac 0x374e00;
    TodoReturn lockColor(int, UnlockType);
    TodoReturn lockIcon(int, IconType);
    TodoReturn logLoadedIconInfo();
    void openEditorGuide();
    void playMenuMusic() = win 0x178810;
    TodoReturn playSFXTrigger(SFXTriggerGameObject*);
    TodoReturn prepareDPadSettings() = imac 0x3746b0;
    TodoReturn printGJLog();
    void queueReloadMenu() = imac 0x3781f0;
    TodoReturn rateGame();
    void recountUserStats(gd::string);
    void reloadAll(bool switchingModes, bool toFullscreen, bool borderless, bool unused);
    void reloadAll(bool switchingModes, bool toFullscreen, bool unused) {
    	return this->reloadAll(switchingModes, toFullscreen, false, unused);
    }
    void reloadAllStep2() = win 0x187420, imac 0x3783d0;
    void reloadAllStep3();
    void reloadAllStep4();
    void reloadAllStep5() = win 0x187730, imac 0x3785c0;
    TodoReturn reloadMenu();
    TodoReturn removeCustomObject(int);
    TodoReturn removeIconDelegate(int);
    TodoReturn reorderKey(int, bool);
    void reportAchievementWithID(char const*, int, bool) = win 0x17afd0, imac 0x366070;
    void reportPercentageForLevel(int levelID, int percentage, bool isPlatformer) = win 0x17a5f0;
    TodoReturn resetAchievement(gd::string);
    TodoReturn resetAdTimer();
    TodoReturn resetAllIcons();
    TodoReturn resetCoinUnlocks();
    TodoReturn resetDPadSettings(bool);
    cocos2d::CCSize resolutionForKey(int) = win 0x187770, imac 0x378600;
    void returnToLastScene(GJGameLevel*) = win 0x186f10;
    TodoReturn rewardedVideoAdFinished(int);
    TodoReturn rewardedVideoHidden();
    TodoReturn rewardedVideoHiddenDelayed();
    // partially inlined on windows
    void safePopScene() = win 0x1872c0;
    TodoReturn saveAdTimer();
    TodoReturn saveDPadLayout(int, bool);
    void setGameVariable(char const*, bool) = win 0x17fe90, imac 0x36fd90;
    void setHasRatingPower(int);
    void setIntGameVariable(char const*, int) = win 0x1805f0, imac 0x3703b0;
    void setPlayerUserID(int);
    void setUGV(char const*, bool) = win 0x180320;
    void setupGameAnimations() = win 0x1a8750;
    gd::string sheetNameForIcon(int, int) = win 0x17f470, imac 0x36d4f0;
    TodoReturn shortenAdTimer(float);
    TodoReturn shouldShowInterstitial(int, int, int);
    void showInterstitial();
    void showInterstitialForced();
    void showMainMenuAd();
    void startUpdate();
    gd::string stringForCustomObject(int customObjectID) = win 0x180950, imac 0x3709b0;
    TodoReturn subYouTube();
    TodoReturn switchCustomObjects(int, int);
    TodoReturn switchScreenMode(bool, bool);
    TodoReturn syncPlatformAchievements();
    void toggleGameVariable(char const*) = win 0x180270, imac 0x370010;
    TodoReturn tryCacheAd();
    TodoReturn tryShowInterstitial(int, int, int);
    TodoReturn unloadBackground();
    void unloadIcon(int, int, int) = win 0x17f050;
    void unloadIcons(int);
    TodoReturn unlockColor(int, UnlockType);
    TodoReturn unlockedPremium();
    void unlockIcon(int, IconType);
    IconType unlockTypeToIconType(int) = win 0x1796e0, imac 0x3643e0;
    void updateCustomFPS() = imac 0x3788c0;
    TodoReturn updateMusic();
    void verifyAchievementUnlocks();
    TodoReturn verifyCoinUnlocks();
    TodoReturn verifyStarUnlocks();
    TodoReturn verifySyncedCoins();
    TodoReturn videoAdHidden();
    TodoReturn videoAdShowed();
    virtual void update(float) = win 0x186b20;
    virtual bool init() = win 0x1784d0, imac 0x362ca0;
    virtual void encodeDataTo(DS_Dictionary*) = win 0x185f30, imac 0x376e00;
    virtual void dataLoaded(DS_Dictionary*);
    virtual void firstLoad() = win 0x185630, imac 0x3764a0;

    cocos2d::CCDictionary* m_unkAnimationDict;
    cocos2d::CCDictionary* m_unkAnimationDict2;
    cocos2d::CCDictionary* m_frameTimeForAnimation;
    cocos2d::CCDictionary* m_framesForAnimation;
    cocos2d::CCDictionary* m_defaultFrames;
    bool m_switchModes;
    bool m_toFullscreen;
    bool m_reloading;
    bool m_unkBool1;
    bool m_unkBool2;
    bool m_vsyncEnabled;
    cocos2d::CCDictionary* m_valueKeeper;
    cocos2d::CCDictionary* m_unlockValueKeeper;
    cocos2d::CCDictionary* m_customObjectDict;
    double m_adTimer;
    double m_adCache;
    bool m_unkBool3;
    int m_unkSize4_1;
    double m_unkDouble2;
    int m_unkSize4_2;
    int m_unkSize4_3;
    bool m_loaded;
    bool m_googlePlaySignedIn;
    gd::string m_editorClipboard;
    int m_unkSize4_4;
    PlayLayer* m_playLayer;
    LevelEditorLayer* m_levelEditorLayer;
    GJBaseGameLayer* m_gameLayer;
    void* m_unkPtr;
    MenuLayer* m_menuLayer;
    bool m_inMenuLayer;
    void* m_unknownVariable;
    bool m_unknownBool3;
    bool m_unknownPlayLayerBool;
    bool m_unknownBool4;
    bool m_unknownBool5;
    gd::string m_playerUDID;
    gd::string m_playerName;
    bool m_commentsEnabled;
    geode::SeedValueRSV m_playerUserID;
    float m_bgVolume;
    float m_sfxVolume;
    float m_timeOffset;
    bool m_ratedGame;
    bool m_clickedFacebook;
    bool m_clickedTwitter;
    bool m_clickedYouTube;
    bool m_clickedTwitch;
    bool m_clickedDiscord_;
    bool m_clickedReddit;
    double m_socialsDuration;
    bool m_showedAd;
    bool m_unknownBool;
    bool m_editorEnabled;
    int m_sceneEnum;
    bool m_searchObjectBool;
    geode::SeedValueRSV m_playerFrame;
    geode::SeedValueRSV m_playerShip;
    geode::SeedValueRSV m_playerBall;
    geode::SeedValueRSV m_playerBird;
    geode::SeedValueRSV m_playerDart;
    geode::SeedValueRSV m_playerRobot;
    geode::SeedValueRSV m_playerSpider;
    geode::SeedValueRSV m_playerSwing;
    geode::SeedValueRSV m_playerColor;
    geode::SeedValueRSV m_playerColor2;
    geode::SeedValueRSV m_playerGlowColor;
    geode::SeedValueRSV m_playerStreak;
    geode::SeedValueRSV m_playerShipFire;
    geode::SeedValueRSV m_playerDeathEffect;
    geode::SeedValueRSV m_playerJetpack;
    geode::SeedValueRS m_chk;
    geode::SeedValueSR m_secretNumber;
    bool m_playerGlow;
    IconType m_playerIconType;
    bool m_everyPlaySetup;
    bool m_showSongMarkers;
    bool m_showBPMMarkers;
    bool m_recordGameplay;
    bool m_showProgressBar;
    bool m_performanceMode;
    bool m_unkBool4;
    bool m_clickedGarage;
    bool m_clickedEditor;
    bool m_clickedName;
    bool m_clickedPractice;
    bool m_showedEditorGuide;
    bool m_showedRateDiffDialog;
    bool m_showedRateStarDialog;
    bool m_showedLowDetailDialog;
    void* m_unkPtr2;
    void* m_unkPtr3;
    int m_unkSize4_5;
    int m_unkSize4_6;
    int m_unkSize4_7;
    int m_unkSize4_8;
    int m_loadedBgID;
    int m_loadedGroundID;
    int m_loadedMG;
    int m_loadedFont;
    int m_loadedDeathEffect;
    bool m_loadingBG;
    bool m_loadingG;
    bool m_loadingG1;
    bool m_finishedLoadingG1;
    bool m_shouldLoadG1;
    bool m_finishedLoadingMG1;
    bool m_finishedLoadingMG2;
    bool m_unkBool5;
    int m_unkSize4_9;
    int m_unkSize4_10;
    int m_unkSize4_11;
    int m_bootups;
    bool m_hasRatedGame;
    bool m_unkBool6;
    bool m_shouldLoadUnlockValueKeeper;
    bool m_unkBool7;
    bool m_unkBool8;
    geode::SeedValueRSV m_hasRP;
    bool m_canGetLevelSaveData;
    int m_resolution;
    int m_texQuality;
    bool m_somethingInMenuLayer;
    void* m_unkPtr4;
    bool m_ropeGarageEnter;
    int m_unkSize4_12;
    int m_unkSize4_13;
    bool m_unkBool10;
    int m_unkSize4_14;
    bool m_disableThumbstick;
    float m_customFPSTarget;
    bool m_unkBool11;
    int m_customMenuSongID;
    int m_customPracticeSongID;
    gd::map<int, int> m_loadIcon;
    gd::map<int, gd::map<int, int>> m_loadIcon2;
    gd::map<int, bool> m_isIconBeingLoaded;
    gd::vector<int> m_keyStartForIcon;
    gd::map<int, gd::vector<cocos2d::CCObject*>> m_iconDelegates;
    int m_iconRequestID;
    cocos2d::CCArray* m_unkArray;
    void* m_someAdPointer;
    int m_unkSize4_15;
    int m_unkSize4_16;
    int m_unkSize4_17;
    UIButtonConfig m_dpad1;
    UIButtonConfig m_dpad2;
    UIButtonConfig m_dpad3;
    UIButtonConfig m_dpad4;
    UIButtonConfig m_dpad5;
    gd::string m_dpadLayout1;
    gd::string m_dpadLayout2;
    gd::string m_dpadLayout3;
    gd::string m_dpadLayoutDual1;
    gd::string m_dpadLayoutDual2;
    gd::string m_dpadLayoutDual3;
    int m_unkSize4_18;
    int m_unkSize4_19;
    int m_unkSize4_20;
    bool m_shouldResetShader;
    float m_practicePosX;
    float m_practicePosY;
    float m_practiceOpacity;
}

[[link(android)]]
class GameObject : CCSpritePlus {
    // virtual ~GameObject();
    GameObject() = win 0x135ba0;

    void addColorSprite(gd::string) = win 0x18b710;
    void addColorSpriteToParent(bool) = imac 0x591680;
    void addColorSpriteToSelf() = imac 0x5a53a0;
    cocos2d::CCSprite* addCustomBlackChild(gd::string, float, bool);
    cocos2d::CCSprite* addCustomChild(gd::string, cocos2d::CCPoint, int);
    cocos2d::CCSprite* addCustomColorChild(gd::string);
    void addEmptyGlow();
    void addGlow(gd::string);
    cocos2d::CCSprite* addInternalChild(cocos2d::CCSprite*, gd::string, cocos2d::CCPoint, int);
    cocos2d::CCSprite* addInternalCustomColorChild(gd::string, cocos2d::CCPoint, int);
    cocos2d::CCSprite* addInternalGlowChild(gd::string, cocos2d::CCPoint);
    void addNewSlope01(bool);
    void addNewSlope01Glow(bool);
    void addNewSlope02(bool);
    void addNewSlope02Glow(bool);
    void addRotation(float, float);
    void addRotation(float);
    void addToColorGroup(int);
    void addToCustomScaleX(float);
    void addToCustomScaleY(float);
    void addToOpacityGroup(int);
    void addToTempOffset(double, double);
    void assignUniqueID() = imac 0x589920;
    bool belongsToGroup(int);
    void calculateOrientedBox();
    bool canChangeCustomColor();
    bool canChangeMainColor();
    bool canChangeSecondaryColor();
    bool canRotateFree();
    cocos2d::ccColor3B colorForMode(int, bool);
    void commonInteractiveSetup();
    void commonSetup();
    void copyGroups(GameObject*) = win 0x1998a0;
    cocos2d::CCParticleSystemQuad* createAndAddParticle(int p0, char const* plistName, int p2, cocos2d::tCCPositionType positionType) = win 0x195a80, imac 0x59caf0;
    void createColorGroupContainer(int);
    void createGlow(gd::string);
    void createGroupContainer(int size) {
    	if (!m_groups) {
    		auto groups = new short[size];
    		memset(groups, 0, size * sizeof(short));
    		m_groups = reinterpret_cast<decltype(m_groups)>(groups);
    	}
    }
    void createOpacityGroupContainer(int);
    void createSpriteColor(int) = imac 0x589860;
    static GameObject* createWithFrame(char const* name) = win 0x18ab80, imac 0x589600;
    static GameObject* createWithKey(int) = win 0x188730, imac 0x584aa0;
    void deselectObject();
    inline void destroyObject() {
    	m_isDisabled = true;
    	m_isDisabled2 = true;
    	setOpacity(0);
    }
    void determineSlopeDirection() = win 0x199220;
    bool didScaleXChange();
    bool didScaleYChange();
    void dirtifyObjectPos();
    void dirtifyObjectRect();
    void disableObject() = imac 0x5a4780;
    bool dontCountTowardsLimit();
    void duplicateAttributes(GameObject*);
    void duplicateColorMode(GameObject*);
    void duplicateValues(GameObject*) = win 0x19ed20;
    cocos2d::ccColor3B editorColorForCustomMode(int);
    cocos2d::ccColor3B editorColorForMode(int) = win 0x19df80;
    void fastRotateObject(float);
    cocos2d::ccColor3B getActiveColorForMode(int, bool) = imac 0x5b1c30;
    char* getBallFrame(int);
    cocos2d::CCRect getBoundingRect();
    cocos2d::CCPoint getBoxOffset();
    gd::string getColorFrame(gd::string);
    int getColorIndex();
    gd::string getColorKey(bool, bool) = imac 0x411a40;
    ZLayer getCustomZLayer();
    gd::string getGlowFrame(gd::string);
    bool getGroupDisabled();
    int getGroupID(int);
    gd::string getGroupString();
    cocos2d::CCPoint getLastPosition();
    GJSpriteColor* getMainColor();
    int getMainColorMode();
    int getObjectDirection();
    float getObjectRadius();
    cocos2d::CCRect* getObjectRectPointer();
    ZLayer getObjectZLayer();
    int getObjectZOrder();
    cocos2d::CCRect getOuterObjectRect();
    int getParentMode();
    GJSpriteColor* getRelativeSpriteColor(int);
    cocos2d::CCPoint getScalePosDelta();
    GJSpriteColor* getSecondaryColor();
    int getSecondaryColorMode();
    float getSlopeAngle();
    cocos2d::CCPoint getUnmodifiedPosition();
    cocos2d::ccColor3B groupColor(cocos2d::ccColor3B const&, bool);
    float groupOpacityMod() = win 0x199c10, imac 0x5a63c0;
    void groupWasDisabled() = imac 0x5a5da0;
    void groupWasEnabled();
    bool hasSecondaryColor();
    bool ignoreEditorDuration();
    bool ignoreEnter();
    bool ignoreFade();
    bool init(char const*);
    bool isBasicEnterEffect(int);
    bool isBasicTrigger();
    bool isColorObject();
    bool isColorTrigger() = imac 0x5b23a0;
    bool isConfigurablePortal();
    bool isEditorSpawnableTrigger();
    bool isFacingDown() = win 0x19e870;
    bool isFacingLeft() = win 0x19e930;
    bool isSettingsObject() = imac 0x5b2a10;
    bool isSpawnableTrigger();
    bool isSpecialObject();
    bool isSpeedObject() = imac 0x5b2470;
    bool isStoppableTrigger();
    bool isTrigger();
    void loadGroupsFromString(gd::string);
    TodoReturn makeInvisible();
    static GameObject* objectFromVector(gd::vector<gd::string>&, gd::vector<void*>&, GJBaseGameLayer*, bool) = win 0x19a140;
    float opacityModForMode(int, bool);
    cocos2d::CCSpriteBatchNode* parentForZLayer(int, bool, int);
    gd::string perspectiveColorFrame(char const*, int);
    gd::string perspectiveFrame(char const*, int);
    void playDestroyObjectAnim(GJBaseGameLayer*) = win 0x1a7400;
    void playPickupAnimation(cocos2d::CCSprite*, float, float, float, float, float, float, float, float, bool, float, float) = win 0x1a6f20;
    void playPickupAnimation(cocos2d::CCSprite*, float, float, float, float) = win 0x1a6e30;
    void playShineEffect() = win 0x196310, imac 0x5a47c0;
    void quickUpdatePosition();
    void quickUpdatePosition2();
    void removeColorSprite();
    void removeGlow() = imac 0x58bf10;
    void reorderColorSprite();
    void resetColorGroups();
    void resetGroupDisabled();
    void resetGroups();
    void resetMainColorMode();
    void resetMID();
    void resetMoveOffset();
    void resetRScaleForced();
    void resetSecondaryColorMode();
    void setAreaOpacity(float, float, int);
    void setCustomZLayer(int);
    void setDefaultMainColorMode(int);
    void setDefaultSecondaryColorMode(int);
    void setGlowOpacity(unsigned char);
    void setLastPosition(cocos2d::CCPoint const&) = imac 0x5b1e20;
    void setMainColorMode(int);
    void setSecondaryColorMode(int);
    void setupColorSprite(int, bool);
    void setupPixelScale();
    void setupSpriteSize();
    bool shouldBlendColor(GJSpriteColor*, bool);
    bool shouldLockX();
    bool shouldNotHideAnimFreeze();
    bool shouldShowPickupEffects();
    bool slopeFloorTop();
    bool slopeWallLeft();
    double slopeYPos(cocos2d::CCRect);
    double slopeYPos(float) = win 0x19e310;
    double slopeYPos(GameObject*);
    void spawnDefaultPickupParticle(GJBaseGameLayer*);
    void updateBlendMode();
    void updateCustomColorType(short);
    void updateCustomScaleX(float);
    void updateCustomScaleY(float);
    void updateHSVState();
    void updateIsOriented() = win 0x19e690, imac 0x5b0ab0;
    void updateMainColorOnly();
    void updateMainOpacity();
    void updateObjectEditorColor() = win 0x19e250;
    void updateSecondaryColorOnly();
    void updateSecondaryOpacity();
    void updateStartPos() = imac 0x590e70;
    void updateUnmodifiedPositions();
    void usesFreezeAnimation();
    void usesSpecialAnimation();

    // MSVC changed virtual table ordering somewhere between what Rob uses
    // and now, and now virtual functions that have non virtual overloads
    // are added to the first of the vtable regardless of the order
    // defined in the header. This is why we simply can not use these
    // two functions since defining them would break the vtable layout.
    // void updateMainColor();
    // void updateSecondaryColor();

    virtual void update(float);
    virtual void setScaleX(float) = win 0x1951b0;
    virtual void setScaleY(float);
    virtual void setScale(float);
    virtual void setPosition(cocos2d::CCPoint const&) = win 0x194ac0;
    virtual void setVisible(bool) = win 0x195bb0, imac 0x5a3ea0;
    virtual void setRotation(float) = win 0x194d60, imac 0x5a3350;
    virtual void setRotationX(float) = win 0x194eb0;
    virtual void setRotationY(float) = win 0x195000;
    virtual void setOpacity(unsigned char) = win 0x195760, imac 0x5a3b00;
    virtual bool initWithTexture(cocos2d::CCTexture2D*) = win 0x18ac10;
    virtual void setChildColor(cocos2d::ccColor3B const&) = win 0x19dd20, imac 0x5afdf0;
    virtual void setFlipX(bool) = win 0x195120;
    virtual void setFlipY(bool) = win 0x195160;
    virtual void firstSetup();
    virtual void customSetup() = win 0x18dd80, imac 0x591a50;
    virtual void setupCustomSprites(gd::string) = win 0x1abe60;
    virtual void addMainSpriteToParent(bool) = win 0x198cb0, imac 0x2773d0;
    virtual void resetObject() = win 0x18d630, imac 0x590f00;
    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*);
    virtual void activateObject() = win 0x18da40, imac 0x591520;
    virtual void deactivateObject(bool) = win 0x18daf0, imac 0x591890;
    virtual void transferObjectRect(cocos2d::CCRect&) = win 0x1945b0, imac 0x5a29e0;
    virtual cocos2d::CCRect const& getObjectRect() = win 0x194600, imac 0x5a2a50;
    virtual cocos2d::CCRect getObjectRect(float, float) = win 0x194620, imac 0x5a2a80;
    virtual cocos2d::CCRect getObjectRect2(float, float) = win 0x1947b0, imac 0x5a2cb0;
    virtual cocos2d::CCRect getObjectTextureRect() = win 0x194850, imac 0x5a2d80;
    virtual cocos2d::CCPoint getRealPosition() = win 0x194a80, imac 0x5a3020;
    virtual void setStartPos(cocos2d::CCPoint) = win 0x18d4b0;
    virtual void updateStartValues() = win 0x18d880;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*) = win 0x19bc30, imac 0x5a8c00;
    virtual void claimParticle() = win 0x195cd0, imac 0x5a4000;
    virtual void unclaimParticle() = win 0x196200;
    virtual void particleWasActivated();
    virtual bool isFlipX();
    virtual bool isFlipY();
    virtual void setRScaleX(float) = win 0x195470;
    virtual void setRScaleY(float) = win 0x1954b0;
    virtual void setRScale(float) = win 0x1954f0, imac 0x5a38c0;
    virtual float getRScaleX();
    virtual float getRScaleY();
    virtual void setRRotation(float) = win 0x194cd0, imac 0x5a32d0;
    virtual void triggerActivated(float);
    virtual void setObjectColor(cocos2d::ccColor3B const&) = win 0x19d9e0, imac 0x5afb10;
    virtual void setGlowColor(cocos2d::ccColor3B const&) = win 0x19dcd0, imac 0x5afda0;
    virtual void restoreObject();
    virtual void animationTriggered();
    virtual void selectObject(cocos2d::ccColor3B) = win 0x19dda0;
    virtual void activatedByPlayer(PlayerObject*);
    virtual bool hasBeenActivatedByPlayer(PlayerObject*);
    virtual bool hasBeenActivated();
    virtual OBB2D* getOrientedBox() = win 0x19e470, imac 0x5b0890;
    virtual void updateOrientedBox() = win 0x19e4d0, imac 0x5b0910;
    virtual float getObjectRotation() = win 0x19e450, imac 0x5b9030;
    virtual void updateMainColor(cocos2d::ccColor3B const&);
    virtual void updateSecondaryColor(cocos2d::ccColor3B const&);
    virtual void addToGroup(int) = win 0x1996f0, imac 0x5a58f0;
    virtual void removeFromGroup(int) = win 0x199810, imac 0x5a59a0;
    virtual void saveActiveColors() = win 0x19d830, imac 0x5af950;
    virtual float spawnXPosition() = win 0x135fe0, imac 0x1e1450;
    virtual bool canAllowMultiActivate();
    virtual void blendModeChanged();
    virtual void updateParticleColor(cocos2d::ccColor3B const&) = win 0x19dbc0, imac 0x5afce0;
    virtual void updateParticleOpacity(unsigned char) = win 0x195a00, imac 0x5a3e20;
    virtual void updateMainParticleOpacity(unsigned char);
    virtual void updateSecondaryParticleOpacity(unsigned char);
    virtual bool canReverse();
    virtual bool isSpecialSpawnObject();
    virtual bool canBeOrdered();
    virtual cocos2d::CCLabelBMFont* getObjectLabel();
    virtual void setObjectLabel(cocos2d::CCLabelBMFont*);
    virtual bool shouldDrawEditorHitbox();
    virtual bool getHasSyncedAnimation();
    virtual bool getHasRotateAction();
    virtual bool canMultiActivate(bool);
    virtual void updateTextKerning(int);
    virtual int getTextKerning();
    virtual bool getObjectRectDirty();
    virtual void setObjectRectDirty(bool);
    virtual bool getOrientedRectDirty();
    virtual void setOrientedRectDirty(bool);
    virtual GameObjectType getType();
    virtual void setType(GameObjectType);
    virtual cocos2d::CCPoint getStartPos() = win 0x136060, imac 0x1e14d0;

    int m_someOtherIndex;
    int m_innerSectionIndex;
    int m_outerSectionIndex;
    int m_middleSectionIndex;

    // property 511
    bool m_hasExtendedCollision;
    cocos2d::ccColor3B m_maybeGroupColor;
    bool m_unk280;
    bool m_unk281;
    float m_blackChildRelated;
    bool m_unk288;
    bool m_editorEnabled;
    bool m_isGroupDisabled;
    bool m_unk28B;
    bool m_unk28c;

    // somehow related to property 155 and 156 if anyone wants to reverse engineer
    int m_activeMainColorID;
    int m_activeDetailColorID;
    bool m_baseUsesHSV;
    bool m_detailUsesHSV;
    float m_positionXOffset;
    float m_positionYOffset;

    float m_rotationXOffset;
    float m_unk2A8;
    float m_rotationYOffset;
    float m_unk2B0;
    float m_scaleXOffset;
    float m_scaleYOffset;
    float m_unk2BC;
    float m_unk2C0;
    bool m_tempOffsetXRelated;
    bool m_isFlipX;
    bool m_isFlipY;
    cocos2d::CCPoint m_customBoxOffset;
    bool m_boxOffsetCalculated;
    cocos2d::CCPoint m_boxOffset;
    OBB2D* m_orientedBox;
    bool m_shouldUseOuterOb;
    cocos2d::CCSprite* m_glowSprite;
    int m_unk2F8;
    float m_width;
    float m_height;
    bool m_hasSpecialChild;
    bool m_isActivated;
    bool m_isDisabled2;
    cocos2d::CCParticleSystemQuad* m_particle;
    gd::string m_particleString;
    bool m_hasParticles;

    // property 146
    bool m_particleUseObjectColor;
    bool m_hasColorSprite;
    cocos2d::CCPoint m_unk31c;
    bool m_isSomeSpriteScalable;
    cocos2d::CCRect m_textureRect;
    bool m_isDirty;
    bool m_isObjectPosDirty;
    bool m_isUnmodifiedPosDirty;
    float m_unk33C;
    cocos2d::CCRect m_objectRect;
    bool m_isObjectRectDirty;
    bool m_isOrientedBoxDirty;
    bool m_colorSpriteLocked;
    bool m_unk353;
    bool m_canRotateFree;
    bool m_isMirroredByScale;

    // property 108
    int m_linkedGroup;
    int m_unk35C;
    short m_colorType;
    short m_childColorType;
    bool m_shouldBlendBase;
    bool m_shouldBlendDetail;
    bool m_hasCustomChild;
    bool m_unk367;
    cocos2d::CCSprite* m_colorSprite;
    bool m_unk370;
    float m_objectRadius;
    bool m_isRotationAligned;
    float m_spriteWidthScale;
    float m_spriteHeightScale;
    int m_uniqueID;
    GameObjectType m_objectType;

    // used in PlayerObject::gameEventTriggered
    GameObjectType m_savedObjectType;
    int m_unk390;
    float m_unmodifiedPositionX;
    float m_unmodifiedPositionY;
    double m_positionX;
    double m_positionY;
    cocos2d::CCPoint m_startPosition;
    bool m_unk3b8;

    // property 372
    bool m_hasNoAudioScale;
    bool m_isDisabled;
    float m_startRotationX;
    float m_startRotationY;
    float m_startScaleX;
    float m_startScaleY;
    float m_customScaleX;
    float m_customScaleY;
    bool m_startFlipX;
    bool m_startFlipY;
    bool m_unk3ee;
    bool m_isInvisible;
    int m_unk3D8;
    short m_unk3DC;
    bool m_unk3DE;
    short m_unk3E0;
    short m_unk3E2;

    // property 343
    short m_enterChannel;
    // property 446
    short m_objectMaterial;
    bool m_unk3E8;
    short m_parentMode;

    // property 96
    bool m_hasNoGlow;

    // property 23
    int m_targetColor;

    // property 1
    int m_objectID;
    bool m_unk3F8;
    bool m_isSolid;
    bool m_ignoreEnter;
    bool m_ignoreFade;
    bool m_unk3FC;
    bool m_unk3FD;
    bool m_customSpriteColor;

    // property 497
    short m_customColorType;
    // property 67
    bool m_isDontEnter;
    // property 64
    bool m_isDontFade;
    // property 116
    bool m_hasNoEffects;
    // property 507
    bool m_hasNoParticles;
    int m_defaultZOrder;
    bool m_unk40C;
    bool m_colorZLayerRelated;
    bool m_unk40E;
    float m_unk410;
    float m_unk414;
    bool m_particleLocked;

    // property 53
    int m_property53;
    bool m_gmUnkBool4Related;
    bool m_unk421;
    bool m_unk422;
    bool m_cantColorGlow;
    float m_opacityMod;
    bool m_slopeBugged;
    int m_slopeDirection;
    bool m_maybeShouldFixSlopes;
    float m_opacityMod2;

    // property 21, also used with 41 and 43
    GJSpriteColor* m_baseColor;
    // property 22, also used with 42 and 44
    GJSpriteColor* m_detailColor;
    bool m_unk448;
    ZLayer m_defaultZLayer;
    bool m_zFixedZLayer;

    // property 24
    ZLayer m_zLayer;
    // property 25
    int m_zOrder;
    bool m_unk45c;
    bool m_isSelected;
    float m_unk460;
    cocos2d::CCPoint m_unk464;
    bool m_shouldUpdateColorSprite;
    bool m_unk46d;

    // property 34
    bool m_hasGroupParent;
    // property 279
    bool m_hasAreaParent;
    // property 128
    float m_scaleX;
    // property 129
    float m_scaleY;

    // property 57
    std::array<short, 10>* m_groups;
    // used with property 57
    short m_groupCount;
    // used with property 274
    bool m_hasGroupParentsString;

    std::array<short, 10>* m_colorGroups;
    short m_colorGroupCount;
    std::array<short, 10>* m_opacityGroups;
    short m_opacityGroupCount;

    // property 20
    short m_editorLayer;
    // property 61
    short m_editorLayer2;
    int m_enabledGroupsCounter;
    bool m_unk4ac;
    bool m_unk4ad;

    // property 121
    bool m_isNoTouch;
    cocos2d::CCSize m_unk4b0;
    cocos2d::CCPoint m_lastPosition;
    int m_unk4C0;
    int m_unk4C4;
    int m_unk4C8;
    int m_unk4CC;
    int m_unk4D0;
    bool m_unk4D4;
    bool m_unk4D5;
    bool m_unk4D6;
    bool m_unk4D7;
    bool m_unk4D8;
    bool m_unk4D9;
    bool m_unk4DA;

    // property 103
    bool m_isHighDetail;
    ColorActionSprite* m_unk4E0;
    ColorActionSprite* m_unk4E8;
    GJEffectManager* m_goEffectManager;
    bool m_unk4F8;
    bool m_isDecoration;
    bool m_isDecoration2;
    bool m_unk4fb;
    bool m_maybeNotColorable;

    // property 134
    bool m_isPassable;
    // property 135
    bool m_isHide;
    // property 136
    bool m_isNonStickX;
    // property 289
    bool m_isNonStickY;
    // property 137
    bool m_isIceBlock;
    // property 193
    bool m_isGripSlope;
    // property 356
    bool m_isScaleStick;
    // property 495
    bool m_isExtraSticky;
    // property 496
    bool m_isDontBoostY;
    // property 509
    bool m_isDontBoostX;
    bool m_unk507;
    bool m_unk508;
    float m_unk50C;
    float m_pixelScaleX;
    float m_pixelScaleY;

    // property 155
    int m_property155;
    // property 156
    int m_property156;
    GLubyte m_areaOpacityRelated;
    float m_areaOpacityRelated2;
    int m_areaOpacityRelated3;
    int m_unk52C;
    bool m_unk530;
    bool m_unk531;
    bool m_unk532;
}

[[link(android)]]
class GameObjectCopy : cocos2d::CCObject {
    // virtual ~GameObjectCopy();

    static GameObjectCopy* create(GameObject*) = imac 0xe3120;

    bool init(GameObject*);
    void resetObject() = win 0x2daf60, imac 0xe3240;

    GameObject* m_object;
    cocos2d::CCPoint m_position;
    float m_rotationX;
    float m_rotationY;
    bool m_isFlipX;
    bool m_isFlipY;
    float m_customScaleX;
    float m_customScaleY;
}

[[link(android)]]
class GameObjectEditorState {
    TodoReturn loadValues(GameObject*);
}

[[link(android)]]
class GameOptionsLayer : GJOptionsLayer {
    // virtual ~GameOptionsLayer();
    GameOptionsLayer() {
    	m_practiceDialogIndex = 0;
    }

    static GameOptionsLayer* create(GJBaseGameLayer* baseGameLayer) {
    	auto ret = new GameOptionsLayer();
    	if (ret->init(baseGameLayer)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(GJBaseGameLayer* baseGameLayer) {
    	m_baseGameLayer = baseGameLayer;
    	m_gap = 40.f;
    	m_maxLabelScale = .4f;
    	if (!GJOptionsLayer::init(2)) return false;
    	this->preSetup();
    	this->postSetup();
    	return true;
    }
    void onPracticeMusicSync(cocos2d::CCObject* sender);
    void onUIOptions(cocos2d::CCObject* sender) = win 0x298c40;
    void onUIPOptions(cocos2d::CCObject* sender) = win 0x298c60;
    void showPracticeMusicSyncUnlockInfo() = win 0x298260;

    virtual void setupOptions() = win 0x2977c0;
    virtual void didToggle(int) = win 0x298db0, imac 0x29e020;

    GJBaseGameLayer* m_baseGameLayer;
    int m_practiceDialogIndex;
}

[[link(android)]]
class GameOptionsTrigger : EffectGameObject {
    // virtual ~GameOptionsTrigger();

    static GameOptionsTrigger* create(char const*);

    bool init(char const*);

    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);

    GameOptionsSetting m_streakAdditive;
    GameOptionsSetting m_unlinkDualGravity;
    GameOptionsSetting m_hideGround;
    GameOptionsSetting m_hideP1;
    GameOptionsSetting m_hideP2;
    GameOptionsSetting m_disableP1Controls;
    GameOptionsSetting m_disableP2Controls;
    GameOptionsSetting m_hideMG;
    GameOptionsSetting m_hideAttempts;
    GameOptionsSetting m_editRespawnTime;
    float m_respawnTime;
    GameOptionsSetting m_audioOnDeath;
    GameOptionsSetting m_noDeathSFX;
    GameOptionsSetting m_boostSlide;
}

[[link(android)]]
class GameRateDelegate {
    virtual void updateRate();
}

[[link(android)]]
class GameStatsManager : cocos2d::CCNode {
    // virtual ~GameStatsManager();
    // GameStatsManager();

    static GameStatsManager* sharedState();
    static GameStatsManager* get() {
    	return GameStatsManager::sharedState();
    }

    int accountIDForIcon(int, UnlockType) = imac 0x316a10;
    TodoReturn addSimpleSpecialChestReward(gd::string, UnlockType, int, bool);
    void addSpecialRewardDescription(gd::string, gd::string);
    void addStoreItem(int, int, int, int, ShopType) = win 0x1d0ee0, imac 0x659d0;
    bool areChallengesLoaded() = imac 0x722b0;
    TodoReturn areRewardsLoaded();
    void awardCurrencyForLevel(GJGameLevel*) = win 0x1dd870, imac 0x70590;
    void awardDiamondsForLevel(GJGameLevel*);
    TodoReturn awardSecretKey();
    TodoReturn checkAchievement(char const*) = win 0x1d2350;
    void checkCoinAchievement(GJGameLevel*) = win 0x1da710, imac 0x6c1d0;
    void checkCoinsForLevel(GJGameLevel*) = imac 0x6f2a0;
    TodoReturn claimListReward(GJLevelList*);
    TodoReturn collectReward(GJRewardType, GJRewardItem*);
    TodoReturn collectVideoReward(int);
    void completedChallenge(GJChallengeItem*);
    GJRewardItem* completedDailyLevel(GJGameLevel*) = win 0x1dfcf0;
    void completedDemonLevel(GJGameLevel*);
    TodoReturn completedLevel(GJGameLevel*) = imac 0x6cfb0;
    void completedMapPack(GJMapPack*) = win 0x1dbd10;
    void completedStarLevel(GJGameLevel*);
    int countSecretChests(GJRewardType);
    int countUnlockedSecretChests(GJRewardType);
    void createSecretChestItems() = imac 0x5c980;
    TodoReturn createSecretChestRewards();
    void createSpecialChestItems();
    void createStoreItems() = win 0x1ce710;
    void dataLoaded(DS_Dictionary*) = win 0x1eef90;
    void encodeDataTo(DS_Dictionary*);
    void firstSetup();
    void generateItemUnlockableData() = imac 0x64af0;
    int getAwardedCurrencyForLevel(GJGameLevel*) = win 0x1dd390, imac 0x703b0;
    TodoReturn getAwardedDiamondsForLevel(GJGameLevel*) = imac 0x70ba0;
    int getBaseCurrency(int stars, bool featured, int levelID);
    int getBaseCurrencyForLevel(GJGameLevel*) = win 0x1dd630, imac 0x701c0;
    void getBaseDiamonds(int) = imac 0x70b40;
    int getBonusDiamonds(int) = imac 0x70b60;
    GJChallengeItem* getChallenge(int);
    TodoReturn getChallengeKey(GJChallengeItem*);
    int getCollectedCoinsForLevel(GJGameLevel*) = win 0x1daab0;
    cocos2d::CCArray* getCompletedMapPacks() = win 0x1dc060;
    TodoReturn getCurrencyKey(GJGameLevel*);
    TodoReturn getDailyLevelKey(int);
    TodoReturn getDemonLevelKey(GJGameLevel*);
    gd::string getGauntletRewardKey(int) = imac 0x77010;
    gd::string getItemKey(int, int) = win 0x1de890;
    int getItemUnlockState(int itemID, UnlockType unlockType) {
    	auto key = getItemKey(itemID, (int) unlockType);
    	if(auto object = m_unlockedItems->objectForKey(key))
    		return object->getTag();

    	return 0;
    }
    int getItemUnlockStateLite(int, UnlockType);
    gd::string getLevelKey(GJGameLevel* level) {
    	return getLevelKey(level->m_levelID, level->m_levelType != GJLevelType::Local, level->m_dailyID > 0, level->m_gauntletLevel);
    }
    gd::string getLevelKey(int, bool, bool, bool) = win 0x1dac30;
    TodoReturn getListRewardKey(GJLevelList*);
    char const* getMapPackKey(int);
    TodoReturn getNextVideoAdReward();
    TodoReturn getPathRewardKey(int);
    GJChallengeItem* getQueuedChallenge(int);
    TodoReturn getRewardForSecretChest(int);
    TodoReturn getRewardForSpecialChest(gd::string);
    TodoReturn getRewardItem(GJRewardType);
    TodoReturn getRewardKey(GJRewardType, int);
    GJChallengeItem* getSecondaryQueuedChallenge(int);
    TodoReturn getSecretChestForItem(int, UnlockType);
    TodoReturn getSecretCoinKey(char const*);
    TodoReturn getSpecialChestKeyForItem(int, UnlockType);
    TodoReturn getSpecialRewardDescription(gd::string, bool);
    gd::string getSpecialUnlockDescription(int, UnlockType, bool) = win 0x1e6e90;
    TodoReturn getStarLevelKey(GJGameLevel*);
    int getStat(char const*) = win 0x1d20c0, imac 0x65f10;
    TodoReturn getStatFromKey(StatKey);
    TodoReturn getStoreItem(int, int);
    TodoReturn getStoreItem(int);
    int getTotalCollectedCurrency() = win 0x1e0790, imac 0x73cf0;
    int getTotalCollectedDiamonds() = win 0x1e1060, imac 0x74ac0;
    bool hasClaimedListReward(GJLevelList*) = win 0x1dfb10, imac 0x72fd0;
    bool hasCompletedChallenge(GJChallengeItem*);
    bool hasCompletedDailyLevel(int) = win 0x1dfbf0;
    bool hasCompletedDemonLevel(GJGameLevel*);
    bool hasCompletedGauntletLevel(int);
    bool hasCompletedLevel(GJGameLevel* level) {
    	return m_completedLevels->objectForKey(this->getLevelKey(level)) != nullptr;
    }
    bool hasCompletedMainLevel(int levelID) {
    	return m_completedLevels->objectForKey(this->getLevelKey(levelID, false, false, false)) != nullptr;
    }
    bool hasCompletedMapPack(int);
    bool hasCompletedOnlineLevel(int);
    bool hasCompletedStarLevel(GJGameLevel*);
    bool hasPendingUserCoin(char const*);
    bool hasRewardBeenCollected(GJRewardType, int);
    bool hasSecretCoin(char const*);
    bool hasUserCoin(char const*);
    TodoReturn incrementActivePath(int);
    TodoReturn incrementChallenge(GJChallengeType, int) = win 0x1defd0;
    void incrementStat(char const*, int) = win 0x1d13e0, imac 0x66260;
    TodoReturn incrementStat(char const*);
    bool isGauntletChestUnlocked(int);
    bool isItemEnabled(UnlockType type, int id) {
    	return this->isItemUnlocked(type, id) && m_enabledItems->valueForKey(this->getItemKey(id, (int)type))->boolValue();
    }
    bool isItemUnlocked(UnlockType, int) = win 0x1e2730, imac 0x6acb0;
    bool isPathChestUnlocked(int);
    bool isPathUnlocked(StatKey);
    bool isSecretChestUnlocked(int);
    bool isSecretCoin(gd::string);
    bool isSecretCoinValid(gd::string);
    bool isSpecialChestLiteUnlockable(gd::string);
    bool isSpecialChestUnlocked(gd::string) = win 0x1e7040, imac 0x76810;
    bool isStoreItemUnlocked(int);
    TodoReturn keyCostForSecretChest(int);
    TodoReturn logCoins();
    TodoReturn markLevelAsCompletedAndClaimed(GJGameLevel*);
    void postLoadGameStats();
    TodoReturn preProcessReward(GJRewardItem*);
    void preSaveGameStats();
    TodoReturn processChallengeQueue(int) = win 0x1df830;
    TodoReturn purchaseItem(int);
    TodoReturn recountSpecialStats();
    TodoReturn recountUserCoins(bool);
    TodoReturn registerRewardsFromItem(GJRewardItem*);
    TodoReturn removeChallenge(int);
    void removeErrorFromSpecialChests() = win 0x1f01f0;
    TodoReturn removeQueuedChallenge(int);
    TodoReturn removeQueuedSecondaryChallenge(int);
    void resetChallengeTimer();
    TodoReturn resetPreSync();
    TodoReturn resetSpecialStatAchievements() = imac 0x763a0;
    TodoReturn resetUserCoins();
    TodoReturn restorePostSync();
    void setAwardedBonusKeys(int);
    void setStarsForMapPack(int, int) = win 0x1dbf70;
    void setStat(char const*, int) = win 0x1d21e0, imac 0x66070;
    void setStatIfHigher(char const*, int);
    void setupIconCredits() = win 0x1c1070;
    TodoReturn shopTypeForItemID(int);
    TodoReturn shouldAwardSecretKey();
    TodoReturn starsForMapPack(int);
    TodoReturn storeChallenge(int, GJChallengeItem*);
    TodoReturn storeChallengeTime(int) = imac 0x72230;
    TodoReturn storePendingUserCoin(char const*);
    TodoReturn storeQueuedChallenge(int, GJChallengeItem*);
    TodoReturn storeRewardState(GJRewardType, int, int, gd::string);
    TodoReturn storeSecondaryQueuedChallenge(int, GJChallengeItem*);
    TodoReturn storeSecretCoin(char const*);
    void storeUserCoin(char const*);
    TodoReturn tempClear();
    void toggleEnableItem(UnlockType, int, bool) = win 0x1e2ae0, imac 0x76d50;
    void tryFixPathBug() = win 0x1d16f0;
    TodoReturn trySelectActivePath() = imac 0x6aee0;
    void uncompleteLevel(GJGameLevel*);
    void unlockGauntletChest(int);
    TodoReturn unlockPathChest(int);
    TodoReturn unlockSecretChest(int);
    TodoReturn unlockSpecialChest(gd::string);
    TodoReturn updateActivePath(StatKey);
    gd::string usernameForAccountID(int);
    void verifyPathAchievements() = win 0x1d1e60;
    void verifyUserCoins() = win 0x1dcb10;

    virtual bool init() = win 0x1ce020, imac 0x5a240;

    bool m_usePlayerStatsCCDictionary;
    cocos2d::CCString* m_trueString;
    cocos2d::CCDictionary* m_allStoreItems;
    cocos2d::CCDictionary* m_storeItems;
    cocos2d::CCDictionary* m_allTreasureRoomChests;
    cocos2d::CCDictionary* m_allTreasureRoomChestItems;
    cocos2d::CCDictionary* m_allSpecialChests;
    cocos2d::CCDictionary* m_allSpecialChestItems;
    gd::unordered_map<int, gd::string> m_specialRewardDescriptions;
    gd::unordered_map<int, gd::string> m_createSpecialChestItemsMap;
    cocos2d::CCDictionary* m_specialChestsLite;
    cocos2d::CCArray* m_storeItemArray;
    cocos2d::CCDictionary* m_rewardItems;
    cocos2d::CCDictionary* m_dailyChests;
    cocos2d::CCDictionary* m_worldAdvertChests;
    cocos2d::CCDictionary* m_activeChallenges;
    cocos2d::CCDictionary* m_upcomingChallenges;
    double m_challengeTime;
    cocos2d::CCDictionary* m_playerStats;
    gd::unordered_map<int, int> m_playerStatsRandMap;
    gd::unordered_map<int, int> m_playerStatsSeedMap;
    cocos2d::CCDictionary* m_completedLevels;
    cocos2d::CCDictionary* m_verifiedUserCoins;
    cocos2d::CCDictionary* m_pendingUserCoins;
    cocos2d::CCDictionary* m_purchasedItems;
    cocos2d::CCDictionary* m_onlineCurrencyScores;
    cocos2d::CCDictionary* m_mainCurrencyScores;
    cocos2d::CCDictionary* m_gauntletCurrencyScores;
    cocos2d::CCDictionary* m_timelyCurrencyScores;
    cocos2d::CCDictionary* m_onlineStars;
    cocos2d::CCDictionary* m_timelyStars;
    cocos2d::CCDictionary* m_gauntletDiamondScores;
    cocos2d::CCDictionary* m_timelyDiamondScores;
    cocos2d::CCDictionary* m_unusedCurrencyAwardDict;
    cocos2d::CCDictionary* m_challengeDiamonds;
    cocos2d::CCDictionary* m_completedMappacks;
    cocos2d::CCDictionary* m_completedLists;
    cocos2d::CCDictionary* m_weeklyChest;
    cocos2d::CCDictionary* m_treasureRoomChests;
    geode::SeedValueSRV m_bonusKey;
    cocos2d::CCDictionary* m_miscChests;
    cocos2d::CCDictionary* m_enabledItems;
    bool m_unkBoolIncrementStat;
    cocos2d::CCDictionary* m_unkDict;
    cocos2d::CCDictionary* m_unlockedItems;
    gd::map<std::pair<int, UnlockType>, int> m_accountIDForIcon;
    gd::map<int, gd::string> m_usernameForAccountID;
    bool m_GS29;
    int m_activePath;
}

[[link(android)]]
class GameToolbox {
    static void addBackButton(cocos2d::CCLayer*, cocos2d::CCMenuItem*) = win 0x65010, imac 0x4dbc10;
    static void addRThumbScrollButton(cocos2d::CCLayer*) = win 0x650f0;
    static void alignItemsHorisontally(cocos2d::CCArray*, float, cocos2d::CCPoint, bool) = win 0x64110;
    static void alignItemsVertically(cocos2d::CCArray*, float, cocos2d::CCPoint);
    static TodoReturn bounceTime(float);
    static TodoReturn colorToSepia(cocos2d::ccColor3B, float);
    static TodoReturn contentScaleClipRect(cocos2d::CCRect&);
    static TodoReturn createHashString(gd::string const&, int);
    static CCMenuItemToggler* createToggleButton(gd::string label, cocos2d::SEL_MenuHandler selector, bool state, cocos2d::CCMenu* menu, cocos2d::CCPoint position, cocos2d::CCNode* parent, cocos2d::CCNode* labelParent, cocos2d::CCArray* container) = imac 0x4db0e0;
    static CCMenuItemToggler* createToggleButton(gd::string label, cocos2d::SEL_MenuHandler selector, bool state, cocos2d::CCMenu* menu, cocos2d::CCPoint position, cocos2d::CCNode* parent, cocos2d::CCNode* labelParent, float buttonScale, float maxLabelScale, float maxLabelWidth, cocos2d::CCPoint labelOffset, char const* font, bool labelTop, int labelTag, cocos2d::CCArray* container) = win 0x64670, imac 0x4db210;
    static bool doWeHaveInternet();
    static TodoReturn easeToText(int);
    static float fast_rand_0_1() = imac 0x4dde00;
    static TodoReturn fast_rand_minus1_1();
    static TodoReturn fast_rand();
    static void fast_srand(uint64_t) = imac 0x4dddb0;
    static TodoReturn gen_random(int);
    static TodoReturn getDropActionWDelay(float, float, float, cocos2d::CCNode*, cocos2d::SEL_CallFunc);
    static TodoReturn getDropActionWEnd(float, float, float, cocos2d::CCAction*, float);
    static cocos2d::CCActionEase* getEasedAction(cocos2d::CCActionInterval*, int, float) = imac 0x4ddb30;
    static TodoReturn getEasedValue(float, int, float) = win 0x68b40;
    static uint64_t getfast_srand();
    static TodoReturn getInvertedEasing(int);
    static TodoReturn getLargestMergedIntDicts(cocos2d::CCDictionary*, cocos2d::CCDictionary*);
    static TodoReturn getMultipliedHSV(cocos2d::ccHSVValue const&, float);
    static TodoReturn getRelativeOffset(GameObject*, cocos2d::CCPoint) = win 0x64970;
    static gd::string getResponse(cocos2d::extension::CCHttpResponse*) = win 0x64310, imac 0x4dad80;
    static gd::string getTimeString(int, bool) = win 0x65e20, imac 0x4dd9a0;
    static TodoReturn hsvFromString(gd::string const&, char const*) = imac 0x4dc3b0;
    static gd::string intToShortString(int) = win 0x69120, imac 0x4e35d0;
    static TodoReturn intToString(int) = win 0x69060, imac 0x4e32b0;
    static bool isIOS();
    static bool isRateEasing(int);
    static TodoReturn mergeDictsSaveLargestInt(cocos2d::CCDictionary*, cocos2d::CCDictionary*);
    static TodoReturn mergeDictsSkipConflict(cocos2d::CCDictionary*, cocos2d::CCDictionary*);
    static TodoReturn msToTimeString(int, int);
    static TodoReturn multipliedColorValue(cocos2d::ccColor3B, cocos2d::ccColor3B, float);
    static TodoReturn openAppPage();
    static TodoReturn openRateURL(gd::string, gd::string);
    static cocos2d::CCParticleSystemQuad* particleFromString(gd::string const& str, cocos2d::CCParticleSystemQuad* system, bool p2) {
    	cocos2d::ParticleStruct ret;
    	GameToolbox::particleStringToStruct(str, ret);
    	return GameToolbox::particleFromStruct(ret, system, p2);
    }
    static cocos2d::CCParticleSystemQuad* particleFromStruct(cocos2d::ParticleStruct const&, cocos2d::CCParticleSystemQuad*, bool) = win 0x68000, imac 0x4e2360;
    static void particleStringToStruct(gd::string const&, cocos2d::ParticleStruct&) = win 0x67540, imac 0x4e1300;
    static gd::string pointsToString(int) = win 0x69760;
    static void postClipVisit();
    static void preVisitWithClippingRect(cocos2d::CCNode*, cocos2d::CCRect) = win 0x645c0, imac 0x4dafd0;
    static TodoReturn preVisitWithClipRect(cocos2d::CCRect);
    static gd::string saveParticleToString(cocos2d::CCParticleSystemQuad*) = win 0x662d0, imac 0x4dde80;
    static TodoReturn saveStringToFile(gd::string const&, gd::string const&);
    static TodoReturn stringFromHSV(cocos2d::ccHSVValue, char const*);
    static cocos2d::CCDictionary* stringSetupToDict(gd::string const&, char const*) = win 0x65c30;
    static gd::map<gd::string,gd::string> stringSetupToMap(gd::string const&, char const*, gd::map<gd::string, gd::string>&) = win 0x65890;
    static TodoReturn strongColor(cocos2d::ccColor3B);
    static gd::string timestampToHumanReadable(time_t, time_t) = win 0x692c0;
    static cocos2d::ccColor3B transformColor(cocos2d::ccColor3B const&, cocos2d::ccHSVValue) = win 0x65290;
    static TodoReturn transformColor(cocos2d::ccColor3B const&, float, float, float);
}

[[link(android)]]
class GauntletLayer : cocos2d::CCLayer, LevelManagerDelegate {
    // virtual ~GauntletLayer();
    GauntletLayer() {}

    static GauntletLayer* create(GauntletType gauntletType) {
    	auto ret = new GauntletLayer();
    	if (ret->init(gauntletType)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(GauntletType) = win 0x1f2b30;
    void onBack(cocos2d::CCObject* sender) = win 0x1f4de0;
    void onLevel(cocos2d::CCObject* sender) = win 0x1f4760, imac 0x380760;
    static cocos2d::CCScene* scene(GauntletType) = win 0x1f2800;
    void setupGauntlet(cocos2d::CCArray*) = win 0x1f3730, imac 0x37f2e0;
    void unlockActiveItem() = win 0x1f47d0, imac 0x3807a0;

    virtual void keyBackClicked() = win 0x1f4e30;
    virtual void loadLevelsFinished(cocos2d::CCArray*, char const*, int) = win 0x1f3320, imac 0x380350;
    virtual void loadLevelsFailed(char const*, int) = win 0x1f3530;

    cocos2d::CCArray* m_levels;
    LoadingCircle* m_loadingCircle;
    GauntletType m_gauntletType;
    cocos2d::CCSprite* m_backgroundSprite;
    void* m_unkPtr;
    CCMenuItemSpriteExtra* m_activeItemButton;
    cocos2d::CCArray* m_activeObjects;
    TextArea* m_tryAgainText;
}

[[link(android)]]
class GauntletNode : cocos2d::CCNode {
    // virtual ~GauntletNode();
    GauntletNode() {}

    static GauntletNode* create(GJMapPack* gauntlet) {
    	auto ret = new GauntletNode();
    	if (ret->init(gauntlet)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    static gd::string frameForType(GauntletType) = win 0x1f8f10;
    bool init(GJMapPack*) = win 0x1f7850, imac 0x55bed0;
    static gd::string nameForType(GauntletType) = win 0x1fa130;
    void onClaimReward() = win 0x1f8ed0, imac 0x55be00;

    cocos2d::CCNode* m_gauntletInfoNode;
    cocos2d::CCNode* m_rewardNode;
}

[[link(android)]]
class GauntletSelectLayer : cocos2d::CCLayer, BoomScrollLayerDelegate, LevelManagerDelegate {
    // virtual ~GauntletSelectLayer();
    GauntletSelectLayer() {}

    static GauntletSelectLayer* create(int p0) {
    	auto ret = new GauntletSelectLayer();
    	if (ret->init(p0)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void goToPage(int, bool) = win 0x1f6e00;
    bool init(int) = win 0x1f5580;
    void onBack(cocos2d::CCObject* sender) = win 0x1f6fb0;
    void onInfo(cocos2d::CCObject* sender) = win 0x1f60f0;
    void onNext(cocos2d::CCObject* sender) = win 0x1f6dc0, imac 0x55ab20;
    void onPlay(cocos2d::CCObject* sender) = win 0x1f7070, imac 0x55b650;
    void onPrev(cocos2d::CCObject* sender) = win 0x1f6de0, imac 0x55ab00;
    void onRefresh(cocos2d::CCObject* sender) = win 0x1f6230, imac 0x55ac60;
    static cocos2d::CCScene* scene(int) = win 0x1f5450;
    void setupGauntlets() = win 0x1f6670;
    void unblockPlay();
    void updateArrows();

    virtual void onExit();
    virtual void keyBackClicked();
    virtual void scrollLayerWillScrollToPage(BoomScrollLayer*, int);
    virtual void scrollLayerScrolledToPage(BoomScrollLayer*, int) = win 0x1f6f70;
    virtual void loadLevelsFinished(cocos2d::CCArray*, char const*, int) = win 0x1f6350, imac 0x55b290;
    virtual void loadLevelsFailed(char const*, int) = win 0x1f6500;

    cocos2d::CCSprite* m_backgroundSprite;
    BoomScrollLayer* m_scrollLayer;
    CCMenuItemSpriteExtra* m_leftButton;
    CCMenuItemSpriteExtra* m_rightButton;
    CCMenuItemSpriteExtra* m_refreshButton;
    bool m_exiting;
    bool m_playing;
    TextArea* m_tryAgainText;
    LoadingCircle* m_loadingCircle;
    cocos2d::CCDictionary* m_gauntlets;
    bool m_playBlocked;
}

[[link(android)]]
class GauntletSprite : cocos2d::CCNode {
    // virtual ~GauntletSprite();
    GauntletSprite() {}

    static GauntletSprite* create(GauntletType gauntletType, bool locked) {
    	auto ret = new GauntletSprite();
    	if (ret->init(gauntletType, locked)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void addLockedSprite() = win 0x1f4ec0, imac 0x380f90;
    void addNormalSprite() = imac 0x380ec0;
    cocos2d::ccColor3B colorForType(GauntletType);
    bool init(GauntletType gauntletType, bool locked) {
    	if (!CCNode::init()) return false;

    	m_gauntletType = gauntletType;
    	this->setContentSize({ 60.0f, 60.0f });
    	this->toggleLockedSprite(locked);

    	return true;
    }
    float luminanceForType(GauntletType) = imac 0x381280;
    void toggleLockedSprite(bool) = win 0x1f51f0, imac 0x380d70;

    GauntletType m_gauntletType;
}

[[link(android)]]
class GhostTrailEffect : cocos2d::CCNode {
    // virtual ~GhostTrailEffect();
    //GhostTrailEffect() = ios 0x305d20;

    static GhostTrailEffect* create() = win 0x69fd0;

    TodoReturn doBlendAdditive();
    void runWithTarget(cocos2d::CCSprite*, float, float, float, float, bool);
    void stopTrail();
    void trailSnapshot(float) = win 0x6a110;

    virtual bool init() = win 0x6a0b0, imac 0x5e16f0;
    virtual void draw() {}

    PAD = win 0x30;
    cocos2d::ccColor3B m_color;
    PAD = win 0xc;
}

[[link(android)]]
class GJAccountBackupDelegate {
    virtual void backupAccountFinished();
    virtual void backupAccountFailed(BackupAccountError, int);
}

[[link(android)]]
class GJAccountDelegate {
    virtual TodoReturn accountStatusChanged();
}

[[link(android)]]
class GJAccountLoginDelegate {
    virtual TodoReturn loginAccountFinished(int, int);
    virtual TodoReturn loginAccountFailed(AccountError);
}

[[link(android)]]
class GJAccountManager : cocos2d::CCNode {
    // virtual ~GJAccountManager();
    // GJAccountManager();

    static GJAccountManager* get() {
    	return GJAccountManager::sharedState();
    }

    static GJAccountManager* sharedState() = win 0x1fae30, imac 0xcf1d0;

    void addDLToActive(char const* tag, cocos2d::CCObject*);
    void addDLToActive(char const* tag);
    bool backupAccount(gd::string) = win 0x1fc7d0;
    void dataLoaded(DS_Dictionary*);
    void encodeDataTo(DS_Dictionary*) = imac 0xd3fd0;
    void firstSetup();
    bool getAccountBackupURL() = win 0x1fc1b0;
    bool getAccountSyncURL() = win 0x1fd110;
    cocos2d::CCObject* getDLObject(char const*);
    gd::string getShaPassword(gd::string) = win 0x1fedc0;
    void handleIt(bool, gd::string, gd::string, GJHttpType);
    void handleItDelayed(bool, gd::string, gd::string, GJHttpType);
    void handleItND(cocos2d::CCNode*, void*);
    bool isDLActive(char const* tag);
    void linkToAccount(gd::string, gd::string, int, int);
    void loginAccount(gd::string, gd::string);
    void onBackupAccountCompleted(gd::string, gd::string) = win 0x1fcd00;
    void onGetAccountBackupURLCompleted(gd::string, gd::string);
    void onGetAccountSyncURLCompleted(gd::string, gd::string);
    void onLoginAccountCompleted(gd::string, gd::string) = win 0x1fbdc0;
    void onProcessHttpRequestCompleted(cocos2d::extension::CCHttpClient*, cocos2d::extension::CCHttpResponse*);
    void onRegisterAccountCompleted(gd::string, gd::string) = win 0x1fb7d0;
    void onSyncAccountCompleted(gd::string, gd::string) = win 0x1fd990, imac 0xd0780;
    void onUpdateAccountSettingsCompleted(gd::string, gd::string) = win 0x1fec60;
    void ProcessHttpRequest(gd::string, gd::string, gd::string, GJHttpType) = win 0x1faf50;
    void registerAccount(gd::string, gd::string, gd::string);
    void removeDLFromActive(char const*);
    bool syncAccount(gd::string);
    void unlinkFromAccount();
    void updateAccountSettings(int, int, int, gd::string, gd::string, gd::string);

    virtual bool init() = win 0x1fb3f0;

    cocos2d::CCDictionary* m_activeDownloads;
    gd::string m_username;
    int m_accountID;
    int m_unkInt1;
    int m_unkInt2;
    gd::string m_GJP2;
    GJAccountRegisterDelegate* m_accountRegisterDelegate;
    GJAccountLoginDelegate* m_accountLoginDelegate;
    GJAccountDelegate* m_accountDelegate;
    GJAccountBackupDelegate* m_backupDelegate;
    GJAccountSyncDelegate* m_syncDelegate;
    GJAccountSettingsDelegate* m_accountSettingsDelegate;
    int m_gameManagerSize;
    int m_localLevelsSize;
    gd::string m_password;
}

[[link(android)]]
class GJAccountRegisterDelegate {
    virtual TodoReturn registerAccountFinished();
    virtual TodoReturn registerAccountFailed(AccountError);
}

[[link(android)]]
class GJAccountSettingsDelegate {
    virtual TodoReturn updateSettingsFinished();
    virtual TodoReturn updateSettingsFailed();
}

[[link(android)]]
class GJAccountSettingsLayer : FLAlertLayer, TextInputDelegate {
    // virtual ~GJAccountSettingsLayer();

    inline GJAccountSettingsLayer() {
    	m_accountID = 0;
    	m_messageStatus = 0;
    	m_friendStatus = 0;
    	m_commentHistoryStatus = 0;
    	m_youtubeURL = "";
    	m_twitterURL = "";
    	m_twitchURL = "";
    	m_youtubeInput = nullptr;
    	m_twitterInput = nullptr;
    	m_twitchInput = nullptr;
    	m_messageSettings = nullptr;
    	m_friendRequestSettings = nullptr;
    	m_commentSettings = nullptr;
    }

    static GJAccountSettingsLayer* create(int a1) {
    	GJAccountSettingsLayer* pRet = new GJAccountSettingsLayer();
    	if (pRet && pRet->init(a1)) {
    		pRet->autorelease();
    		return pRet;
    	}

    	CC_SAFE_DELETE(pRet);

    	return nullptr;
    }

    TodoReturn createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint, float, float) = imac 0x28e450;
    bool init(int) = win 0x28a730;
    void onClose(cocos2d::CCObject* sender) = imac 0x28e7c0;
    void onCommentSetting(cocos2d::CCObject* sender);
    void onFriendRequests(cocos2d::CCObject* sender);
    void onMessageSetting(cocos2d::CCObject* sender);
    void onUpdate(cocos2d::CCObject* sender);
    TodoReturn updateScoreValues();

    virtual void keyBackClicked() = win 0x28d0d0;
    virtual void textInputShouldOffset(CCTextInputNode*, float);
    virtual void textInputReturn(CCTextInputNode*);

    int m_accountID;
    int m_messageStatus;
    int m_friendStatus;
    int m_commentHistoryStatus;
    gd::string m_youtubeURL;
    gd::string m_twitterURL;
    gd::string m_twitchURL;
    CCTextInputNode* m_youtubeInput;
    CCTextInputNode* m_twitterInput;
    CCTextInputNode* m_twitchInput;
    cocos2d::CCArray* m_messageSettings;
    cocos2d::CCArray* m_friendRequestSettings;
    cocos2d::CCArray* m_commentSettings;
}

[[link(android)]]
class GJAccountSyncDelegate {
    virtual void syncAccountFinished();
    virtual void syncAccountFailed(BackupAccountError, int);
}

[[link(android)]]
class GJActionManager : cocos2d::CCNode {
    // virtual ~GJActionManager();

    static GJActionManager* create();

    TodoReturn getInternalAction(int);
    TodoReturn runInternalAction(cocos2d::CCAction*, cocos2d::CCNode*) = imac 0x5f11f0;
    TodoReturn stopAllInternalActions();
    TodoReturn stopInternalAction(int) = imac 0x5f1240;
    TodoReturn updateInternalActions(float, bool);

    virtual bool init();
}

[[link(android)]]
class GJAssetDownloadAction {
    int m_id;
    GJAssetType m_assetType;
    int m_status;
}

[[link(android), depends(GJGameState), depends(PlayerButtonCommand)]]
class GJBaseGameLayer : cocos2d::CCLayer, TriggerEffectDelegate {
    ~GJBaseGameLayer() = win 0x200420;
    // GJBaseGameLayer() = ios 0x1256b4;

    static GJBaseGameLayer* get() {
    	return GameManager::get()->m_gameLayer;
    }

    void activateCustomRing(RingObject*);
    TodoReturn activatedAudioTrigger(SFXTriggerGameObject*, float);
    TodoReturn activateEventTrigger(EventLinkTrigger*, gd::vector<int> const&);
    TodoReturn activateItemCompareTrigger(ItemTriggerGameObject*, gd::vector<int> const&) = win 0x22edb0;
    void activateItemEditTrigger(ItemTriggerGameObject*) = win 0x22e9d0;
    void activateObjectControlTrigger(ObjectControlGameObject*);
    TodoReturn activatePersistentItemTrigger(ItemTriggerGameObject*);
    void activatePlayerControlTrigger(PlayerControlGameObject*);
    TodoReturn activateResetTrigger(EffectGameObject*);
    void activateSFXEditTrigger(SFXTriggerGameObject*);
    void activateSFXTrigger(SFXTriggerGameObject*) = win 0x23b5a0;
    void activateSongEditTrigger(SongTriggerGameObject*) = win 0x23b7a0, imac 0x148ef0;
    void activateSongTrigger(SongTriggerGameObject*);
    TodoReturn activateTimerTrigger(TimerTriggerGameObject*, gd::vector<int> const&);
    TodoReturn addAreaEffect(EnterEffectObject*, gd::vector<EnterEffectInstance>*, GJAreaActionType);
    void addCustomEnterEffect(EnterEffectObject*, bool);
    TodoReturn addGuideArt(GameObject*) = imac 0x151040;
    void addObjectCounter(LabelGameObject*);
    TodoReturn addPickupTrigger(CountTriggerGameObject*);
    TodoReturn addPoints(int);
    void addProximityVolumeEffect(int, int, SFXTriggerGameObject*);
    TodoReturn addRemapTargets(gd::set<int>&) = imac 0x105180;
    void addToGroupParents(GameObject*);
    void addToGroups(GameObject*, bool) = win 0x21ea70, imac 0x12c530;
    TodoReturn addToObjectsToShow(GameObject*);
    TodoReturn addUIObject(GameObject*);
    void animateInDualGroundNew(GameObject*, float, bool, float) = win 0x20dd90;
    TodoReturn animateInGroundNew(bool, float, bool) = imac 0x113df0;
    void animateOutGroundNew(bool) = imac 0x1140e0;
    TodoReturn animatePortalY(float, float, float, float);
    TodoReturn applyLevelSettings(GameObject*) = imac 0x1473c0;
    void applyRemap(EffectGameObject*, gd::vector<int> const&, gd::unordered_map<int, int>&) = win 0x215bc0;
    void applySFXEditTrigger(int, int, SFXTriggerGameObject*);
    void applyShake(cocos2d::CCPoint&);
    void assignNewStickyGroups(cocos2d::CCArray*) = win 0x21f870;
    TodoReturn asyncBGLoaded(int);
    TodoReturn asyncGLoaded(int);
    TodoReturn asyncMGLoaded(int);
    TodoReturn atlasValue(int);
    void bumpPlayer(PlayerObject*, EffectGameObject*) = win 0x2123d0, imac 0x1175e0;
    TodoReturn buttonIDToButton(int);
    TodoReturn calculateColorGroups();
    TodoReturn cameraMoveX(float, float, float, bool);
    TodoReturn cameraMoveY(float, float, float, bool);
    bool canBeActivatedByPlayer(PlayerObject*, EffectGameObject*) = win 0x2122c0, imac 0x117180;
    TodoReturn canProcessSFX(SFXTriggerState&, gd::unordered_map<int, int>&, gd::unordered_map<int, float>&, gd::vector<SFXTriggerState>&);
    TodoReturn canTouchObject(GameObject*);
    TodoReturn checkCameraLimitAfterTeleport(PlayerObject*, float) = win 0x233f90, imac 0x1106f0;
    TodoReturn checkCollision(int, int);
    void checkCollisionBlocks(EffectGameObject*, gd::vector<EffectGameObject*>*, int) = win 0x2138c0;
    int checkCollisions(PlayerObject*, float, bool) = win 0x20e210, imac 0x1148e0;
    void checkRepellPlayer() = win 0x233cc0;
    void checkSpawnObjects() = win 0x2152f0, imac 0x11baf0;
    TodoReturn claimMoveAction(int, bool);
    TodoReturn claimParticle(gd::string, int);
    TodoReturn claimRotationAction(int, int, float&, float&, bool, bool);
    TodoReturn clearActivatedAudioTriggers();
    TodoReturn clearPickedUpItems();
    TodoReturn collectedObject(EffectGameObject*);
    void collisionCheckObjects(PlayerObject*, gd::vector<GameObject*>*, int, float) = win 0x20f360, imac 0x115a30;
    TodoReturn controlAdvancedFollowCommand(AdvancedFollowTriggerObject*, int, GJActionCommand);
    TodoReturn controlAreaEffect(EnterEffectObject*, gd::vector<EnterEffectInstance>*, GJActionCommand);
    TodoReturn controlAreaEffectWithID(int, int, GJActionCommand);
    TodoReturn controlDynamicCommand(EffectGameObject*, int, gd::vector<DynamicObjectAction>&, GJActionCommand);
    TodoReturn controlDynamicMoveCommand(EffectGameObject*, int, GJActionCommand);
    TodoReturn controlDynamicRotateCommand(EffectGameObject*, int, GJActionCommand);
    TodoReturn controlEventLink(int, int, GJActionCommand);
    TodoReturn controlGradientTrigger(GradientTriggerObject*, GJActionCommand);
    TodoReturn controlTriggersInGroup(int, GJActionCommand);
    TodoReturn controlTriggersWithControlID(int, GJActionCommand);
    TodoReturn convertToClosestDirection(float, float) = win 0x2294b0;
    void createBackground(int) = win 0x2063c0, imac 0x1029e0;
    void createGroundLayer(int, int) = win 0x206800, imac 0x102f60;
    void createMiddleground(int) = win 0x206680, imac 0x103170;
    TodoReturn createNewKeyframeAnim();
    TodoReturn createParticle(int, char const*, int, cocos2d::tCCPositionType);
    void createPlayer();
    TodoReturn createPlayerCollisionBlock() = win 0x212d70, imac 0x119d10;
    void createTextLayers() = win 0x209840;
    TodoReturn damagingObjectsInRect(cocos2d::CCRect, bool);
    void destroyObject(GameObject*) = win 0x210a90, imac 0x117c90;
    void enterDualMode(GameObject*, bool) = imac 0x119020;
    void exitStaticCamera(bool exitX, bool exitY, float time, int easingType, float easingRate, bool smoothVelocity, float smoothVelocityMod, bool exitInstant) = win 0x238fc0;
    TodoReturn flipFinished();
    void flipGravity(PlayerObject*, bool, bool) = win 0x20d520, imac 0x113940;
    TodoReturn flipObjects();
    TodoReturn gameEventToString(GJGameEvent);
    void gameEventTriggered(GJGameEvent, int, int) = win 0x22c780, imac 0x1107a0;
    TodoReturn generateEnterEasingBuffer(int, float);
    TodoReturn generateEnterEasingBuffers(EnterEffectObject*);
    TodoReturn generatePickupAnimRandVal(GameObject*, float&, float&);
    TodoReturn generateSpawnRemap() = win 0x218ae0, imac 0x105d00;
    TodoReturn generateTargetGroups() = imac 0x109600;
    TodoReturn generateVisibilityGroups();
    TodoReturn getActiveOrderSpawnObjects();
    float getAreaObjectValue(EnterEffectInstance*, GameObject*, cocos2d::CCPoint&, bool&) = win 0x222c70;
    TodoReturn getBumpMod(PlayerObject*, int);
    TodoReturn getCameraEdgeValue(int) = imac 0x13ef30;
    TodoReturn getCapacityString();
    TodoReturn getCenterGroupObject(int, int);
    TodoReturn getCustomEnterEffects(int, bool);
    float getEasedAreaValue(GameObject*, EnterEffectInstance*, float, bool, int) = win 0x222e60;
    TodoReturn getEnterEasingKey(int, float);
    TodoReturn getEnterEasingValue(float, int, float, int);
    TodoReturn getFollowSpeedVal(GameObject*, int, int, float, float);
    float getGroundHeight(PlayerObject*, int);
    TodoReturn getGroundHeightForMode(int) = win 0x20c770;
    TodoReturn getGroup(int) = win 0x21edb0;
    TodoReturn getGroupParent(int);
    TodoReturn getGroupParentsString(GameObject*);
    TodoReturn getItemValue(int, int) = win 0x22e940;
    float getMaxPortalY() = win 0x20e190;
    TodoReturn getMinDistance(cocos2d::CCPoint, cocos2d::CCArray*, float, int) = win 0x23c310;
    float getMinPortalY() = win 0x20e0b0;
    float getModifiedDelta(float) = win 0x231f40, imac 0x1417e0;
    TodoReturn getMoveTargetDelta(EffectGameObject*, bool);
    TodoReturn getOptimizedGroup(int);
    PlayerObject* getOtherPlayer(PlayerObject*) = imac 0x1121b0;
    TodoReturn getParticleKey(int, char const*, int, cocos2d::tCCPositionType);
    TodoReturn getParticleKey2(gd::string);
    TodoReturn getPlayerButtonID(int, bool);
    TodoReturn getPlayTimerFullSeconds();
    TodoReturn getPlayTimerMilli();
    TeleportPortalObject* getPortalTarget(TeleportPortalObject*);
    cocos2d::CCPoint getPortalTargetPos(TeleportPortalObject*, GameObject*, PlayerObject*);
    TodoReturn getRecordString();
    TodoReturn getRotateCommandTargets(EnhancedTriggerObject*, GameObject*&, GameObject*&, GameObject*&);
    TodoReturn getSavedPosition(int, float);
    TodoReturn getScaledGroundHeight(float);
    TodoReturn getSingleGroupObject(int);
    TodoReturn getSpecialKey(int, bool, bool);
    TodoReturn getStaticGroup(int);
    TodoReturn getStickyGroup(int);
    TodoReturn getTargetFlyCameraY(GameObject*);
    TodoReturn getTargetGroup(int, int);
    TodoReturn getTargetGroupOrigin(int, int);
    TodoReturn gravBumpPlayer(PlayerObject*, EffectGameObject*) = imac 0x1177f0;
    void groupStickyObjects(cocos2d::CCArray*) = win 0x21f690;
    void handleButton(bool down, int button, bool isPlayer1) = win 0x22e070, imac 0x13a8c0;
    bool hasItem(int);
    bool hasUniqueCoin(EffectGameObject*) = win 0x211100, imac 0x117d60;
    void increaseBatchNodeCapacity() = win 0x2077c0;
    bool isFlipping() {
    	return m_gameState.m_levelFlipping != 0.f && m_gameState.m_levelFlipping != 1.f;
    }
    bool isPlayer2Button(int);
    void lightningFlash(cocos2d::CCPoint to, cocos2d::ccColor3B color);
    void lightningFlash(cocos2d::CCPoint from, cocos2d::CCPoint to, cocos2d::ccColor3B color, float lineWidth, float duration, int displacement, bool flash, float opacity) = win 0x240650, imac 0x110550;
    TodoReturn loadGroupParentsFromString(GameObject*, gd::string);
    void loadLevelSettings() = win 0x234650, imac 0x147220;
    void loadStartPosObject() = win 0x22fee0;
    void loadUpToPosition(float, int, int) = win 0x230080;
    TodoReturn maxZOrderForShaderZ(int);
    TodoReturn minZOrderForShaderZ(int);
    TodoReturn modifyGroupPhysics(AdvancedFollowEditObject*, cocos2d::CCArray*);
    TodoReturn modifyObjectPhysics(AdvancedFollowEditObject*, GameObjectPhysics&);
    void moveAreaObject(GameObject*, float, float) = win 0x2256b0;
    TodoReturn moveCameraToPos(cocos2d::CCPoint);
    void moveObject(GameObject*, double, double, bool);
    void moveObjects(cocos2d::CCArray*, double, double, bool) = win 0x228950;
    void moveObjectsSilent(int, double, double);
    TodoReturn objectIntersectsCircle(GameObject*, GameObject*);
    GJGameEvent objectTypeToGameEvent(int) = win 0x22ccf0, imac 0x113dd0;
    TodoReturn optimizeMoveGroups();
    TodoReturn orderSpawnObjects();
    TodoReturn parentForZLayer(int, bool, int, int) = imac 0x10f020;
    void pauseAudio() = win 0x231c40;
    TodoReturn performMathOperation(double, double, int);
    TodoReturn performMathRounding(double, int);
    void pickupItem(EffectGameObject*);
    TodoReturn playAnimationCommand(int, int);
    bool playerCircleCollision(PlayerObject*, GameObject*) = win 0x20c810;
    TodoReturn playerIntersectsCircle(PlayerObject*, GameObject*);
    void playerTouchedObject(PlayerObject*, GameObject*);
    void playerTouchedRing(PlayerObject*, RingObject*) = win 0x212840, imac 0x117940;
    void playerTouchedTrigger(PlayerObject*, EffectGameObject*) = win 0x212950, imac 0x1179f0;
    TodoReturn playerWasTouchingObject(PlayerObject*, GameObject*);
    void playerWillSwitchMode(PlayerObject*, GameObject*) = win 0x20d910, imac 0x113b00;
    void playExitDualEffect(PlayerObject*) = win 0x211880;
    TodoReturn playFlashEffect(float, int, float);
    TodoReturn playKeyframeAnimation(KeyframeAnimTriggerObject*, gd::vector<int> const&);
    TodoReturn playSpeedParticle(float);
    TodoReturn positionForShaderTarget(int) = win 0x21e080;
    TodoReturn positionUIObjects();
    TodoReturn prepareSavePositionObjects();
    TodoReturn prepareTransformParent(bool);
    void preResumeGame() = imac 0x1416d0;
    TodoReturn preUpdateVisibility(float);
    void processActivatedAudioTriggers(float) = win 0x23d2c0;
    void processAdvancedFollowAction(AdvancedFollowInstance&, bool, float);
    void processAdvancedFollowActions(float) = win 0x229ce0;
    void processAreaActions(float, bool) = win 0x223bc0;
    void processAreaEffects(gd::vector<EnterEffectInstance>*, GJAreaActionType, float, bool) = win 0x222fe0, imac 0x1301e0;
    void processAreaFadeGroupAction(cocos2d::CCArray*, EnterEffectInstance*, cocos2d::CCPoint, bool);
    void processAreaMoveGroupAction(cocos2d::CCArray*, EnterEffectInstance*, cocos2d::CCPoint, int, int, int, int, int, bool, bool) = win 0x2250d0;
    void processAreaRotateGroupAction(cocos2d::CCArray*, EnterEffectInstance*, cocos2d::CCPoint, int, int, int, int, int, bool, bool) = win 0x224990;
    void processAreaTintGroupAction(cocos2d::CCArray*, EnterEffectInstance*, cocos2d::CCPoint, bool) = win 0x2257a0;
    void processAreaTransformGroupAction(cocos2d::CCArray*, EnterEffectInstance*, cocos2d::CCPoint, int, int, int, int, int, bool, bool) = win 0x223e20;
    void processAreaVisualActions(float) = imac 0x1332e0;
    GameObject* processCameraObject(GameObject* object, PlayerObject* player) {
    	if (object) {
    		player->m_lastPortalPos = object->getPosition();
    		player->m_lastActivatedPortal = object;
    	}
    	auto ret = object;
    	if (m_gameState.m_isDualMode && m_gameState.m_unkGameObjPtr2) ret = m_gameState.m_unkGameObjPtr2;
    	if (object) m_gameState.m_unkGameObjPtr1 = object;
    	return ret;
    }
    void processCommands(float) = win 0x234050, imac 0x142ea0;
    void processDynamicObjectActions(int, float) = win 0x228e80;
    void processFollowActions() = win 0x22b180;
    TodoReturn processItems();
    void processMoveActions() = win 0x2281b0;
    void processMoveActionsStep(float, bool) = win 0x2261d0;
    void processOptionsTrigger(GameOptionsTrigger*) = win 0x21e880, imac 0x12c230;
    void processPlayerFollowActions(float) = win 0x228ad0;
    void processQueuedAudioTriggers() = win 0x235430, imac 0x148af0;
    void processQueuedButtons() = win 0x22c6d0, imac 0x13a840;
    void processRotationActions() = win 0x2263f0;
    TodoReturn processSFXObjects() = win 0x23b360, imac 0x5243e0;
    TodoReturn processSFXState(SFXTriggerState*, SFXTriggerState*, int, float);
    TodoReturn processSongState(int, float, float, int, float, float, gd::vector<SongTriggerState>*);
    TodoReturn processStateObjects();
    void processTransformActions(bool) = win 0x227280;
    void queueButton(int button, bool push, bool isPlayer2) {
    	if (button <= 0 || button > 3) {
    		return;
    	}
    	PlayerButtonCommand command = {};
    	command.m_button = (PlayerButton) button;
    	command.m_isPush = push;
    	command.m_isPlayer2 = isPlayer2;
    	m_queuedButtons.push_back(command);
    }
    TodoReturn reAddToStickyGroup(GameObject*) = imac 0x12d820;
    TodoReturn recordAction(int, bool, bool);
    TodoReturn rectIntersectsCircle(cocos2d::CCRect, cocos2d::CCPoint, float);
    void refreshCounterLabels() = win 0x22fd30, imac 0x13d6a0;
    void refreshKeyframeAnims();
    TodoReturn regenerateEnterEasingBuffers() = imac 0x105e90;
    TodoReturn registerSpawnRemap(gd::vector<ChanceObject>&);
    TodoReturn registerStateObject(EffectGameObject*);
    TodoReturn removeBackground();
    TodoReturn removeCustomEnterEffects(int, bool);
    void removeFromGroupParents(GameObject*) = imac 0x12cdc0;
    void removeFromGroups(GameObject*) = win 0x21ebf0, imac 0x12c770;
    TodoReturn removeFromStickyGroup(GameObject*) = imac 0x12d790;
    TodoReturn removeGroundLayer() = imac 0x1032d0;
    TodoReturn removeGroupParent(int);
    TodoReturn removeKeyframe(KeyframeGameObject*) = imac 0x13b3e0;
    TodoReturn removeMiddleground();
    void removeObjectFromSection(GameObject*) = win 0x221960, imac 0x12de00;
    TodoReturn removePlayer2();
    TodoReturn removeTemporaryParticles();
    void reorderObjectSection(GameObject*);
    TodoReturn reparentObject(cocos2d::CCNode*, cocos2d::CCNode*);
    void resetActiveEnterEffects() = win 0x208f40, imac 0x10d100;
    int resetAreaObjectValues(GameObject*, bool) = win 0x222830;
    void resetAudio() = win 0x231ea0;
    void resetCamera() = win 0x239450, imac 0x148680;
    void resetGradientLayers() = win 0x21bad0;
    TodoReturn resetGroupCounters(bool);
    void resetLevelVariables() = win 0x234990, imac 0x147680;
    TodoReturn resetMoveOptimizedValue();
    void resetPlayer() = win 0x20cad0, imac 0x112530;
    void resetSongTriggerValues();
    TodoReturn resetSpawnChannelIndex() = win 0x23f770, imac 0x148a00;
    void resetStaticCamera(bool, bool) = win 0x239730;
    TodoReturn resetStoppedAreaObjects();
    TodoReturn restoreAllUIObjects();
    TodoReturn restoreDefaultGameplayOffsetX();
    TodoReturn restoreDefaultGameplayOffsetY();
    TodoReturn restoreRemap(EffectGameObject*, gd::unordered_map<int, int>&);
    void resumeAudio() {
    	FMODAudioEngine::sharedEngine()->resumeAllAudio();
    	FMODAudioEngine::sharedEngine()->resumeAllMusic();
    	FMODAudioEngine::sharedEngine()->m_system->update();
    }
    TodoReturn rotateAreaObjects(GameObject*, cocos2d::CCArray*, float, bool);
    TodoReturn rotateObject(GameObject*, float);
    void rotateObjects(cocos2d::CCArray*, float, cocos2d::CCPoint, cocos2d::CCPoint, bool, bool);
    void setGroupParent(GameObject*, int) = imac 0x12cc70;
    void setStartPosObject(StartPosObject* startPos) {
    	if (startPos != m_startPosObject) {
    		if (startPos) {
    			startPos->retain();
    		}
    		if (m_startPosObject) {
    			m_startPosObject->release();
    		}
    		m_startPosObject = startPos;
    	}
    }
    void setupLayers() = win 0x203640, imac 0xffcc0;
    void setupLevelStart(LevelSettingsObject*) = win 0x20cc40, imac 0x112820;
    void setupReplay(gd::string) = win 0x234240;
    void shakeCamera(float duration, float strength, float interval) = win 0x2355a0;
    TodoReturn shouldExitHackedLevel() = imac 0x102490;
    TodoReturn sortAllGroupsX();
    TodoReturn sortGroups();
    void sortSectionVector() = win 0x221ba0, imac 0x12f3f0;
    TodoReturn sortStickyGroups();
    void spawnGroupTriggered(int groupID, float, bool, gd::vector<int> const&, int, int);
    TodoReturn spawnObjectsInOrder(cocos2d::CCArray*, double, gd::vector<int> const&, int, int);
    cocos2d::CCParticleSystemQuad* spawnParticle(char const* plist, int zOrder, cocos2d::tCCPositionType positionType, cocos2d::CCPoint position) = win 0x239c30, imac 0x14b850;
    TodoReturn spawnParticleTrigger(int, cocos2d::CCPoint, float, float);
    TodoReturn spawnParticleTrigger(SpawnParticleGameObject*);
    TodoReturn spawnPlayer2();
    TodoReturn speedForShaderTarget(int) = win 0x21e130;
    cocos2d::CCArray* staticObjectsInRect(cocos2d::CCRect, bool) = win 0x20bc80;
    TodoReturn stopAllGroundActions();
    TodoReturn stopCameraShake();
    TodoReturn stopCustomEnterEffect(EnterEffectObject*, bool);
    TodoReturn stopCustomEnterEffect(EnterEffectObject*);
    TodoReturn stopSFXTrigger(SFXTriggerGameObject*);
    TodoReturn swapBackground(int);
    TodoReturn swapGround(int);
    TodoReturn swapMiddleground(int);
    void switchToFlyMode(PlayerObject* player, GameObject* object, bool unused, int type) {
    	player->switchedToMode((GameObjectType)type);
    	auto cameraObject = this->processCameraObject(object, player);
    	auto noEffects = cameraObject && cameraObject->m_hasNoEffects;
    	switch (type) {
    		case 5:
    			player->toggleFlyMode(true, noEffects);
    			break;
    		case 19:
    			player->toggleBirdMode(true, noEffects);
    			break;
    		case 26:
    			player->toggleDartMode(true, noEffects);
    			break;
    		case 41:
    			player->toggleSwingMode(true, noEffects);
    			break;
    	}
    	this->toggleGlitter(true);
    }
    void switchToRobotMode(PlayerObject*, GameObject*, bool) = imac 0x1135d0;
    void switchToRollMode(PlayerObject*, GameObject*, bool) = imac 0x113520;
    void switchToSpiderMode(PlayerObject*, GameObject*, bool) = imac 0x113680;
    void syncBGTextures() = win 0x2348f0, imac 0x147570;
    void teleportPlayer(TeleportPortalObject*, PlayerObject*) = win 0x20a960, imac 0x10fd00;
    TodoReturn testInstantCountTrigger(int, int, int, bool, int, gd::vector<int> const&, int, int);
    void toggleAudioVisualizer(bool) = win 0x242430;
    void toggleDualMode(GameObject*, bool, PlayerObject*, bool) = win 0x2112d0, imac 0x113070;
    void toggleFlipped(bool, bool) = win 0x240120;
    void toggleGroup(int, bool);
    void toggleLockPlayer(bool disable, bool p2) {
    	auto player = p2 ? m_player2 : m_player1;
    	if (disable) player->disablePlayerControls();
    	else player->enablePlayerControls();
    }
    void togglePlayerStreakBlend(bool) = imac 0x12c450;
    void togglePlayerVisibility(bool visible, bool player1) {
    	if (player1)
    		this->m_player1->toggleVisibility(visible);
    	else
    		this->m_player2->toggleVisibility(visible);
    }
    void togglePlayerVisibility(bool visible) {
    	this->togglePlayerVisibility(visible, true);
    	this->togglePlayerVisibility(visible, false);
    }
    TodoReturn transformAreaObjects(GameObject*, cocos2d::CCArray*, float, float, bool);
    TodoReturn triggerAdvancedFollowCommand(AdvancedFollowTriggerObject*);
    TodoReturn triggerAdvancedFollowEditCommand(AdvancedFollowEditObject*);
    TodoReturn triggerAreaEffect(EnterEffectObject*);
    TodoReturn triggerAreaEffectAnimation(EnterEffectObject*);
    TodoReturn triggerDynamicMoveCommand(EffectGameObject*);
    TodoReturn triggerDynamicRotateCommand(EnhancedTriggerObject*);
    TodoReturn triggerGradientCommand(GradientTriggerObject*) = win 0x21a280, imac 0x1284c0;
    TodoReturn triggerGravityChange(EffectGameObject*, int);
    TodoReturn triggerMoveCommand(EffectGameObject*);
    TodoReturn triggerRotateCommand(EnhancedTriggerObject*);
    bool triggerShaderCommand(ShaderGameObject*);
    TodoReturn triggerTransformCommand(TransformTriggerGameObject*);
    TodoReturn tryGetGroupParent(int);
    GameObject* tryGetMainObject(int) = win 0x21f050, imac 0x119940;
    TodoReturn tryGetObject(int) = win 0x21f0c0;
    TodoReturn tryResumeAudio() = imac 0x141780;
    TodoReturn unclaimParticle(char const*, cocos2d::CCParticleSystemQuad*);
    void ungroupStickyObjects(cocos2d::CCArray*) = win 0x21f7b0, imac 0x12d5c0;
    TodoReturn unlinkAllEvents();
    TodoReturn updateActiveEnterEffect(EnterEffectObject*);
    TodoReturn updateAllObjectSection();
    TodoReturn updateAreaObjectLastValues(GameObject*);
    void updateAudioVisualizer() = win 0x2421d0, imac 0x142d30;
    void updateBGArtSpeed(float, float);
    void updateCamera(float) = win 0x235640;
    TodoReturn updateCameraBGArt(cocos2d::CCPoint, float) = imac 0x149ec0;
    TodoReturn updateCameraEdge(int, int);
    void updateCameraMode(EffectGameObject* obj, bool updateDual) {
    	auto cameraFree = obj->m_cameraIsFreeMode;
    	auto freeMode = m_gameState.m_unkBool8;
    	m_gameState.m_unkBool8 = cameraFree;
    	m_gameState.m_unkBool9 = obj->m_cameraDisableGridSnap;
    	if (obj->m_cameraEditCameraSettings) {
    		m_gameState.m_unkFloat3 = std::clamp(obj->m_cameraEasingValue, 1.f, 40.f);
    		m_gameState.m_unkFloat2 = std::clamp(obj->m_cameraPaddingValue, 0.f, 1.f);
    	}
    	if (cameraFree != freeMode && updateDual) this->updateDualGround(m_player1, m_gameState.dualRelated, false, 0.f);
    }
    void updateCameraOffsetX(float, float, int, float, int, int) = win 0x2306f0, imac 0x13ece0;
    void updateCameraOffsetY(float, float, int, float, int, int) = win 0x230790, imac 0x13ede0;
    void updateCollisionBlocks();
    void updateCounters(int, int) = win 0x22e640;
    void updateDualGround(PlayerObject*, int, bool, float) = win 0x20dba0, imac 0x113730;
    void updateEnterEffects(float) = imac 0x10e1e0;
    TodoReturn updateExtendedCollision(GameObject*, bool);
    TodoReturn updateExtraGameLayers() = imac 0x12bd10;
    TodoReturn updateGameplayOffsetX(int, bool);
    TodoReturn updateGameplayOffsetY(int, bool);
    TodoReturn updateGradientLayers() = win 0x21a710;
    TodoReturn updateGroundShadows();
    TodoReturn updateGuideArt() = win 0x240010;
    TodoReturn updateInternalCamOffsetX(float, float, float);
    TodoReturn updateInternalCamOffsetY(float, float, float);
    void updateKeyframeOrder(int) = imac 0x13b2d0;
    TodoReturn updateLayerCapacity(gd::string);
    TodoReturn updateLegacyLayerCapacity(int, int, int, int);
    void updateLevelColors() = win 0x207030;
    void updateMaxGameplayY() = win 0x234810, imac 0x147420;
    TodoReturn updateMGArtSpeed(float, float);
    void updateMGOffsetY(float, float, int, float, int, int) = win 0x230830;
    TodoReturn updateOBB2(cocos2d::CCRect);
    void updateParticles(float);
    TodoReturn updatePlatformerTime();
    TodoReturn updatePlayerCollisionBlocks();
    void updateProximityVolumeEffects() = win 0x23bc70, imac 0x145ec0;
    TodoReturn updateQueuedLabels();
    TodoReturn updateReplay();
    TodoReturn updateSavePositionObjects();
    void updateShaderLayer(float) = win 0x21cde0, imac 0x12a940;
    void updateSpecialGroupData() = win 0x208ae0, imac 0x105c90;
    TodoReturn updateSpecialLabels() = win 0x2337d0;
    void updateStaticCameraPos(cocos2d::CCPoint pos, bool staticX, bool staticY, bool followOrSmoothEase, float time, int easingType, float easingRate) = win 0x238b80, imac 0x114290;
    TodoReturn updateStaticCameraPosToGroup(int, bool, bool, bool, float, float, int, float, bool, float) = win 0x238790;
    TodoReturn updateTimeMod(float, bool, bool);
    TodoReturn updateTimerLabels() = win 0x22f9c0;
    void updateZoom(float, float, int, float, int, int) = win 0x230470;
    TodoReturn visitWithColorFlash();
    TodoReturn volumeForProximityEffect(SFXTriggerInstance&) = win 0x23bf40;

    virtual void update(float) = win 0x231fe0;
    virtual bool init() = win 0x201ba0, imac 0xfe030;
    virtual void visit() = win 0x240830, imac 0x152370;
    virtual void postUpdate(float);
    virtual TodoReturn checkForEnd();
    virtual TodoReturn testTime();
    virtual void updateVerifyDamage();
    virtual void updateAttemptTime(float);
    virtual void updateVisibility(float);
    virtual TodoReturn playerTookDamage(PlayerObject*);
    virtual TodoReturn opacityForObject(GameObject*) = win 0x231bc0, imac 0x141640;
    virtual TodoReturn addToSpeedObjects(EffectGameObject*);
    virtual void objectsCollided(int, int) = win 0x213b70;
    virtual void updateColor(cocos2d::ccColor3B& color, float fadeTime, int colorID, bool blending, float opacity, cocos2d::ccHSVValue& copyHSV, int colorIDToCopy, bool copyOpacity, EffectGameObject* callerObject, int unk1, int unk2) = win 0x21e4a0, imac 0x12be70;
    virtual void toggleGroupTriggered(int, bool, gd::vector<int> const&, int, int) = win 0x21e680, imac 0x12c010;
    virtual void spawnGroup(int, bool, double, gd::vector<int> const&, int, int) = win 0x215580, imac 0x11be10;
    virtual void spawnObject(GameObject*, double, gd::vector<int> const&) = win 0x215a30, imac 0x11c1b0;
    virtual TodoReturn activateEndTrigger(int, bool, bool);
    virtual void activatePlatformerEndTrigger(EndTriggerGameObject*, gd::vector<int> const&);
    virtual void toggleGlitter(bool) {}
    virtual void destroyPlayer(PlayerObject*, GameObject*);
    virtual void updateDebugDraw() = win 0x20b3b0, imac 0x110b70;
    virtual void addToSection(GameObject*) = win 0x221100;
    virtual void addToGroup(GameObject*, int, bool) = win 0x21eb00, imac 0x12c5a0;
    virtual void removeFromGroup(GameObject*, int) = win 0x21ec80, imac 0x12c7d0;
    virtual void updateObjectSection(GameObject*) = win 0x222b50, imac 0x130080;
    virtual TodoReturn updateDisabledObjectsLastPos(cocos2d::CCArray*);
    virtual TodoReturn toggleGroundVisibility(bool);
    virtual void toggleMGVisibility(bool);
    virtual void toggleHideAttempts(bool);
    virtual float timeForPos(cocos2d::CCPoint, int, int, bool, int) { return 0.f; }
    virtual float posForTime(float) { return 0.f; }
    virtual void resetSPTriggered() {}
    virtual void updateScreenRotation(float, bool, bool, float, int, float, int, int) = win 0x230600, imac 0x13eaa0;
    virtual TodoReturn reverseDirection(EffectGameObject*) = win 0x212b60;
    virtual void rotateGameplay(RotateGameplayGameObject*) = win 0x212bc0, imac 0x119b30;
    virtual TodoReturn didRotateGameplay();
    virtual void updateTimeWarp(float) = win 0x2308e0, imac 0x13f240;
    virtual void updateTimeWarp(GameObject*, float) = win 0x2308d0;
    virtual TodoReturn applyTimeWarp(float) = win 0x230930, imac 0x13f290;
    virtual void playGravityEffect(bool);
    virtual TodoReturn manualUpdateObjectColors(GameObject*);
    virtual TodoReturn createCustomParticle(gd::string const&, cocos2d::ParticleStruct const&, int, bool) = win 0x23a6d0, imac 0x14c830;
    virtual TodoReturn claimCustomParticle(gd::string const&, cocos2d::ParticleStruct const&, int, int, int, bool) = win 0x23a9d0, imac 0x14cbc0;
    virtual TodoReturn unclaimCustomParticle(gd::string const&, cocos2d::CCParticleSystemQuad*) = win 0x23abd0, imac 0x14cdc0;
    virtual TodoReturn activatedAudioTrigger(SFXTriggerGameObject*) = win 0x23c780, imac 0x14dce0;
    virtual void checkpointActivated(CheckpointGameObject*) = win 0x240410, imac 0x152090;
    virtual TodoReturn flipArt(bool);
    virtual void addKeyframe(KeyframeGameObject*) = win 0x22e300, imac 0x13b240;
    virtual void updateTimeLabel(int, int, bool);
    virtual TodoReturn checkSnapshot();
    virtual void toggleProgressbar();
    virtual TodoReturn toggleInfoLabel();
    virtual void removeAllCheckpoints();
    virtual TodoReturn toggleMusicInPractice();

    PAD = win 0x8, android 0x8, mac 0x8, ios 0x8;
    GJGameState m_gameState;
    GJGameLevel* m_level;
    PlaybackMode m_playbackMode;
    bool m_decimalPercentage;
    bool m_extraLDM;
    bool m_0173;
    bool m_enable22Changes;
    bool m_allowStaticRotate;
    bool m_fixNegativeScale;
    bool m_startingFromBeginning;
    gd::vector<gd::vector<int>*> m_field_8B0;
    gd::vector<int> m_unkVectorTypeIsWrong;
    cocos2d::CCNode* m_field_8E0;
    cocos2d::CCNode* m_field_8E8;
    cocos2d::CCNode* m_field_8F0;
    cocos2d::CCNode* m_field_8F8;
    cocos2d::CCNode* m_field_900;
    cocos2d::CCNode* m_field_908;
    OBB2D* m_obb2;
    gd::vector<gd::unordered_map<int,int>> m_spawnRemapTriggers;
    gd::unordered_map<int, cocos2d::CCPoint> m_umapIntCCPoint;
    GJEffectManager* m_effectManager;
    cocos2d::CCSpriteBatchNode* m_unk950;
    cocos2d::CCSpriteBatchNode* m_unk958;
    cocos2d::CCSpriteBatchNode* m_unk960;
    cocos2d::CCSpriteBatchNode* m_unk968;
    cocos2d::CCSpriteBatchNode* m_unk970;
    cocos2d::CCSpriteBatchNode* m_unk978;
    cocos2d::CCSpriteBatchNode* m_unk980;
    cocos2d::CCSpriteBatchNode* m_unk988;
    CCNodeContainer* m_unk990;
    cocos2d::CCSpriteBatchNode* m_unk998;
    cocos2d::CCSpriteBatchNode* m_unk9a0;
    cocos2d::CCSpriteBatchNode* m_unk9a8;
    cocos2d::CCSpriteBatchNode* m_unk9b0;
    cocos2d::CCSpriteBatchNode* m_unk9b8;
    cocos2d::CCSpriteBatchNode* m_unk9c0;
    cocos2d::CCSpriteBatchNode* m_unk9c8;
    cocos2d::CCSpriteBatchNode* m_unk9d0;
    cocos2d::CCSpriteBatchNode* m_unk9d8;
    cocos2d::CCSpriteBatchNode* m_unk9e0;
    cocos2d::CCSpriteBatchNode* m_unk9e8;
    cocos2d::CCSpriteBatchNode* m_unk9f0;
    cocos2d::CCSpriteBatchNode* m_unk9f8;
    CCNodeContainer* m_unka00;
    cocos2d::CCSpriteBatchNode* m_unka08;
    cocos2d::CCSpriteBatchNode* m_unka10;
    cocos2d::CCSpriteBatchNode* m_unka18;
    cocos2d::CCSpriteBatchNode* m_unka20;
    cocos2d::CCSpriteBatchNode* m_unka28;
    cocos2d::CCSpriteBatchNode* m_unka30;
    cocos2d::CCSpriteBatchNode* m_unka38;
    cocos2d::CCSpriteBatchNode* m_unka40;
    cocos2d::CCSpriteBatchNode* m_unka48;
    cocos2d::CCSpriteBatchNode* m_unka50;
    cocos2d::CCSpriteBatchNode* m_unka58;
    cocos2d::CCSpriteBatchNode* m_unka60;
    cocos2d::CCSpriteBatchNode* m_unka68;
    CCNodeContainer* m_unka70;
    cocos2d::CCSpriteBatchNode* m_unka78;
    cocos2d::CCSpriteBatchNode* m_unka80;
    cocos2d::CCSpriteBatchNode* m_unka88;
    cocos2d::CCSpriteBatchNode* m_unka90;
    cocos2d::CCSpriteBatchNode* m_unka98;
    cocos2d::CCSpriteBatchNode* m_unkaa0;
    cocos2d::CCSpriteBatchNode* m_unkaa8;
    cocos2d::CCSpriteBatchNode* m_unkab0;
    cocos2d::CCSpriteBatchNode* m_unkab8;
    cocos2d::CCSpriteBatchNode* m_unkac0;
    cocos2d::CCSpriteBatchNode* m_unkac8;
    cocos2d::CCSpriteBatchNode* m_unkad0;
    cocos2d::CCSpriteBatchNode* m_unkad8;
    CCNodeContainer* m_unkae0;
    cocos2d::CCSpriteBatchNode* m_unkae8;
    cocos2d::CCSpriteBatchNode* m_unkaf0;
    cocos2d::CCSpriteBatchNode* m_unkaf8;
    cocos2d::CCSpriteBatchNode* m_unkb00;
    cocos2d::CCSpriteBatchNode* m_unkb08;
    cocos2d::CCSpriteBatchNode* m_unkb10;
    cocos2d::CCSpriteBatchNode* m_unkb18;
    cocos2d::CCSpriteBatchNode* m_unkb20;
    cocos2d::CCSpriteBatchNode* m_unkb28;
    cocos2d::CCSpriteBatchNode* m_unkb30;
    cocos2d::CCSpriteBatchNode* m_unkb38;
    cocos2d::CCSpriteBatchNode* m_unkb40;
    cocos2d::CCSpriteBatchNode* m_unkb48;
    cocos2d::CCSpriteBatchNode* m_unkb50;
    void* m_unkb5c;
    cocos2d::CCSpriteBatchNode* m_unkb60;
    cocos2d::CCSpriteBatchNode* m_unkb68;
    cocos2d::CCSpriteBatchNode* m_unkb70;
    cocos2d::CCSpriteBatchNode* m_unkb78;
    CCNodeContainer* m_unkb80;
    cocos2d::CCSpriteBatchNode* m_unkb88;
    cocos2d::CCSpriteBatchNode* m_unkb90;
    cocos2d::CCSpriteBatchNode* m_unkb98;
    cocos2d::CCSpriteBatchNode* m_unkba0;
    cocos2d::CCSpriteBatchNode* m_unkba8;
    cocos2d::CCSpriteBatchNode* m_unkbb0;
    cocos2d::CCSpriteBatchNode* m_unkbb8;
    cocos2d::CCSpriteBatchNode* m_unkbc0;
    cocos2d::CCSpriteBatchNode* m_unkbc8;
    cocos2d::CCSpriteBatchNode* m_unkbd0;
    cocos2d::CCSpriteBatchNode* m_unkbd8;
    cocos2d::CCSpriteBatchNode* m_unkbe0;
    cocos2d::CCSpriteBatchNode* m_unkbe8;
    CCNodeContainer* m_unkbf0;
    cocos2d::CCSpriteBatchNode* m_unkbf8;
    cocos2d::CCSpriteBatchNode* m_unkc00;
    cocos2d::CCSpriteBatchNode* m_unkc08;
    cocos2d::CCSpriteBatchNode* m_unkc10;
    cocos2d::CCSpriteBatchNode* m_unkc18;
    cocos2d::CCSpriteBatchNode* m_unkc20;
    cocos2d::CCSpriteBatchNode* m_unkc28;
    cocos2d::CCSpriteBatchNode* m_unkc30;
    cocos2d::CCSpriteBatchNode* m_unkc38;
    cocos2d::CCSpriteBatchNode* m_unkc40;
    cocos2d::CCSpriteBatchNode* m_unkc48;
    cocos2d::CCSpriteBatchNode* m_unkc50;
    cocos2d::CCSpriteBatchNode* m_unkc58;
    CCNodeContainer* m_unkc60;
    cocos2d::CCSpriteBatchNode* m_unkc68;
    cocos2d::CCSpriteBatchNode* m_unkc70;
    cocos2d::CCSpriteBatchNode* m_unkc78;
    cocos2d::CCSpriteBatchNode* m_unkc80;
    cocos2d::CCSpriteBatchNode* m_unkc88;
    cocos2d::CCSpriteBatchNode* m_unkc90;
    cocos2d::CCSpriteBatchNode* m_unkc98;
    cocos2d::CCSpriteBatchNode* m_unkca0;
    cocos2d::CCSpriteBatchNode* m_unkca8;
    cocos2d::CCSpriteBatchNode* m_unkcb0;
    cocos2d::CCSpriteBatchNode* m_unkcb8;
    cocos2d::CCSpriteBatchNode* m_unkcc0;
    cocos2d::CCSpriteBatchNode* m_unkcc8;
    CCNodeContainer* m_unkcd0;
    cocos2d::CCSpriteBatchNode* m_unkcd8;
    cocos2d::CCSpriteBatchNode* m_unkce0;
    cocos2d::CCSpriteBatchNode* m_unkce8;
    cocos2d::CCSpriteBatchNode* m_unkcf0;
    cocos2d::CCSpriteBatchNode* m_unkcf8;
    cocos2d::CCSpriteBatchNode* m_unkd00;
    cocos2d::CCSpriteBatchNode* m_unkd08;
    cocos2d::CCSpriteBatchNode* m_unkd10;
    cocos2d::CCSpriteBatchNode* m_unkd18;
    cocos2d::CCSpriteBatchNode* m_unkd20;
    cocos2d::CCSpriteBatchNode* m_unkd28;
    cocos2d::CCSpriteBatchNode* m_unkd30;
    cocos2d::CCSpriteBatchNode* m_unkd38;
    CCNodeContainer* m_unkd40;
    cocos2d::CCSpriteBatchNode* m_unkd48;
    cocos2d::CCSpriteBatchNode* m_unkd50;
    cocos2d::CCSpriteBatchNode* m_unkd58;
    cocos2d::CCSpriteBatchNode* m_unkd60;
    cocos2d::CCSpriteBatchNode* m_unkd68;
    cocos2d::CCSpriteBatchNode* m_unkd70;
    cocos2d::CCSpriteBatchNode* m_unkd78;
    cocos2d::CCSpriteBatchNode* m_unkd80;
    cocos2d::CCSpriteBatchNode* m_unkd88;
    cocos2d::CCSpriteBatchNode* m_unkd90;
    PlayerObject* m_player1;
    PlayerObject* m_player2;
    LevelSettingsObject* m_levelSettings;
    cocos2d::CCArray* m_objects;
    cocos2d::CCArray* m_unknownCB0;
    cocos2d::CCArray* m_unknownCB8;
    cocos2d::CCDictionary* m_unknownCC0;
    cocos2d::CCNode* m_unknownCC8;
    gd::vector<GameObject*> m_unkdd8;
    gd::vector<GameObject*> m_unkdf0;
    gd::vector<GameObject*> m_unke08;
    gd::vector<GameObject*> m_unke20;
    gd::vector<GameObject*> m_unke38;
    gd::unordered_map<int, gd::vector<GameObject*>> m_unke50;
    gd::vector<GameObject*> m_unke90;
    int m_unkea8;
    int m_unkeac;
    gd::vector<GameObject*> m_unkeb0;
    int m_unkec8;
    int m_unkecc;
    int m_unked0;
    int m_unked4;
    int m_unked8;
    int m_unkedc;
    int m_unkee0;
    int m_unkee4;
    int m_unkee8;
    int m_unkeec;
    int m_unkef0;
    int m_unkef4;
    cocos2d::CCDictionary* m_groupDict;
    cocos2d::CCDictionary* m_staticGroupDict;
    cocos2d::CCDictionary* m_optimizedGroupDict;
    gd::vector<cocos2d::CCArray*> m_groups;
    gd::vector<cocos2d::CCArray*> m_staticGroups;
    gd::vector<cocos2d::CCArray*> m_optimizedGroups;
    cocos2d::CCDictionary* m_unknownE38;
    cocos2d::CCDictionary* m_unknownE40;
    cocos2d::CCDictionary* m_unknownE48;
    cocos2d::CCArray* m_unknownE50;
    gd::unordered_map<int, std::pair<int, int>> m_unknownE58;
    cocos2d::CCDictionary* m_linkedGroupDict;
    int m_lastUsedLinkedID;
    cocos2d::CCNode* m_unknownE90;
    cocos2d::CCNode* m_unknownE98;
    cocos2d::CCNode* m_unknownEA0;
    cocos2d::CCLayer* m_objectLayer;
    cocos2d::CCLayer* m_unkff8;
    cocos2d::CCLayer* m_unk1000;
    cocos2d::CCSprite* m_unk1008;
    void* m_unk1010;
    GJGroundLayer* m_groundLayer;
    GJGroundLayer* m_groundLayer2;
    GJMGLayer* m_middleground;
    cocos2d::CCArray* m_batchNodes;
    cocos2d::CCDictionary* m_unk1038;

    gd::unordered_map<int, gd::vector<LabelGameObject*>> m_umapIntVectorLabelGameObjectPtr;
    gd::unordered_map<int, gd::vector<LabelGameObject*>> m_umapIntVectorLabelGameObjectPtr2;
    gd::map<std::pair<int, int>, int> m_mapTupleIntIntIntTupleIntIntInt;
    bool m_increasedLayerCapacity;
    std::array<float, 2000> m_massiveFloatArray;

    gd::map<std::pair<int, int>, int> m_mapPairIntIntPairFloatFloat;
    gd::vector<float> field_3058;
    gd::unordered_map<int, int> m_umapIntInt3;
    int m_easingRelated;
    bool field_30AC;
    int m_clicks;

    int m_attempts;
    bool m_bUnk30b8;
    int m_leftSectionIndex;
    int m_rightSectionIndex;
    int m_bottomSectionIndex;
    int m_topSectionIndex;
    bool m_superHighGraphics;
    bool m_blending;
    bool m_isPlatformer;
    GameObject* m_player1CollisionBlock;
    GameObject* m_player2CollisionBlock;
    int m_particleCount;
    int m_customParticleCount;
    int m_particleSystemLimit;
    cocos2d::CCDictionary* m_particlesDict;
    cocos2d::CCDictionary* m_customParticles;
    cocos2d::CCArray* m_unclaimedParticles;
    gd::unordered_map<int, gd::string> m_particleCountToParticleString;
    cocos2d::CCDictionary* m_claimedParticles;
    cocos2d::CCArray* m_temporaryParticles;
    gd::unordered_set<int> m_customParticlesUIDs;
    cocos2d::CCDictionary* m_gradientLayers;
    void* m_unk2a54;
    ShaderLayer* m_shaderLayer;
    bool m_bUnk31a0;
    bool m_bUnk31a1;
    StartPosObject* m_startPosObject;
    bool m_unk3188;
    int m_unk318c;
    int m_unk3190;
    gd::vector<GameObject*> m_unk3198;
    int m_unk31b0;
    int m_unk31b4;
    gd::vector<GameObject*> m_unk31b8;
    gd::vector<GameObject*> m_unk31d0;
    bool m_isPracticeMode;
    bool m_practiceMusicSync;
    float m_loadingProgress;
    cocos2d::CCNode* m_unk2a84;
    int m_unk2a88;
    float m_unk2a8c;
    int m_unk2a90;
    int m_unk2a94;
    int m_unk2a98;
    cocos2d::CCDictionary* m_collectedItems;
    float m_levelLength;
    int m_unk2aa4;
    EndPortalObject* m_endPortal;
    bool m_isTestMode;
    bool m_unk3089;
    bool m_unk308a;
    int m_unk322c;
    int m_unk3230;
    bool m_unk3234;
    cocos2d::CCParticleSystemQuad* m_unk3238;
    bool m_unk3240;
    bool m_unk3241;
    bool m_unk3242;
    double m_extraDelta;
    bool m_started;
    bool m_unk3251;
    float m_unk3254;
    float m_unk3258;
    float m_unk325c;
    float m_unk3260;
    AudioEffectsLayer* m_audioEffectsLayer;
    OBB2D* m_unk3270;
    gd::vector<GameObject*> m_unk3278;
    int m_unk3290;
    int m_unk3294;
    cocos2d::ccColor3B m_unk3298;
    int m_resumeTimer;
    bool m_unk32a0;
    int m_unk32a4;
    gd::string m_unk32a8;
    cocos2d::CCObject* m_unk32c8;
    int m_unk32d0;
    double m_unk32d8;
    int m_coinsCollected;
    int m_unk32e4;
    int m_replayRandSeed;
    int m_unk32ec;
    int m_unk32f0;
    gd::vector<PlayerButtonCommand> m_queuedButtons;
    gd::vector<PlayerButtonCommand> m_queuedButtons2;
    gd::vector<PlayerButtonCommand> m_queuedButtons3;
    gd::vector<PlayerButtonCommand> m_queuedButtons4;
    gd::vector<PlayerButtonCommand> m_queuedButtons5;
    int m_someQueuedButtonSize;
    bool m_unk3374;
    bool m_unk3375;
    cocos2d::CCArray* m_unk3378;
    float m_unk3380;
    gd::vector<int> m_unk3388;
    gd::vector<int> m_unk33a0;
    bool m_unk33b8;
    cocos2d::CCArray* m_unk33c0;
    cocos2d::CCArray* m_unk33c8;
    gd::unordered_map<int, int> m_unk33d0;
    gd::unordered_map<int, int> m_unk3410;
    bool m_unk3450;
    cocos2d::CCDictionary* m_unk3458;
    int m_unk3460;
    UILayer* m_uiLayer;
    cocos2d::CCArray* m_unk3470;
    cocos2d::CCDictionary* m_unk3478;
    cocos2d::CCNode* m_unk3480;
    double m_timePlayed;
    bool m_levelEndAnimationStarted;
    int m_unknown3494;
    gd::string m_pointsString;
    gd::vector<gd::vector<gd::vector<GameObject*>*>*> m_sections;
    gd::vector<gd::vector<gd::vector<GameObject*>*>*> m_nonEffectObjects;
    gd::vector<gd::vector<GameObject*>*> m_collisionBlockSections;
    gd::vector<GameObject*> m_calcNonEffectObjects;
    int m_calcNonEffectObjectsSize;
    gd::vector<GameObject*> m_calcCollisionBlockObjects;
    int m_calcCollisionBlockObjectsSize;
    gd::vector<GameObject*> m_calcCollisionBlockObjects2;
    int m_calcCollisionBlockObjects2Size;
    gd::vector<gd::vector<int>*> m_sectionSizes;
    gd::vector<gd::vector<int>*> m_nonEffectObjectsSizes;
    gd::vector<gd::vector<int>*> m_collisionBlockSectionSizes;
    gd::vector<gd::vector<bool>*> m_nonEffectObjectsFlags;
    float m_unknown35c0;
    float m_unknown35c4;
    float m_unknown35c8;
    float m_unknown35cc;
    gd::unordered_map<int, int> m_stickyGroups;
    FMODLevelVisualizer* m_audioVisualizerBG;
    FMODLevelVisualizer* m_audioVisualizerSFX;
    bool m_showAudioVisualizer;

    int m_areaMovedCount;
    int m_areaScaledCount;
    int m_areaRotatedCount;
    int m_areaColorCount;
    int m_areaMovedCountTotal;
    int m_areaScaledCountTotal;
    int m_areaRotatedCountTotal;
    int m_areaColorCountTotal;
    int m_movedCount;
    int m_scaledCount;
    int m_rotatedCount;
    int m_followedCount;
    int m_areaMovedCountDisplay;
    int m_areaScaledCountDisplay;
    int m_areaRotatedCountDisplay;
    int m_areaColorCountDisplay;
    int m_areaMovedCountTotalDisplay;
    int m_areaScaledCountTotalDisplay;
    int m_areaRotatedCountTotalDisplay;
    int m_areaColorCountTotalDisplay;
    int m_movedCountDisplay;
    int m_scaledCountDisplay;
    int m_rotatedCountDisplay;
    int m_followedCountDisplay;

    int m_unknown3684;
    GJGameLoadingLayer* m_loadingLayer;
    cocos2d::CCDrawNode* m_debugDrawNode;
    void* m_unk3678;
    bool m_isDebugDrawEnabled;
    bool m_unk3501;
    GameObject* m_anticheatSpike;
}

[[link(android)]]
class GJBigSprite : cocos2d::CCNode {
    // virtual ~GJBigSprite();

    static GJBigSprite* create();

    TodoReturn finishedLoadingSpriteAsync(cocos2d::CCObject*);
    TodoReturn loadSpriteAsync(gd::string, int);
    TodoReturn unloadAll();
    TodoReturn unloadSprite(gd::string, int);
    TodoReturn updateSpriteVisibility();

    virtual bool init();
}

[[link(android)]]
class GJBigSpriteNode : cocos2d::CCNode {
    // virtual ~GJBigSpriteNode();

    static GJBigSpriteNode* create();

    virtual bool init();
}

[[link(android)]]
class GJChallengeDelegate {
    virtual void challengeStatusFinished();
    virtual void challengeStatusFailed();
}

[[link(android)]]
class GJChallengeItem : cocos2d::CCObject {
    // virtual ~GJChallengeItem();

    static GJChallengeItem* create();
    static GJChallengeItem* create(GJChallengeType challengeType, int goal, int reward, int timeLeft, gd::string questName);

    static GJChallengeItem* createFromString(gd::string string) = imac 0x8e800;
    static GJChallengeItem* createWithCoder(DS_Dictionary* dsdict) = imac 0x8ec20;
    void dataLoaded(DS_Dictionary* dsdict) = imac 0x8ec60;
    void incrementCount(int add);
    bool init(GJChallengeType challengeType, int goal, int reward, int timeLeft, gd::string questName);
    void setCount(int value);

    virtual void encodeWithCoder(DS_Dictionary* dsdict) = win 0x1f1580, imac 0x8edc0;
    virtual bool canEncode();

    GJChallengeType m_challengeType;
    geode::SeedValueSRV m_count;
    geode::SeedValueSRV m_reward;
    geode::SeedValueSRV m_goal;
    int m_timeLeft;
    bool m_canClaim;
    int m_position;
    gd::string m_name;
}

[[link(android)]]
class GJChestSprite : cocos2d::CCSprite {
    // virtual ~GJChestSprite();

    static GJChestSprite* create(int) = win 0x3ba090, imac 0x20aad0;

    bool init(int chestType) {
    	if (!cocos2d::CCSprite::init()) return false;
    	m_chestType = chestType;
    	this->setContentSize({ 0, 0 });
    	this->switchToState(ChestSpriteState::Closed, false);
    	return true;
    }
    void switchToState(ChestSpriteState, bool) = win 0x3ba290;

    virtual void setOpacity(unsigned char) = win 0x3ba220;
    virtual void setColor(cocos2d::ccColor3B const&) = win 0x3ba160, imac 0x20d720;

    int m_chestType;
    ChestSpriteState m_spriteState;
    bool m_dark;
}

[[link(android)]]
class GJColorSetupLayer : FLAlertLayer, ColorSelectDelegate, FLAlertLayerProtocol {
    // virtual ~GJColorSetupLayer();

    static GJColorSetupLayer* create(LevelSettingsObject*) = win 0x24ee60, imac 0x1f8e10;

    bool init(LevelSettingsObject*) = win 0x24efa0, imac 0x1f8fa0;
    void onClose(cocos2d::CCObject* sender) = win 0x24fc30;
    void onColor(cocos2d::CCObject* sender) = win 0x24fae0, imac 0x1f96b0;
    void onPage(cocos2d::CCObject* sender) = win 0x24fa90, imac 0x1f9900;
    void showPage(int) = win 0x24fbc0, imac 0x1f99f0;
    void updateSpriteColor(ColorChannelSprite*, cocos2d::CCLabelBMFont*, int) = win 0x24f920, imac 0x1f9a60;
    void updateSpriteColors() = win 0x24f800, imac 0x1f9770;

    virtual void keyBackClicked() = win 0x24fc80;
    virtual void colorSelectClosed(cocos2d::CCNode*) = win 0x24fbb0, imac 0x1f9b00;

    LevelSettingsObject* m_settingsObject;
    cocos2d::CCDictionary* m_unk290;
    cocos2d::CCDictionary* m_unk298;
    cocos2d::CCArray* m_colorLabels;
    cocos2d::CCArray* m_colorSprites;
    int m_page;
    int m_colorsPerPage;
    int m_totalPages;
    CCMenuItemSpriteExtra* m_prevButton;
    CCMenuItemSpriteExtra* m_nextButton;
    bool m_closeOnSelect;
    ColorSetupDelegate* m_delegate;
    int m_colorID;
}

[[link(android)]]
class GJComment : cocos2d::CCNode {
    // virtual ~GJComment();

    static GJComment* create();
    static GJComment* create(cocos2d::CCDictionary*);

    virtual bool init() = imac 0x54a4e0;

    gd::string m_commentString;
    gd::string m_userName;
    int m_commentID;
    int m_userID;
    int m_likeCount;
    int m_levelID;
    bool m_isSpam;
    int m_accountID;
    gd::string m_uploadDate;
    bool m_commentDeleted;
    int m_percentage;
    int m_modBadge;
    cocos2d::ccColor3B m_color;
    bool m_hasLevelID;
    bool m_unkMultiplayerBool;
    GJUserScore* m_userScore;
}

[[link(android)]]
class GJCommentListLayer : cocos2d::CCLayerColor {
    // virtual ~GJCommentListLayer();

    static GJCommentListLayer* create(BoomListView* listView, char const* title, cocos2d::ccColor4B color, float width, float height, bool blueBorder) = win 0x28a200, imac 0x28c140;

    bool init(BoomListView* listView, char const* title, cocos2d::ccColor4B color, float width, float height, bool blueBorder) = win 0x28a320;

    BoomListView* m_list;
}

[[link(android)]]
class GJDailyLevelDelegate {
    virtual void dailyStatusFinished(GJTimedLevelType);
    virtual void dailyStatusFailed(GJTimedLevelType, GJErrorCode);
}

[[link(android)]]
class GJDifficultySprite : cocos2d::CCSprite {
    // virtual ~GJDifficultySprite();

    static GJDifficultySprite* create(int, GJDifficultyName) = win 0x29d7b0, imac 0x2a2d70;

    static gd::string getDifficultyFrame(int, GJDifficultyName) = win 0x29d890, imac 0x2a2ec0;
    bool init(int, GJDifficultyName) = imac 0x2a2e50;
    void updateDifficultyFrame(int, GJDifficultyName) = win 0x29d970, imac 0x2a3000;
    void updateFeatureState(GJFeatureState) = win 0x29da90, imac 0x2a3180;
    void updateFeatureStateFromLevel(GJGameLevel*);

    GJFeatureState m_featureState;
}

[[link(android)]]
class GJDropDownLayer : cocos2d::CCLayerColor {
    // virtual ~GJDropDownLayer();
    inline GJDropDownLayer() {
    	m_endPosition = cocos2d::CCPointMake(0.f, 0.f);
    	m_startPosition = cocos2d::CCPointMake(0.f, 0.f);
    	m_buttonMenu = nullptr;
    	m_listLayer = nullptr;
    	m_mainLayer = nullptr;
    	m_closeOnHide = false;
    	m_delegate = nullptr;
    	m_fastMenu = false;
    }

    bool init(char const*, float, bool) = win 0x24fd90, imac 0x5cf150;
    bool init(char const* title) {
    	return init(title, 220.0f, false);
    }

    static GJDropDownLayer* create(const char* title, float height, bool p2) {
    	GJDropDownLayer* pRet = new GJDropDownLayer();
    	if (pRet && pRet->init(title, height, p2)) {
    		pRet->autorelease();
    		return pRet;
    	}
    	CC_SAFE_DELETE(pRet);
    	return nullptr;
    }
    static GJDropDownLayer* create(const char* title) {
    	GJDropDownLayer* pRet = new GJDropDownLayer();
    	if (pRet && pRet->init(title)) {
    		pRet->autorelease();
    		return pRet;
    	}
    	CC_SAFE_DELETE(pRet);
    	return nullptr;
    }

    virtual void draw();
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void customSetup() {}
    virtual void enterLayer();
    virtual void exitLayer(cocos2d::CCObject*) = win 0x250230, imac 0x5cf690;
    virtual void showLayer(bool) = win 0x250270;
    virtual void hideLayer(bool) = win 0x2503c0, imac 0x5cf7e0;
    virtual void layerVisible();
    virtual void layerHidden();
    virtual void enterAnimFinished() {}
    virtual void disableUI() = win 0x2501d0;
    virtual void enableUI() = win 0x2501f0;

    cocos2d::CCPoint m_endPosition;
    cocos2d::CCPoint m_startPosition;
    cocos2d::CCMenu* m_buttonMenu;
    GJListLayer* m_listLayer;
    cocos2d::CCLayer* m_mainLayer;
    bool m_closeOnHide;
    GJDropDownLayerDelegate* m_delegate;
    bool m_fastMenu;
}

[[link(android)]]
class GJDropDownLayerDelegate {
    virtual void dropDownLayerWillClose(GJDropDownLayer*) {}
}

[[link(android), depends(DynamicMoveCalculation)]]
class GJEffectManager : cocos2d::CCNode {
    // virtual ~GJEffectManager();
    // GJEffectManager();

    static GJEffectManager* create() = win 0x2537d0;

    TodoReturn activeColorForIndex(int) = imac 0x2c9b90;
    TodoReturn activeOpacityForIndex(int) = imac 0x2c9cf0;
    TodoReturn addAllInheritedColorActions(cocos2d::CCArray*);
    void addCountToItem(int, int);
    TodoReturn addMoveCalculation(CCMoveCNode*, cocos2d::CCPoint, GameObject*);
    TodoReturn calculateBaseActiveColors();
    TodoReturn calculateInheritedColor(int, ColorAction*);
    TodoReturn calculateLightBGColor(cocos2d::ccColor3B);
    TodoReturn checkCollision(int const&, int const&);
    void colorActionChanged(ColorAction*) = imac 0x2caeb0;
    bool colorExists(int) = imac 0x2cae80;
    TodoReturn colorForEffect(cocos2d::ccColor3B, cocos2d::ccHSVValue);
    TodoReturn colorForGroupID(int, cocos2d::ccColor3B const&, bool);
    TodoReturn colorForIndex(int);
    TodoReturn colorForPulseEffect(cocos2d::ccColor3B const&, PulseEffectAction*);
    TodoReturn controlActionsForControlID(int, GJActionCommand);
    TodoReturn controlActionsForTrigger(EffectGameObject*, GJActionCommand);
    int countForItem(int) = win 0x25af40;
    TodoReturn createFollowCommand(float, float, float, int, int, int, int);
    TodoReturn createKeyframeCommand(int, cocos2d::CCArray*, GameObject*, int, int, bool, float, float, float, float, float, float, gd::vector<int> const&);
    TodoReturn createMoveCommand(cocos2d::CCPoint, int, float, int, float, bool, bool, bool, bool, float, float, int, int);
    TodoReturn createPlayerFollowCommand(float, float, int, float, float, int, int, int);
    TodoReturn createRotateCommand(float, float, int, int, int, float, bool, bool, bool, int, int);
    TodoReturn createTransformCommand(double, double, double, double, bool, float, int, int, int, float, bool, bool, int, int);
    TodoReturn getAllColorActions();
    TodoReturn getAllColorSprites();
    ColorAction* getColorAction(int) = win 0x254750, imac 0x2c9a20;
    ColorActionSprite* getColorSprite(int) = win 0x254810, imac 0x2c9be0;
    TodoReturn getLoadedMoveOffset(gd::unordered_map<int, std::pair<double, double>>&);
    TodoReturn getMixedColor(cocos2d::ccColor3B, cocos2d::ccColor3B, float);
    TodoReturn getMoveCommandNode(GroupCommandObject2*);
    TodoReturn getMoveCommandObject();
    TodoReturn getOpacityActionForGroup(int);
    TodoReturn getSaveString() = imac 0x2d8ba0;
    TodoReturn getTempGroupCommand();
    TodoReturn handleObjectCollision(bool, int, int);
    TodoReturn hasActiveDualTouch();
    TodoReturn hasBeenTriggered(int, int) = imac 0x2d5810;
    TodoReturn hasPulseEffectForGroupID(int);
    bool isGroupEnabled(int);
    TodoReturn keyForGroupIDColor(int, cocos2d::ccColor3B const&, bool);
    void loadFromState(EffectManagerState&);
    void objectsCollided(int, int) = imac 0x2cbec0;
    TodoReturn opacityForIndex(int);
    TodoReturn opacityModForGroup(int);
    TodoReturn pauseTimer(int);
    TodoReturn playerButton(bool, bool) = win 0x25ace0;
    void playerDied();
    TodoReturn postCollisionCheck() = win 0x254e30;
    TodoReturn postMoveActions() = win 0x259350;
    TodoReturn preCollisionCheck();
    TodoReturn prepareMoveActions(float, bool) = win 0x257f40;
    TodoReturn processColors() = win 0x253e90, imac 0x2c9d60;
    TodoReturn processCopyColorPulseActions() = imac 0x2ca430;
    TodoReturn processInheritedColors() = imac 0x2ca080;
    TodoReturn processMoveCalculations();
    TodoReturn processPulseActions();
    TodoReturn registerCollisionTrigger(int, int, int, bool, bool, gd::vector<int> const&, int, int);
    TodoReturn registerRotationCommand(GroupCommandObject2*, bool);
    TodoReturn removeAllPulseActions();
    TodoReturn removeColorAction(int);
    TodoReturn removePersistentFromAllItems();
    TodoReturn removePersistentFromAllTimers();
    TodoReturn removeTriggeredID(int, int);
    void reset() = win 0x253bf0, imac 0x2c89d0;
    TodoReturn resetEffects() = win 0x254b70;
    TodoReturn resetMoveActions();
    TodoReturn resetTempGroupCommands(bool);
    TodoReturn resetToggledGroups();
    TodoReturn resetTriggeredIDs();
    void onRewardedVideo(cocos2d::CCObject* sender);
    TodoReturn resumeTimer(int);
    TodoReturn runCountTrigger(int, int, bool, int, bool, gd::vector<int> const&, int, int);
    TodoReturn runDeathTrigger(int, bool, gd::vector<int> const&, int, int);
    TodoReturn runOpacityActionOnGroup(int, float, float, int, int);
    TodoReturn runPulseEffect(int, bool, float, float, float, PulseEffectType, cocos2d::ccColor3B, cocos2d::ccHSVValue, int, bool, bool, bool, bool, int, int);
    TodoReturn runTimerTrigger(int, double, bool, int, gd::vector<int> const&, int, int);
    TodoReturn runTouchTriggerCommand(int, bool, TouchTriggerType, TouchTriggerControl, bool, gd::vector<int> const&, int, int);
    TodoReturn saveCompletedMove(int, double, double);
    void saveToState(EffectManagerState&) = win 0x25c400;
    void setColorAction(ColorAction*, int);
    void setFollowing(int, int, bool);
    void setupFromString(gd::string);
    bool shouldBlend(int) = imac 0x2c9d20;
    TodoReturn spawnGroup(int, float, bool, gd::vector<int> const&, int, int) = win 0x25a800;
    TodoReturn spawnObject(GameObject*, float, gd::vector<int> const&, int, int);
    TodoReturn startTimer(int, double, double, bool, bool, bool, float, bool, int, gd::vector<int> const&, int, int);
    TodoReturn storeTriggeredID(int, int) = win 0x25ab40, imac 0x2d5660;
    TodoReturn timeForItem(int) = win 0x25beb0;
    TodoReturn timerExists(int);
    TodoReturn toggleGroup(int, bool);
    TodoReturn toggleItemPersistent(int, bool);
    TodoReturn toggleTimerPersistent(int, bool);
    TodoReturn transferPersistentItems();
    TodoReturn traverseInheritanceChain(InheritanceNode*);
    TodoReturn tryGetMoveCommandNode(int);
    TodoReturn updateActiveOpacityEffects();
    TodoReturn updateColorAction(ColorAction*);
    void updateColorEffects(float) = imac 0x2cb010;
    void updateColors(cocos2d::ccColor3B, cocos2d::ccColor3B);
    void updateCountForItem(int, int) = win 0x25b000;
    virtual void rewardedVideoFinished();
    void updateEffects(float) = win 0x2549f0, imac 0x2caee0;
    void updateOpacityAction(OpacityEffectAction*);
    void updateOpacityEffects(float);
    void updatePulseEffects(float) = win 0x259d10, imac 0x2cb1e0;
    TodoReturn updateSpawnTriggers(float) = win 0x25a8f0;
    TodoReturn updateTimer(int, double);
    TodoReturn updateTimers(float, float) = win 0x25b8c0;
    TodoReturn wasFollowing(int, int);
    TodoReturn wouldCreateLoop(InheritanceNode*, int);

    virtual bool init();

    TriggerEffectDelegate* m_triggerEffectDelegate;
    cocos2d::CCDictionary* m_unkObject148;
    cocos2d::CCDictionary* m_unkDict150;
    gd::vector<PulseEffectAction> m_pulseEffectVector;
    gd::unordered_map<int, gd::vector<PulseEffectAction>> m_pulseEffectMap;
    gd::unordered_map<int, OpacityEffectAction> m_opacityEffectMap;
    gd::vector<TouchToggleAction> m_unkVector1e0;
    gd::unordered_map<int, gd::vector<CountTriggerAction>> m_countTriggerActions;
    gd::vector<CollisionTriggerAction> m_unkVector230;
    gd::vector<ToggleTriggerAction> m_unkVector248;
    cocos2d::CCDictionary* m_colorActionDict;
    cocos2d::CCDictionary* m_unkDict268;
    gd::vector<InheritanceNode*> m_unkVector270;
    gd::unordered_map<int, bool> m_unkMap288;
    gd::vector<ColorAction*> m_unkVector2c0;
    gd::vector<ColorActionSprite*> m_unkVector2d8;
    gd::vector<bool> m_unkVector2f0;
    gd::unordered_map<int, int> m_itemIDs;
    gd::unordered_map<int, int> m_unkMap350;
    gd::unordered_set<int> m_unkMap388;
    gd::unordered_map<int, TimerItem> m_unkMap3c0;
    gd::unordered_map<int, std::vector<TimerTriggerAction>> m_unkMap3f8;
    cocos2d::CCArray* m_unkArray430;
    gd::vector<bool> m_unkVector438;
    gd::unordered_set<int> m_unkMap460;
    gd::map<int, int> m_unkMap498;
    gd::unordered_set<int> m_unkMap4c8;
    gd::vector<SpawnTriggerAction> m_nukVector500;
    gd::vector<GroupCommandObject2*> m_unkVector518;
    gd::vector<GroupCommandObject2*> m_unkVector530;
    gd::vector<CCObject*> m_unkVector548;
    gd::vector<GroupCommandObject2> m_unkVector560;
    gd::unordered_map<int, std::pair<double, double>> m_unkMap578;
    gd::vector<GroupCommandObject2*> m_unkVector5b0;
    gd::unordered_map<int, gd::vector<GroupCommandObject2*>> m_unkMap5c8;
    gd::vector<GroupCommandObject2*> m_unkVector600;
    gd::unordered_map<int, CCMoveCNode*> m_unkMap618;
    gd::unordered_map<int, CCMoveCNode*> m_unkMap650;
    gd::unordered_map<int, CCMoveCNode*> m_unkMap688;
    gd::vector<CCMoveCNode*> m_unkVector6c0;
    gd::vector<CCMoveCNode*> m_unkVector6d8;
    gd::vector<CCMoveCNode*> m_unkVector6f0;
    gd::vector<DynamicMoveCalculation> m_unkVector708;
    gd::map<std::pair<int, int>, gd::vector<GroupCommandObject2*>> m_unkMap770;
    float m_unk780;
    float m_unk784;
    float m_unk788;
    float m_unk78C;
    float m_unk790;
    float m_unk794;
    bool m_unk798;
}

[[link(android)]]
class GJFlyGroundLayer : GJGroundLayer {
    // virtual ~GJFlyGroundLayer();

    static GJFlyGroundLayer* create();

    virtual bool init();
}

[[link(android)]]
class GJFollowCommandLayer : SetupTriggerPopup {
    // virtual ~GJFollowCommandLayer();

    static GJFollowCommandLayer* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onUpdateGroupID(cocos2d::CCObject* sender);
    void onUpdateGroupID2(cocos2d::CCObject* sender);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn sliderXModChanged(cocos2d::CCObject*);
    TodoReturn sliderYModChanged(cocos2d::CCObject*);
    TodoReturn updateDuration();
    TodoReturn updateDurLabel(bool);
    TodoReturn updateTargetGroupID();
    TodoReturn updateTargetGroupID2();
    TodoReturn updateTextInputLabel();
    TodoReturn updateTextInputLabel2();
    TodoReturn updateXMod();
    TodoReturn updateXModLabel();
    TodoReturn updateYMod();
    TodoReturn updateYModLabel();

    virtual void determineStartValues() = imac 0x2c3210;
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*) = win 0x26a730, imac 0x2c3820;
}

[[link(android)]]
class GJFriendRequest : cocos2d::CCNode {
    // virtual ~GJFriendRequest();

    static GJFriendRequest* create();
    static GJFriendRequest* create(cocos2d::CCDictionary*);

    virtual bool init();
}

[[link(android)]]
class GJGameLevel : cocos2d::CCNode {
    // virtual ~GJGameLevel();
    //GJGameLevel() = ios 0xb40a8;

    static GJGameLevel* create() = win 0x169b40, imac 0x515c60;
    static GJGameLevel* create(cocos2d::CCDictionary*, bool) = win 0x1683e0;
    /*inline static GJGameLevel* createWithCoder(DS_Dictionary* dict) {
		//inlined on windows
		auto level = GJGameLevel::create();
		level->dataLoaded(dict);
		return level;
	}*/

    bool areCoinsVerified();
    void copyLevelInfo(GJGameLevel*) = win 0x16aaa0;
    void dataLoaded(DS_Dictionary*) = win 0x16b150;
    int demonIconForDifficulty(DemonDifficultyType) = imac 0x5482d0;
    TodoReturn generateSettingsString();
    gd::string getAudioFileName() = win 0x16a3f0;
    int getAverageDifficulty() = win 0x16a230, imac 0x544c00;
    char const* getCoinKey(int coinNumber) = win 0x16a2a0, imac 0x535230;
    TodoReturn getLastBuildPageForTab(int);
    const char* getLengthKey(int length, bool platformer) = imac 0x544b20;
    TodoReturn getListSnapshot();
    TodoReturn getNormalPercent();
    TodoReturn getSongName();
    gd::string getUnpackedLevelDescription();
    void handleStatsConflict(GJGameLevel*) = win 0x16cc80;
    inline bool isPlatformer() {
    	return m_levelLength == 5;
    }
    static gd::string lengthKeyToString(int key) = win 0x16a0d0, imac 0x544b60;
    TodoReturn levelWasAltered() = imac 0x5444d0;
    TodoReturn levelWasSubmitted();
    TodoReturn parseSettingsString(gd::string);
    void saveNewScore(int, int);
    void savePercentage(int percent, bool isPracticeMode, int clicks, int attempts, bool isChkValid) = win 0x169db0;
    TodoReturn scoreStringToVector(gd::string&, gd::vector<int>&);
    TodoReturn scoreVectorToString(gd::vector<int>&, int);
    void setAccountID(int);
    void setAttempts(int);
    void setAttemptTime(int);
    void setClicks(int);
    void setCoinsVerified(int);
    void setDailyID(int);
    void setDemon(int);
    void setJumps(int);
    void setLastBuildPageForTab(int, int);
    void setLevelID(int);
    void setNewNormalPercent(int);
    void setNewNormalPercent2(int);
    void setNormalPercent(int);
    void setObjectCount(int);
    void setOriginalLevel(int);
    void setPassword(int);
    void setStars(int);
    TodoReturn storeNewLocalScore(int, int);
    TodoReturn unverifyCoins();

    virtual void encodeWithCoder(DS_Dictionary*) = win 0x16c090;
    virtual bool canEncode();
    virtual bool init() = win 0x169ba0, imac 0x5442b0;

    cocos2d::CCDictionary* m_lastBuildSave;
    geode::SeedValueRSV m_levelID;
    gd::string m_levelName;
    gd::string m_levelDesc;
    gd::string m_levelString;
    gd::string m_creatorName;
    gd::string m_recordString;
    gd::string m_uploadDate;
    gd::string m_updateDate;
    gd::string m_unkString1;
    gd::string m_unkString2;

    cocos2d::CCPoint m_unkPoint;
    geode::SeedValueRSV m_userID;
    geode::SeedValueRSV m_accountID;
    GJDifficulty m_difficulty;
    int m_audioTrack;
    int m_songID;
    int m_levelRev;
    bool m_unlisted;
    bool m_friendsOnly;
    geode::SeedValueRSV m_objectCount;
    int m_levelIndex;
    int m_ratings;
    int m_ratingsSum;
    int m_downloads;
    bool m_isEditable;
    bool m_gauntletLevel;
    bool m_gauntletLevel2;
    int m_workingTime;
    int m_workingTime2;
    bool m_lowDetailMode;
    bool m_lowDetailModeToggled;
    bool m_disableShakeToggled;
    bool m_selected;
    bool m_localOrSaved;
    bool m_disableShake;
    geode::SeedValueRS m_isVerified;
    bool m_isVerifiedRaw;
    bool m_isUploaded;
    bool m_hasBeenModified;
    int m_levelVersion;
    int m_gameVersion;

    geode::SeedValueRSV m_attempts;
    geode::SeedValueRSV m_jumps;
    geode::SeedValueRSV m_clicks;
    geode::SeedValueRSV m_attemptTime;
    int m_chk;
    bool m_isChkValid;
    bool m_isCompletionLegitimate;
    geode::SeedValueVSR m_normalPercent;
    geode::SeedValueRSV m_orbCompletion;
    geode::SeedValueRSV m_newNormalPercent2;
    int m_practicePercent;
    int m_likes;
    int m_dislikes;
    int m_levelLength;
    int m_featured;
    int m_isEpic;
    bool m_levelFavorited;
    int m_levelFolder;
    geode::SeedValueRSV m_dailyID;
    geode::SeedValueRSV m_demon;
    int m_demonDifficulty;
    geode::SeedValueRSV m_stars;
    bool m_autoLevel;
    int m_coins;
    geode::SeedValueRSV m_coinsVerified;
    geode::SeedValueRS m_password;
    geode::SeedValueRSV m_originalLevel;
    bool m_twoPlayerMode;
    int m_failedPasswordAttempts;
    geode::SeedValueRSV m_firstCoinVerified;
    geode::SeedValueRSV m_secondCoinVerified;
    geode::SeedValueRSV m_thirdCoinVerified;
    int m_starsRequested;
    bool m_showedSongWarning;
    int m_starRatings;
    int m_starRatingsSum;
    int m_maxStarRatings;
    int m_minStarRatings;
    int m_demonVotes;
    int m_rateStars;
    int m_rateFeature;
    gd::string m_rateUser;
    bool m_dontSave;
    bool m_levelNotDownloaded;
    int m_requiredCoins;
    bool m_isUnlocked;
    cocos2d::CCPoint m_lastCameraPos;
    float m_fastEditorZoom;
    int m_lastBuildTab;
    int m_lastBuildPage;
    int m_lastBuildGroupID;
    GJLevelType m_levelType;
    int m_M_ID;
    gd::string m_tempName;
    gd::string m_capacityString;
    bool m_highObjectsEnabled;
    bool m_unlimitedObjectsEnabled;
    gd::string m_personalBests;
    int m_timestamp;
    int m_listPosition;
    gd::string m_songIDs;
    gd::string m_sfxIDs;
    int m_54;
    int m_bestTime;
    int m_bestPoints;
    int m_k111;
    gd::string m_unkString3;
    gd::string m_unkString4;
}

[[link(android)]]
class GJGameLoadingLayer : cocos2d::CCLayer {
    // virtual ~GJGameLoadingLayer();

    static GJGameLoadingLayer* create(GJGameLevel* level, bool editor) = imac 0x153fe0;

    void gameLayerDidUnload();
    bool init(GJGameLevel* level, bool editor) = imac 0x154340;
    void loadLevel() = win 0x242960, imac 0x154440;
    static GJGameLoadingLayer* transitionToLoadingLayer(GJGameLevel* level, bool editor) = win 0x242770;

    virtual void onEnter();
    virtual void onEnterTransitionDidFinish();

    GJGameLevel* m_level;
    bool m_editor;
}

[[link(android), depends(EventTriggerInstance), depends(SongChannelState), depends(DynamicObjectAction), depends(AdvancedFollowInstance), depends(EnterEffectInstance), depends(GameObjectPhysics), depends(GJValueTween), depends(SFXTriggerInstance), depends(SFXTriggerState), depends(SongTriggerState), depends(EnterEffectAnimValue)]]
class GJGameState {
    // ~GJGameState();
    // GJGameState();

    TodoReturn controlTweenAction(int, int, GJActionCommand);
    TodoReturn getGameObjectPhysics(GameObject*);
    TodoReturn processStateTriggers() = win 0x200170;
    void stopTweenAction(int) = win 0x2443c0;
    TodoReturn tweenValue(float, float, int, float, int, float, int, int) = win 0x200020;
    TodoReturn updateTweenAction(float, int);
    TodoReturn updateTweenActions(float);

    float m_cameraZoom;
    float m_targetCameraZoom;
    cocos2d::CCPoint m_cameraOffset;
    cocos2d::CCPoint m_unkPoint1;
    cocos2d::CCPoint m_unkPoint2;
    cocos2d::CCPoint m_unkPoint3;
    cocos2d::CCPoint m_unkPoint4;
    cocos2d::CCPoint m_unkPoint5;
    cocos2d::CCPoint m_unkPoint6;
    cocos2d::CCPoint m_unkPoint7;
    cocos2d::CCPoint m_unkPoint8;
    cocos2d::CCPoint m_unkPoint9;
    cocos2d::CCPoint m_unkPoint10;
    cocos2d::CCPoint m_unkPoint11;
    cocos2d::CCPoint m_unkPoint12;
    cocos2d::CCPoint m_unkPoint13;
    cocos2d::CCPoint m_unkPoint14;
    cocos2d::CCPoint m_unkPoint15;
    cocos2d::CCPoint m_unkPoint16;
    cocos2d::CCPoint m_unkPoint17;
    cocos2d::CCPoint m_unkPoint18;
    cocos2d::CCPoint m_unkPoint19;
    cocos2d::CCPoint m_unkPoint20;
    cocos2d::CCPoint m_unkPoint21;
    cocos2d::CCPoint m_unkPoint22;
    cocos2d::CCPoint m_unkPoint23;
    cocos2d::CCPoint m_unkPoint24;
    cocos2d::CCPoint m_unkPoint25;
    cocos2d::CCPoint m_unkPoint26;
    cocos2d::CCPoint m_unkPoint27;
    cocos2d::CCPoint m_unkPoint28;
    cocos2d::CCPoint m_unkPoint29;
    bool m_unkBool1;
    int m_unkInt1;
    bool m_unkBool2;
    int m_unkInt2;
    bool m_unkBool3;
    cocos2d::CCPoint m_unkPoint30;
    float m_middleGroundOffsetY;
    int m_unkInt3;
    int m_unkInt4;
    bool m_unkBool4;
    bool m_unkBool5;
    float m_unkFloat2;
    float m_unkFloat3;
    int m_unkInt5;
    int m_unkInt6;
    int m_unkInt7;
    int m_unkInt8;
    int m_unkInt9;
    int m_unkInt10;
    int m_unkInt11;
    float m_unkFloat4;
    unsigned int m_unkUint1;
    float m_portalY;
    bool m_unkBool6;
    bool m_gravityRelated;
    int m_unkInt12;
    int m_unkInt13;
    int m_unkInt14;
    int m_unkInt15;
    bool m_unkBool7;
    bool m_unkBool8;
    bool m_unkBool9;
    float m_unkFloat5;
    float m_unkFloat6;
    float m_unkFloat7;
    float m_unkFloat8;
    float m_cameraAngle;
    float m_targetCameraAngle;
    bool m_unk184;
    float m_timeWarp;
    float m_timeWarpRelated;
    int m_currentChannel;
    int m_unkInt17;
    gd::unordered_map<int, int> m_spawnChannelRelated0;
    gd::unordered_map<int, bool> m_spawnChannelRelated1;
    double m_totalTime;
    double m_levelTime;
    double m_unkDouble3;
    unsigned int m_unkUint2;
    unsigned int m_unkUint3;
    int m_currentProgress;
    unsigned int m_unkUint4;
    unsigned int m_unkUint5;
    unsigned int m_unkUint6;
    unsigned int m_unkUint7;
    GameObject* m_unkGameObjPtr1;
    GameObject* m_unkGameObjPtr2;
    cocos2d::CCPoint m_cameraPosition;
    bool m_unkBool10;
    float m_levelFlipping;
    bool m_unkBool11;
    bool m_unkBool12;
    bool m_isDualMode;
    float m_unkFloat9;
    gd::unordered_map<int, GJValueTween> m_tweenActions;
    int m_cameraEdgeValue0;
    int m_cameraEdgeValue1;
    int m_cameraEdgeValue2;
    int m_cameraEdgeValue3;
    gd::unordered_map<int, GameObjectPhysics> m_gameObjectPhysics;
    gd::vector<float> m_unkVecFloat1;
    unsigned int m_unkUint10;
    unsigned int m_unkUint11;
    unsigned int m_unkUint12;
    cocos2d::CCPoint m_unkPoint31;
    float m_unkFloat10;
    unsigned int m_timeModRelated;
    bool m_timeModRelated2;
    gd::map<std::pair<int, int>, int> m_unkMapPairIntIntInt;
    unsigned int m_unkUint13;
    cocos2d::CCPoint m_unkPoint32;
    cocos2d::CCPoint m_unkPoint33;
    bool m_unkBool20;
    bool m_unkBool21;
    bool m_unkBool22;
    unsigned int m_unkUint14;
    bool m_unkBool26;
    bool m_cameraShakeEnabled;
    float m_cameraShakeFactor;
    unsigned int m_unkUint15;
    unsigned int m_unkUint16;
    uint64_t m_unkUint64_1;
    cocos2d::CCPoint m_unkPoint34;
    unsigned int dualRelated;
    gd::unordered_map<int, EnhancedGameObject*> m_stateObjects;
    gd::map<std::pair<GJGameEvent, int>, gd::vector<EventTriggerInstance>> m_unkMapPairGJGameEventIntVectorEventTriggerInstance;
    gd::map<std::pair<GJGameEvent, int>, int> m_unkMapPairGJGameEventIntInt;
    gd::unordered_map<int, std::vector<EnterEffectInstance>> m_unorderedMapEnterEffectInstanceVectors1;
    gd::unordered_map<int, std::vector<EnterEffectInstance>> m_unorderedMapEnterEffectInstanceVectors2;
    gd::vector<int> m_unkVecInt1;
    gd::vector<int> m_unkVecInt2;
    gd::vector<EnterEffectInstance> m_enterEffectInstances1;
    gd::vector<EnterEffectInstance> m_enterEffectInstances2;
    gd::vector<EnterEffectInstance> m_enterEffectInstances3;
    gd::vector<EnterEffectInstance> m_enterEffectInstances4;
    gd::vector<EnterEffectInstance> m_enterEffectInstances5;
    gd::unordered_set<int> m_unkUnorderedSet1;
    bool m_unkBool27;
    gd::vector<AdvancedFollowInstance> m_advanceFollowInstances;
    gd::vector<DynamicObjectAction> m_dynamicObjActions1;
    gd::vector<DynamicObjectAction> m_dynamicObjActions2;
    bool m_unkBool28;
    bool m_unkBool29;
    unsigned int m_unkUint17;
    gd::unordered_map<int, std::vector<int>> m_unkUMap8;
    gd::map<std::pair<int,int>, SFXTriggerInstance> m_proximityVolumeRelated;
    gd::unordered_map<int, SongChannelState> m_songChannelStates;
    gd::unordered_map<int, std::vector<SongTriggerState>> m_songTriggerStateVectors;
    gd::vector<SFXTriggerState> m_sfxTriggerStates;
    bool m_unkBool30;
    unsigned int m_unkUint18;
    int m_ground;
    unsigned int m_unkUint19;
    bool m_unkBool31;
    unsigned int m_unkUint20;
    bool m_unkBool32;
    unsigned int m_pauseCounter;
    unsigned int m_pauseBufferTimer;
}

[[link(android)]]
class GJGarageLayer : cocos2d::CCLayer, TextInputDelegate, FLAlertLayerProtocol, GameRateDelegate, ListButtonBarDelegate, DialogDelegate, CharacterColorDelegate, RewardedVideoDelegate {
    // virtual ~GJGarageLayer();
    GJGarageLayer() {
    	m_usernameInput = nullptr;
    	m_playerObject = nullptr;
    	m_tabButtons = nullptr;
    	m_pageButtons = nullptr;
    	m_unknown = nullptr;
    	m_supporter = nullptr;
    	bool m_hasClosed = false;
    	m_iconType = IconType::Cube;
    	m_iconPages = {};
    	m_cursor1 = nullptr;
    	m_cursor2 = nullptr;
    	m_currentIcon = nullptr;
    	m_iconSelection = nullptr;
    	m_leftArrow = nullptr;
    	m_rightArrow = nullptr;
    	m_navDotMenu = nullptr;
    	m_iconID = 0;
    	m_selectedIconType = IconType::Cube;
    	m_videoPlaying = false;
    }

    gd::string achievementForUnlock(int, UnlockType);
    gd::string descriptionForUnlock(int, UnlockType) = win 0x270910;
    cocos2d::CCArray* getItems(IconType) = win 0x26ed30;
    cocos2d::CCArray* getItems(int, int, IconType, int) = imac 0x359c80;
    gd::string getLockFrame(int, UnlockType);
    static GJGarageLayer* node() {
    	auto ret = new GJGarageLayer();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    void onArrow(cocos2d::CCObject* sender) = win 0x26e470, imac 0x358ca0;
    void onBack(cocos2d::CCObject* sender) = win 0x271630, imac 0x358100;
    void onInfo(cocos2d::CCObject* sender) = win 0x26d070;
    void onNavigate(cocos2d::CCObject* sender) = win 0x26e570, imac 0x359590;
    void onPaint(cocos2d::CCObject* sender) = win 0x271450;
    void onSelect(cocos2d::CCObject* sender) = win 0x26f770, imac 0x35a0a0;
    void onSelectTab(cocos2d::CCObject* sender) = imac 0x358c70;
    void onShards(cocos2d::CCObject* sender) = win 0x271300;
    void onShop(cocos2d::CCObject* sender);
    void onSpecial(cocos2d::CCObject* sender);
    void onToggleItem(cocos2d::CCObject* sender) = win 0x26fe10, imac 0x35a900;
    void playRainbowEffect() = win 0x271110, imac 0x35acf0;
    void playShadowEffect();
    static cocos2d::CCScene* scene() = win 0x26b490;
    void selectTab(IconType) = win 0x26e5d0, imac 0x358e00;
    void setupIconSelect() = win 0x26d810;
    void setupPage(int, IconType) = win 0x26e690;
    void setupSpecialPage() = imac 0x3595c0;
    void showUnlockPopupNew(int, UnlockType);
    gd::string titleForUnlock(int, UnlockType);
    void toggleGlow();
    void updatePlayerColors() = win 0x270080;
    void updatePlayerName(char const*);

    virtual bool init() = win 0x26b650;
    virtual void keyBackClicked() = win 0x2717d0;
    virtual void textInputOpened(CCTextInputNode*) = win 0x26d270, imac 0x358920;
    virtual void textInputClosed(CCTextInputNode*) = win 0x26d460;
    virtual void textChanged(CCTextInputNode*) = win 0xc3060;
    virtual void listButtonBarSwitchedPage(ListButtonBar*, int);
    virtual void showUnlockPopup(int, UnlockType) = win 0x270200;
    virtual void updateRate() = win 0x270ed0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x270aa0, imac 0x35bbd0;
    virtual void dialogClosed(DialogLayer*) = win 0x270d00;
    virtual void playerColorChanged() = win 0x270050, imac 0x35af30;
    virtual void rewardedVideoFinished();

    CCTextInputNode* m_usernameInput;
    SimplePlayer* m_playerObject;
    cocos2d::CCArray* m_tabButtons;
    cocos2d::CCArray* m_pageButtons;
    cocos2d::CCNode* m_unknown;
    cocos2d::CCSprite* m_supporter;
    bool m_hasClosed;
    IconType m_iconType;
    gd::map<IconType, int> m_iconPages;
    cocos2d::CCSprite* m_cursor1;
    cocos2d::CCSprite* m_cursor2;
    CCMenuItemSpriteExtra* m_currentIcon;
    ListButtonBar* m_iconSelection;
    CCMenuItemSpriteExtra* m_leftArrow;
    CCMenuItemSpriteExtra* m_rightArrow;
    cocos2d::CCMenu* m_navDotMenu;
    int m_iconID;
    IconType m_selectedIconType;
    bool m_videoPlaying;
}

[[link(android)]]
class GJGradientLayer : cocos2d::CCLayerGradient {
    // virtual ~GJGradientLayer();

    static GJGradientLayer* create();

    virtual bool init() = imac 0x153e50;
}

[[link(android)]]
class GJGroundLayer : cocos2d::CCLayer {
    // virtual ~GJGroundLayer();

    static GJGroundLayer* create(int, int) = win 0x276750, imac 0x5d1ae0;

    void createLine(int) = win 0x277000;
    TodoReturn deactivateGround();
    TodoReturn fadeInFinished();
    TodoReturn getGroundY();
    TodoReturn hideShadows();
    bool init(int, int) = win 0x2767d0;
    void loadGroundSprites(int, bool) = win 0x276d40;
    void positionGround(float) = imac 0x5d2c30;
    TodoReturn scaleGround(float) = win 0x2771f0, imac 0x5d26d0;
    void toggleVisible01(bool);
    void toggleVisible02(bool);
    void updateGround01Color(cocos2d::ccColor3B);
    void updateGround02Color(cocos2d::ccColor3B);
    TodoReturn updateGroundPos(cocos2d::CCPoint);
    TodoReturn updateGroundWidth(bool);
    void updateLineBlend(bool) = imac 0x5d29f0;
    TodoReturn updateShadows() = win 0x277430, imac 0x5d2960;
    TodoReturn updateShadowXPos(float, float) = win 0x2774d0, imac 0x5d2b30;

    virtual void draw() {}
    virtual void showGround();
    virtual TodoReturn fadeInGround(float) = win 0x2773b0, imac 0x5d2a50;
    virtual TodoReturn fadeOutGround(float);
}

[[link(android)]]
class GJHttpResult : cocos2d::CCNode {
    // virtual ~GJHttpResult();

    static GJHttpResult* create(bool, gd::string, gd::string, GJHttpType);

    bool init(bool, gd::string, gd::string, GJHttpType);
}

[[link(android)]]
class GJItemIcon : cocos2d::CCSprite {
    // virtual ~GJItemIcon();
    GJItemIcon() {}

    static GJItemIcon* create(UnlockType p0, int p1, cocos2d::ccColor3B p2, cocos2d::ccColor3B p3, bool p4, bool p5, bool p6, cocos2d::ccColor3B p7) {
    	auto ret = new GJItemIcon();
    	if (ret->init(p0, p1, p2, p3, p4, p5, p6, p7)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
     	}
    void changeToLockedState(float) = win 0x273b90, imac 0x35a790;
    static GJItemIcon* createBrowserItem(UnlockType unlockType, int itemID) = win 0x272f50, imac 0x35a040;
    static GJItemIcon* createStoreItem(UnlockType, int, bool, cocos2d::ccColor3B) = win 0x272e20, imac 0x35d150;
    void darkenStoreItem(cocos2d::ccColor3B) = win 0x2738a0, imac 0x35d9a0;
    void darkenStoreItem(ShopType) = win 0x273820;
    bool init(UnlockType, int, cocos2d::ccColor3B, cocos2d::ccColor3B, bool, bool, bool, cocos2d::ccColor3B) = win 0x273070;
    static float scaleForType(UnlockType) = win 0x273c70, imac 0x35a070;
    void toggleEnabledState(bool) = win 0x273ad0;
    static cocos2d::ccColor3B unlockedColorForType(int) = imac 0x35d940;

    virtual void setOpacity(unsigned char) = win 0x273780;

    SimplePlayer* m_player;
    int m_iconRequestID;
    cocos2d::CCSize m_playerSize;
    bool m_isIcon;
    int m_unlockID;
    UnlockType m_unlockType;
}

[[link(android)]]
class GJLevelList : cocos2d::CCNode {
    // virtual ~GJLevelList();

    static GJLevelList* create() = win 0x173760, imac 0x516ad0;
    static GJLevelList* create(cocos2d::CCDictionary*) = win 0x172e70;

    void addLevelToList(GJGameLevel* level) = win 0x173ee0;
    TodoReturn completedLevels() = imac 0x54bd80;
    TodoReturn createWithCoder(DS_Dictionary*);
    void dataLoaded(DS_Dictionary*) = win 0x174cd0, imac 0x54c270;
    TodoReturn duplicateListLevels(GJLevelList*);
    TodoReturn frameForListDifficulty(int, DifficultyIconType) = imac 0x54c830;
    cocos2d::CCArray* getListLevelsArray(cocos2d::CCArray*) = win 0x174160;
    gd::string getUnpackedDescription();
    void handleStatsConflict(GJLevelList*) = imac 0x54a820;
    bool hasMatchingLevels(GJLevelList*) = win 0x173970, imac 0x54a840;
    TodoReturn orderForLevel(int);
    TodoReturn parseListLevels(gd::string) = win 0x173c40;
    TodoReturn removeLevelFromList(int);
    void reorderLevel(int levelID, int newPosition) = win 0x174070;
    TodoReturn reorderLevelStep(int, bool);
    void showListInfo() = win 0x174900, imac 0x54bdd0;
    TodoReturn totalLevels() = imac 0x54bd60;
    TodoReturn updateLevelsString();

    virtual void encodeWithCoder(DS_Dictionary*) = win 0x174ff0, imac 0x54c5b0;
    virtual bool canEncode();
    virtual bool init();

    gd::vector<int> m_levels;
    int m_listID;
    int m_listVersion;
    int m_downloads;
    int m_likes;
    int m_difficulty;
    int m_accountID;
    int m_folder;
    int m_listRevision;
    int m_listOrder;
    int m_original;
    int m_diamonds;
    int m_levelsToClaim;
    bool m_isEditable;
    bool m_unlisted;
    bool m_friendsOnly;
    bool m_uploaded;
    bool m_favorite;
    bool m_featured;
    bool m_k100;
    gd::string m_creatorName;
    gd::string m_listName;
    gd::string m_unkString;
    gd::string m_levelsString;
    gd::string m_listDesc;
    int m_uploadDate;
    int m_updateDate;
    cocos2d::CCDictionary* m_levelsDict;
    GJLevelType m_listType;
    int m_M_ID;
}

[[link(android)]]
class GJLevelScoreCell : TableViewCell {
    // virtual ~GJLevelScoreCell();
    GJLevelScoreCell(char const*, float, float);

    void loadFromScore(GJUserScore*) = win 0xb93d0, imac 0x238660;
    void onViewProfile(cocos2d::CCObject* sender);
    void updateBGColor(int);

    virtual bool init();
    virtual void draw();
}

[[link(android)]]
class GJListLayer : cocos2d::CCLayerColor {
    // virtual ~GJListLayer();

    static GJListLayer* create(BoomListView*, char const*, cocos2d::ccColor4B, float, float, int) = win 0x277d50, imac 0x5b9180;

    bool init(BoomListView*, char const*, cocos2d::ccColor4B, float, float, int) = win 0x277e80, imac 0x5b9290;

    BoomListView* m_listView;
}

[[link(android)]]
class GJLocalLevelScoreCell : TableViewCell {
    // virtual ~GJLocalLevelScoreCell();
    GJLocalLevelScoreCell(char const*, float, float);

    void loadFromScore(GJLocalScore*) = win 0xb8fd0, imac 0x239040;
    void updateBGColor(int);

    virtual bool init();
    virtual void draw();
}

[[link(android)]]
class GJLocalScore : cocos2d::CCObject {
    // virtual ~GJLocalScore();

    static GJLocalScore* create(int, int) = imac 0x548a60;

    bool init(int, int);
}

[[link(android)]]
class GJMapObject : cocos2d::CCNode {
    // virtual ~GJMapObject();

    static GJMapObject* create(cocos2d::CCNode*);

    TodoReturn createMonster(int);
    bool init(cocos2d::CCNode*);
    TodoReturn monsterIdle();
    TodoReturn monsterJump();
    TodoReturn moveFinished();
    TodoReturn moveMonster();
    TodoReturn moveMonster(cocos2d::CCPoint, float);
    TodoReturn playerJump();
    void setObjectOrigin(cocos2d::CCPoint, float);
    TodoReturn startMonsterJumpLoop();
    TodoReturn startPlayerJumpLoop();
    TodoReturn touchMonster();
    TodoReturn updateShadow(float, float, cocos2d::CCPoint);
}

[[link(android)]]
class GJMapPack : cocos2d::CCNode {
    // virtual ~GJMapPack();
    	GJMapPack() {
    	m_levels = nullptr;
    	m_packID = 0;
    	m_difficulty = GJDifficulty::Auto;
    	m_stars = 0;
    	m_coins = 0;
    	m_packName = "";
    	m_levelStrings = "";
    	m_MId = 0;
    	m_isGauntlet = false;
    }

    static GJMapPack* create() {
    	auto ret = new GJMapPack();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static GJMapPack* create(cocos2d::CCDictionary*) = win 0x16d210;

    int completedMaps() = imac 0x548950;
    bool hasCompletedMapPack() {
    	auto total = this->totalMaps();
    	if (total > 0) return this->completedMaps() >= total;
    	else return 0;
    }
    void parsePackColors(gd::string, gd::string) = win 0x16ddd0;
    void parsePackLevels(gd::string) = imac 0x548500;
    int totalMaps() {
    	if (this->m_levels) {
    		return this->m_levels->count();
    	}

    	return 0;
    }

    virtual bool init() = win 0x16dd70, imac 0x5488d0;

    cocos2d::CCArray* m_levels;
    int m_packID;
    GJDifficulty m_difficulty;
    int m_stars;
    int m_coins;
    gd::string m_packName;
    gd::string m_levelStrings;
    cocos2d::ccColor3B m_textColour;
    cocos2d::ccColor3B m_barColour;
    int m_MId;
    bool m_isGauntlet;
}

[[link(android)]]
class GJMessageCell : TableViewCell, FLAlertLayerProtocol, UploadPopupDelegate, UploadActionDelegate {
    // virtual ~GJMessageCell();
    GJMessageCell(char const*, float, float);

    void loadFromMessage(GJUserMessage*) = win 0xbc7e0;
    TodoReturn markAsRead();
    void onDeleteMessage(cocos2d::CCObject* sender);
    void onToggle(cocos2d::CCObject* sender);
    void onViewMessage(cocos2d::CCObject* sender);
    void onViewProfile(cocos2d::CCObject* sender);
    void updateBGColor(int);
    TodoReturn updateToggle();

    virtual bool init() = win 0xbb620;
    virtual void draw();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xbd440, imac 0x246190;
    virtual void uploadActionFinished(int, int) = win 0xbd5e0;
    virtual void uploadActionFailed(int, int);
    virtual void onClosePopup(UploadActionPopup*);
}

[[link(android)]]
class GJMessagePopup : FLAlertLayer, UploadActionDelegate, UploadPopupDelegate, FLAlertLayerProtocol, DownloadMessageDelegate {
    // virtual ~GJMessagePopup();

    static GJMessagePopup* create(GJUserMessage*);

    void blockUser();
    bool init(GJUserMessage*);
    void loadFromGJMessage(GJUserMessage*) = win 0x290640;
    void onBlock(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    void onRemove(cocos2d::CCObject* sender);
    void onReply(cocos2d::CCObject* sender);

    virtual void keyBackClicked();
    virtual TodoReturn downloadMessageFinished(GJUserMessage*) = win 0x291390, imac 0x294540;
    virtual TodoReturn downloadMessageFailed(int) = win 0x2913e0, imac 0x294600;
    virtual void uploadActionFinished(int, int) = win 0x291420, imac 0x2946a0;
    virtual void uploadActionFailed(int, int) = win 0x2915b0, imac 0x294870;
    virtual void onClosePopup(UploadActionPopup*) = win 0x291680, imac 0x2949c0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x291700, imac 0x294ac0;
}

[[link(android)]]
class GJMGLayer : cocos2d::CCLayer {
    // virtual ~GJMGLayer();

    static GJMGLayer* create(int) = imac 0x5d2dc0;

    TodoReturn deactivateGround();
    bool init(int);
    void loadGroundSprites(int, bool);
    TodoReturn scaleGround(float);
    TodoReturn toggleVisible01(bool);
    TodoReturn toggleVisible02(bool);
    TodoReturn updateGroundColor(cocos2d::ccColor3B, bool);
    TodoReturn updateGroundOpacity(unsigned char, bool) = imac 0x5d3680;
    TodoReturn updateGroundPos(cocos2d::CCPoint);
    TodoReturn updateGroundWidth(bool);
    void updateMG01Blend(bool);
    void updateMG02Blend(bool);

    virtual void draw() {}
    virtual void showGround();
}

[[link(android)]]
class GJMoreGamesLayer : GJDropDownLayer {
    // virtual ~GJMoreGamesLayer();
    // GJMoreGamesLayer();

    static GJMoreGamesLayer* create() = win 0x2784f0;

    TodoReturn getMoreGamesList();

    virtual void customSetup();
}

[[link(android)]]
class GJMPDelegate {
    virtual TodoReturn joinLobbyFinished(int);
    virtual TodoReturn joinLobbyFailed(int, GJMPErrorCode);
    virtual TodoReturn didUploadMPComment(int);
    virtual TodoReturn updateComments();
}

[[link(android)]]
class GJMultiplayerManager : cocos2d::CCNode {
    // virtual ~GJMultiplayerManager();

    static GJMultiplayerManager* sharedState() = win 0x27aba0, imac 0x641c60;

    void addComment(gd::string, int);
    void addDLToActive(char const* tag, cocos2d::CCObject* obj);
    void addDLToActive(char const* tag);
    TodoReturn createAndAddComment(gd::string, int);
    void dataLoaded(DS_Dictionary*);
    void encodeDataTo(DS_Dictionary*);
    TodoReturn exitLobby(int);
    void firstSetup();
    TodoReturn getBasePostString();
    cocos2d::CCObject* getDLObject(char const*);
    TodoReturn getLastCommentIDForGame(int);
    void handleIt(bool, gd::string, gd::string, GJHttpType);
    void handleItDelayed(bool, gd::string, gd::string, GJHttpType);
    void handleItND(cocos2d::CCNode*, void*);
    bool isDLActive(char const* tag);
    TodoReturn joinLobby(int);
    void onExitLobbyCompleted(gd::string, gd::string);
    void onJoinLobbyCompleted(gd::string, gd::string);
    void onProcessHttpRequestCompleted(cocos2d::extension::CCHttpClient*, cocos2d::extension::CCHttpResponse*);
    void onUploadCommentCompleted(gd::string, gd::string);
    void ProcessHttpRequest(gd::string, gd::string, gd::string, GJHttpType);
    void removeDLFromActive(char const*);
    void uploadComment(gd::string, int);

    virtual bool init();
}

[[link(android)]]
class GJObjectDecoder : cocos2d::CCNode {
    // virtual ~GJObjectDecoder();

    static GJObjectDecoder* sharedDecoder();

    virtual bool init();
    virtual cocos2d::CCObject* getDecodedObject(int, DS_Dictionary*) = win 0x27c610, imac 0x70d960;
}

[[link(android)]]
class GJOptionsLayer : SetupTriggerPopup {
    // virtual ~GJOptionsLayer();
    GJOptionsLayer();

    static GJOptionsLayer* create(int) = imac 0x289440;

    void addGVToggle(char const*, char const*, char const*) = win 0x288350, imac 0x289e90;
    void addToggle(char const* p0, int p1, bool p2, char const* p3) {
    	addToggleInternal(p0, p1, p2, p3);
    }
    void addToggleInternal(char const*, int, bool, char const*) = win 0x288490;
    int countForPage(int);
    void goToPage(int);
    void incrementCountForPage(int) = win 0x288a60;
    const char* infoKey(int);
    bool init(int) = win 0x288010, imac 0x289690;
    cocos2d::CCLayer* layerForPage(int);
    const char* layerKey(int);
    cocos2d::CCPoint nextPosition(int) = imac 0x28a4e0;
    const char* objectKey(int);
    cocos2d::CCArray* objectsForPage(int);
    void offsetToNextPage() {
    	m_toggleCount += m_togglesPerPage - m_toggleCount % m_togglesPerPage;
    }
    void onInfo(cocos2d::CCObject* sender);
    void onNextPage(cocos2d::CCObject* sender);
    void onPrevPage(cocos2d::CCObject* sender);
    void onToggle(cocos2d::CCObject* sender) = win 0x2892c0, imac 0x28a7e0;
    const char* pageKey(int);

    virtual void setupOptions() {}
    virtual void didToggleGV(gd::string);
    virtual void didToggle(int) {}

    float m_gap;
    int m_page;
    int m_togglesPerPage;
    int m_toggleCount;
    int m_maxPage;
    float m_maxLabelScale;
    float m_maxLabelWidth;
    cocos2d::CCDictionary* m_values;
    cocos2d::CCDictionary* m_variables;
    CCMenuItemSpriteExtra* m_prevButton;
    CCMenuItemSpriteExtra* m_nextButton;
    float m_offset;
}

[[link(android)]]
class GJPathPage : FLAlertLayer, FLAlertLayerProtocol, GJPurchaseDelegate {
    // virtual ~GJPathPage();

    static GJPathPage* create(int, GJPathsLayer*) = win 0x27da60, imac 0x2ea000;

    bool init(int, GJPathsLayer*);
    void onActivatePath(cocos2d::CCObject* sender) = win 0x27f7c0, imac 0x2ec350;
    void onBack(cocos2d::CCObject* sender) = win 0x281550;
    void onIconInfo(cocos2d::CCObject* sender) = win 0x27f830;
    void onUnlock(cocos2d::CCObject* sender) = imac 0x2ec260;
    void playUnlockAnimation() = win 0x2802e0;
    void showCantAffordMessage(GJStoreItem*);
    void unlockAnimationFinished() = imac 0x2ed3d0;
    void unlockAnimationStep2() = win 0x280930;
    void unlockAnimationStep3() = win 0x280bb0, imac 0x2ed530;

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void show();
    virtual void didPurchaseItem(GJStoreItem*) = win 0x27fa20;

    GJPathsLayer* m_pathsLayer;
    int m_pathNumber;
    bool m_animationPlaying;
    int m_dialogIndex;
}

[[link(android)]]
class GJPathRewardPopup : FLAlertLayer {
    // virtual ~GJPathRewardPopup();

    static GJPathRewardPopup* create(int) = imac 0x2ea180;

    void closePopup();
    bool init(int) = win 0x2824d0, imac 0x2ee480;
    void onClaim(cocos2d::CCObject* sender);

    virtual void keyBackClicked() {}

    int m_pathNumber;
}

[[link(android)]]
class GJPathsLayer : FLAlertLayer, FLAlertLayerProtocol {
    // virtual ~GJPathsLayer();

    static GJPathsLayer* create() = win 0x27d0b0, imac 0x2e9710;

    void darkenButtons(bool) = imac 0x2e9fc0;
    static gd::string nameForPath(int) = win 0x27ce40, imac 0x2e9570;
    void onClose(cocos2d::CCObject* sender);
    void onPath(cocos2d::CCObject* sender) = imac 0x2e9ef0;

    virtual bool init() = win 0x27d1b0;
    virtual void onExit();
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x27da00;
    virtual void show();

    cocos2d::CCSprite* m_closeSprite;
    bool m_running;
}

[[link(android)]]
class GJPathSprite : CCSpriteCOpacity {
    // virtual ~GJPathSprite();

    static GJPathSprite* create(int) = win 0x281600;

    void addRankLabel(int);
    void addShardSprite() = win 0x281c70, imac 0x2ede50;
    void changeToLockedArt() = win 0x2819b0, imac 0x2ecdf0;
    bool init(int) = imac 0x2ee260;
    void updateState();

    int m_pathNumber;
}

[[link(android)]]
class GJPFollowCommandLayer : SetupTriggerPopup {
    // virtual ~GJPFollowCommandLayer();

    static GJPFollowCommandLayer* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onUpdateGroupID(cocos2d::CCObject* sender);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn sliderXModChanged(cocos2d::CCObject*);
    TodoReturn sliderYModChanged(cocos2d::CCObject*);
    TodoReturn updateDuration();
    TodoReturn updateDurLabel(bool);
    TodoReturn updateMaxSpeed();
    TodoReturn updateMaxSpeedLabel();
    TodoReturn updateOffsetLabel();
    TodoReturn updatePlayerOffset();
    TodoReturn updateTargetGroupID();
    TodoReturn updateTextInputLabel();
    TodoReturn updateXMod();
    TodoReturn updateXModLabel();
    TodoReturn updateYMod();
    TodoReturn updateYModLabel();

    virtual void determineStartValues() = imac 0x352ab0;
    virtual void onClose(cocos2d::CCObject* sender) = imac 0x353840;
    virtual void textChanged(CCTextInputNode*) = win 0x284c00, imac 0x3530d0;
}

[[link(android)]]
class GJPromoPopup : FLAlertLayer {
    // virtual ~GJPromoPopup();

    static GJPromoPopup* create(gd::string);

    bool init(gd::string) = win 0x29d470, imac 0x2a27c0;
    void onClose(cocos2d::CCObject* sender);

    virtual void onExit() = win 0x27d9a0;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void show();
}

[[link(android)]]
class GJPurchaseDelegate {
    virtual void didPurchaseItem(GJStoreItem*);
}

[[link(android)]]
class GJRequestCell : TableViewCell, FLAlertLayerProtocol, UploadPopupDelegate, UploadActionDelegate {
    // virtual ~GJRequestCell();
    GJRequestCell(char const*, float, float);

    void loadFromScore(GJUserScore*) = win 0xbb640;
    TodoReturn markAsRead();
    void onDeleteRequest(cocos2d::CCObject* sender);
    void onToggle(cocos2d::CCObject* sender);
    void onViewFriendRequest(cocos2d::CCObject* sender);
    void onViewProfile(cocos2d::CCObject* sender);
    TodoReturn updateBGColor(int);
    TodoReturn updateToggle();

    virtual bool init();
    virtual void draw();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xbc1f0, imac 0x2453d0;
    virtual void uploadActionFinished(int, int) = win 0xbc3a0;
    virtual void uploadActionFailed(int, int) = win 0xbc580;
    virtual void onClosePopup(UploadActionPopup*);
}

[[link(android)]]
class GJRewardDelegate {
    virtual void rewardsStatusFinished(int);
    virtual void rewardsStatusFailed();
}

[[link(android)]]
class GJRewardItem : cocos2d::CCObject {
    // virtual ~GJRewardItem();

    static GJRewardItem* create() = win 0x1f0860, imac 0x8e360;
    static GJRewardItem* create(int chestID, int timeRemaining, gd::string) = win 0x1f0ba0;
    static GJRewardItem* createSpecial(GJRewardType, int, int, SpecialRewardItem, int, SpecialRewardItem, int, int, int) = win 0x1f09b0, imac 0x76de0;
    static GJRewardItem* createWithCoder(DS_Dictionary* dict) {
    	auto ret = create();
    	ret->dataLoaded(dict);
    	return ret;
    }
    static GJRewardItem* createWithObject(GJRewardType, GJRewardObject*) = win 0x1f08a0, imac 0x8b790;
    static GJRewardItem* createWithObjects(GJRewardType, cocos2d::CCArray*) = win 0x1f0930, imac 0x715f0;

    void dataLoaded(DS_Dictionary* dict) {
    	m_chestID = dict->getIntegerForKey("1");
    	m_rewardType = (GJRewardType)dict->getIntegerForKey("2");
    	auto rewardObjects = dict->getArrayForKey("3", false);
    	CC_SAFE_RETAIN(rewardObjects);
    	CC_SAFE_RELEASE(m_rewardObjects);
    	m_rewardObjects = rewardObjects;
    }
    static SpecialRewardItem getNextShardType(SpecialRewardItem type) {
    	switch (type) {
    		case SpecialRewardItem::FireShard: return SpecialRewardItem::IceShard;
    		case SpecialRewardItem::IceShard: return SpecialRewardItem::PoisonShard;
    		case SpecialRewardItem::PoisonShard: return SpecialRewardItem::ShadowShard;
    		case SpecialRewardItem::ShadowShard: return SpecialRewardItem::LavaShard;
    		case SpecialRewardItem::LavaShard: return SpecialRewardItem::EarthShard;
    		case SpecialRewardItem::EarthShard: return SpecialRewardItem::BloodShard;
    		case SpecialRewardItem::BloodShard: return SpecialRewardItem::MetalShard;
    		case SpecialRewardItem::MetalShard: return SpecialRewardItem::LightShard;
    		case SpecialRewardItem::LightShard: return SpecialRewardItem::SoulShard;
    		case SpecialRewardItem::SoulShard: return SpecialRewardItem::FireShard;
    		default: return (SpecialRewardItem)0;
    	}
    }
    static SpecialRewardItem getRandomNonMaxShardType() {
    	auto type = getRandomShardType();
    	for (int i = 10; i > 0; i--) {
    		if (GameStatsManager::sharedState()->getStat(rewardItemToStat(type).c_str()) < 100) return type;
    		type = getNextShardType(type);
    	}
    	return (SpecialRewardItem)0;
    }
    static SpecialRewardItem getRandomShardType() {
    	int randomValue = floorf((rand() / (float)RAND_MAX) * 10.f) + 1.f;
    	switch (randomValue) {
    		case 2: return SpecialRewardItem::IceShard;
    		case 3: return SpecialRewardItem::PoisonShard;
    		case 4: return SpecialRewardItem::ShadowShard;
    		case 5: return SpecialRewardItem::LavaShard;
    		case 6: return SpecialRewardItem::EarthShard;
    		case 7: return SpecialRewardItem::BloodShard;
    		case 8: return SpecialRewardItem::MetalShard;
    		case 9: return SpecialRewardItem::LightShard;
    		case 10: return SpecialRewardItem::SoulShard;
    		default: return SpecialRewardItem::FireShard;
    	}
    }
    int getRewardCount(SpecialRewardItem type) {
    	if (!m_rewardObjects) return 0;

    	int count = 0;
    	for (int i = 0; i < m_rewardObjects->count(); i++) {
    		auto obj = static_cast<GJRewardObject*>(m_rewardObjects->objectAtIndex(i));
    		if (obj->m_specialRewardItem == type) count += obj->m_total;
    	}

    	return count;
    }
    GJRewardObject* getRewardObjectForType(SpecialRewardItem type) {
    	if (!m_rewardObjects) {
    		auto rewardObjects = cocos2d::CCArray::create();
    		CC_SAFE_RETAIN(rewardObjects);
    		CC_SAFE_RELEASE(m_rewardObjects);
    		m_rewardObjects = rewardObjects;
    	}

    	for (int i = 0; i < m_rewardObjects->count(); i++) {
    		auto obj = static_cast<GJRewardObject*>(m_rewardObjects->objectAtIndex(i));
    		if (obj->m_specialRewardItem == type) return obj;
    	}

    	auto obj = GJRewardObject::create(type, 0, 0);
    	m_rewardObjects->addObject(obj);
    	return obj;
    }
    bool init(int chestID, int timeRemaining, gd::string) = win 0x1f0c70, imac 0x8e390;
    static bool isShardType(SpecialRewardItem type) {
    	return type == SpecialRewardItem::FireShard || type == SpecialRewardItem::IceShard || type == SpecialRewardItem::PoisonShard
    		|| type == SpecialRewardItem::ShadowShard || type == SpecialRewardItem::LavaShard || type == SpecialRewardItem::EarthShard
    		|| type == SpecialRewardItem::BloodShard || type == SpecialRewardItem::MetalShard || type == SpecialRewardItem::LightShard
    		|| type == SpecialRewardItem::SoulShard;
    }
    static gd::string rewardItemToStat(SpecialRewardItem) = win 0x1f0ed0;

    virtual void encodeWithCoder(DS_Dictionary*) = win 0x1f1130, imac 0x8e790;
    virtual bool canEncode() {
    	return true;
    }

    int m_chestID;
    int m_timeRemaining;
    GJRewardType m_rewardType;
    cocos2d::CCArray* m_rewardObjects;
    bool m_unk;
}

[[link(android)]]
class GJRewardObject : cocos2d::CCObject {
    // virtual ~GJRewardObject();

    static GJRewardObject* create() {
    	auto ret = create(SpecialRewardItem::FireShard, 0, 0); // the first param is meant to be 0
    	return ret;
    }
    static GJRewardObject* create(SpecialRewardItem, int, int) = win 0x1f0760, imac 0x71580;
    static GJRewardObject* createItemUnlock(UnlockType, int) = win 0x1f06f0, imac 0x71510;

    static GJRewardObject* createWithCoder(DS_Dictionary* dict) {
    	auto ret = create();
    	ret->dataLoaded(dict);
    	return ret;
    }
    void dataLoaded(DS_Dictionary* dict) {
    	m_specialRewardItem = (SpecialRewardItem)dict->getIntegerForKey("1");
    	m_itemID = dict->getIntegerForKey("2");
    	m_total = dict->getIntegerForKey("3");
    	m_unlockType = (UnlockType)dict->getIntegerForKey("4");
    }
    bool init(SpecialRewardItem specialRewardItem, int total, int itemID) {
    	this->m_specialRewardItem = specialRewardItem;
    	this->m_total = total;
    	this->m_itemID = itemID;
    	return true;
    }
    bool isSpecialType() {
    	auto type = m_specialRewardItem;
    	return type == SpecialRewardItem::FireShard || type == SpecialRewardItem::IceShard || type == SpecialRewardItem::PoisonShard
    		|| type == SpecialRewardItem::ShadowShard || type == SpecialRewardItem::LavaShard || type == SpecialRewardItem::BonusKey
    		|| type == SpecialRewardItem::EarthShard || type == SpecialRewardItem::BloodShard || type == SpecialRewardItem::MetalShard
    		|| type == SpecialRewardItem::LightShard || type == SpecialRewardItem::SoulShard;
    }

    virtual void encodeWithCoder(DS_Dictionary*) = win 0x1f07d0, imac 0x8e210;
    virtual bool canEncode() {
    	return true;
    }

    SpecialRewardItem m_specialRewardItem;
    UnlockType m_unlockType;
    int m_itemID;
    int m_total;
}

[[link(android)]]
class GJRobotSprite : CCAnimatedSprite {
    // virtual ~GJRobotSprite();
    // GJRobotSprite();

    static GJRobotSprite* create(int) = win 0x29eeb0;

    void hideGlow();
    bool init(int, gd::string) = win 0x29ef60;
    bool init(int) = imac 0x5c2ed0;
    void showGlow();
    void updateColor01(cocos2d::ccColor3B) = imac 0x5c3d80;
    void updateColor02(cocos2d::ccColor3B);
    void updateColors() = win 0x29f6f0;
    void updateFrame(int) = win 0x29fca0, imac 0x5c34c0;
    void updateGlowColor(cocos2d::ccColor3B, bool) = imac 0x5c40d0;

    virtual void setOpacity(unsigned char) = win 0x29fba0;
    virtual void hideSecondary() = win 0x2a0290;

    cocos2d::CCArray* m_unkArray;
    bool m_hasExtra;
    cocos2d::ccColor3B m_color;
    cocos2d::ccColor3B m_secondColor;
    cocos2d::CCArray* m_secondArray;
    cocos2d::CCSprite* m_glowSprite;
    cocos2d::CCSprite* m_extraSprite;
    IconType m_iconType;
    int m_iconRequestID;
    CCSpritePart* m_headSprite;
    CCSpritePart* m_lastSprite;
}

[[link(android)]]
class GJRotateCommandLayer : SetupTriggerPopup {
    // virtual ~GJRotateCommandLayer();

    static GJRotateCommandLayer* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onEasing(cocos2d::CCObject* sender);
    void onEasingRate(cocos2d::CCObject* sender);
    void onFollowRotation(cocos2d::CCObject* sender);
    void onLockRotation(cocos2d::CCObject* sender);
    void onUpdateGroupID(cocos2d::CCObject* sender);
    void onUpdateGroupID2(cocos2d::CCObject* sender);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn sliderDegreesChanged(cocos2d::CCObject*);
    TodoReturn sliderTimesChanged(cocos2d::CCObject*);
    TodoReturn toggleEasingRateVisibility();
    TodoReturn updateCommandDegrees();
    TodoReturn updateCommandTimes();
    TodoReturn updateDegreesLabel();
    TodoReturn updateDuration();
    TodoReturn updateDurLabel(bool);
    TodoReturn updateEasingLabel();
    TodoReturn updateEasingRateLabel();
    TodoReturn updateMoveCommandEasing();
    TodoReturn updateMoveCommandEasingRate();
    TodoReturn updateTargetGroupID();
    TodoReturn updateTargetGroupID2();
    TodoReturn updateTextInputLabel();
    TodoReturn updateTextInputLabel2();
    TodoReturn updateTimesLabel();

    virtual void determineStartValues() = imac 0x3ee0;
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*) = imac 0x4890;
    virtual TodoReturn valuePopupClosed(ConfigureValuePopup*, float);
}

[[link(android)]]
class GJRotationControl : cocos2d::CCLayer {
    // virtual ~GJRotationControl();
    	GJRotationControl() {
    	m_cursorDifference = cocos2d::CCPointMake(0.0f, 0.0f);
    	m_controlPosition = cocos2d::CCPointMake(0.0f, 0.0f);
    	m_controlSprite = nullptr;
    	m_startingRotation = 0.0f;
    	m_currentRotation = 0.0f;
    	m_touchID = -1;
    	m_delegate = nullptr;
    }

    static GJRotationControl* create() {
    	auto ret = new GJRotationControl();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void finishTouch() = win 0x1278e0, imac 0xb850;
    void setAngle(float) = imac 0x51600;
    void updateSliderPosition(cocos2d::CCPoint) = imac 0x51680;

    virtual bool init() = win 0x1277c0;
    virtual void draw() = win 0x127c20, imac 0x51b10;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x127960, imac 0x51780;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x127a60, imac 0x518a0;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x127c00, imac 0x51a00;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);

    cocos2d::CCPoint m_cursorDifference;
    cocos2d::CCPoint m_controlPosition;
    cocos2d::CCSprite* m_controlSprite;
    float m_startingRotation;
    float m_currentRotation;
    int m_touchID;
    GJRotationControlDelegate* m_delegate;
}

[[link(android)]]
class GJRotationControlDelegate {
    virtual void angleChanged(float angle) {}
    virtual void angleChangeBegin() {}
    virtual void angleChangeEnded() {}
}

[[link(android)]]
class GJScaleControl : cocos2d::CCLayer {
    // virtual ~GJScaleControl();
    	GJScaleControl() {
    	m_sliderX = nullptr;
    	m_sliderY = nullptr;
    	m_sliderXY = nullptr;
    	m_touchID = -1;
    	m_valueX = 0.0f;
    	m_valueY = 0.0f;
    	m_unkSize4 = 0;
    	m_changedValueX = 0.0f;
    	m_changedValueY = 0.0f;
    	m_scale1Lock = false;
    	m_scaleButtonType = 0;
    	m_delegate = nullptr;
    	m_upperBound = 2.0f;
    	m_lowerBound = 0.5f;
    	m_senderTag = 0;
    	m_scaleLockButton = nullptr;
    	m_scaleLocked = false;
    }

    static GJScaleControl* create() {
    	auto ret = new GJScaleControl();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void finishTouch();
    void loadValues(GameObject*, cocos2d::CCArray*, gd::unordered_map<int, GameObjectEditorState>&) = win 0x128170, imac 0x3ef70;
    void onToggleLockScale(cocos2d::CCObject* sender);
    float scaleFromValue(float value) {
    	return (m_upperBound - m_lowerBound) * value + m_lowerBound;
    }
    float skewFromValue(float) = imac 0x521a0;
    void sliderChanged(cocos2d::CCObject* sender);
    void updateLabelX(float);
    void updateLabelXY(float);
    void updateLabelY(float);
    float valueFromScale(float scale) {
    	auto value = (scale - m_lowerBound) / (m_upperBound - m_lowerBound);
    	return value < 0 ? 0 : (value > 1 ? 1 : value);
    }
    float valueFromSkew(float);

    virtual bool init() = win 0x127ca0;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x128790, imac 0x52230;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x1289a0, imac 0x52420;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x128dc0, imac 0x528f0;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);

    Slider* m_sliderX;
    Slider* m_sliderY;
    Slider* m_sliderXY;
    int m_touchID;
    float m_valueX;
    float m_valueY;
    int m_unkSize4;
    float m_changedValueX;
    float m_changedValueY;
    bool m_scale1Lock;
    short m_scaleButtonType;
    cocos2d::CCLabelBMFont* m_scaleXLabel;
    cocos2d::CCLabelBMFont* m_scaleYLabel;
    cocos2d::CCLabelBMFont* m_scaleLabel;
    GJScaleControlDelegate* m_delegate;
    float m_upperBound;
    float m_lowerBound;
    int m_senderTag;
    CCMenuItemSpriteExtra* m_scaleLockButton;
    bool m_scaleLocked;
}

[[link(android)]]
class GJScaleControlDelegate {
    virtual void scaleXChanged(float scaleX, bool lock) {}
    virtual void scaleYChanged(float scaleY, bool lock) {}
    virtual void scaleXYChanged(float scaleX, float scaleY, bool lock) {}
    virtual void scaleChangeBegin() {}
    virtual void scaleChangeEnded() {}
    virtual void updateScaleControl() {}
    virtual void anchorPointMoved(cocos2d::CCPoint newAnchor) {}
}

[[link(android)]]
class GJScoreCell : TableViewCell, FLAlertLayerProtocol {
    // virtual ~GJScoreCell();
    GJScoreCell(char const*, float, float);

    void loadFromScore(GJUserScore*) = win 0xb7c80;
    void onBan(cocos2d::CCObject* sender);
    void onCheck(cocos2d::CCObject* sender);
    void onMoreLevels(cocos2d::CCObject* sender);
    void onViewProfile(cocos2d::CCObject* sender) = win 0xb8d60, imac 0x243070;
    TodoReturn updateBGColor(int);

    virtual bool init();
    virtual void draw();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xb8ee0, imac 0x243260;

    GJUserScore* m_score;
}

[[link(android)]]
class GJSearchObject : cocos2d::CCNode {
    // virtual ~GJSearchObject();

    static GJSearchObject* create(SearchType searchType, gd::string searchQuery, gd::string difficulty, gd::string length, int page, bool star, bool uncompleted, bool featured, int songID, bool original, bool twoPlayer, bool customSong, bool songFilter, bool noStar, bool coins, bool epic, bool legendary, bool mythic, bool onlyCompleted, int demonFilter, int folder, int searchMode) = win 0x171900;
    static GJSearchObject* create(SearchType searchType, gd::string searchQuery) = win 0x1717d0;
    static GJSearchObject* create(SearchType searchType) = win 0x1716f0, imac 0x549840;
    static GJSearchObject* createFromKey(char const* key) = win 0x170ff0;

    char const* getKey() = win 0x171c40;
    char const* getNextPageKey();
    GJSearchObject* getNextPageObject();
    GJSearchObject* getPageObject(int page) = win 0x171d90;
    GJSearchObject* getPrevPageObject() = imac 0x54a2e0;
    char const* getSearchKey(SearchType searchType, gd::string searchQuery, gd::string difficulty, gd::string length, int page, bool star, bool uncompleted, bool featured, int songID, bool original, bool twoPlayer, bool customSong, bool songFilter, bool noStar, bool coins, bool epic, bool legendary, bool mythic, bool onlyCompleted, int demonFilter, int folder, int searchMode) = win 0x171f00;
    bool init(SearchType searchType, gd::string searchQuery, gd::string difficulty, gd::string length, int page, bool star, bool uncompleted, bool featured, int songID, bool original, bool twoPlayer, bool customSong, bool songFilter, bool noStar, bool coins, bool epic, bool legendary, bool mythic, bool onlyCompleted, int demonFilter, int folder, int searchMode);
    bool isLevelSearchObject() = win 0x1721e0, imac 0x54a300;

    SearchType m_searchType;
    gd::string m_searchQuery;
    gd::string m_difficulty;
    gd::string m_length;
    int m_page;
    bool m_starFilter;
    bool m_noStarFilter;
    int m_total;
    bool m_uncompletedFilter;
    bool m_completedFilter;
    bool m_featuredFilter;
    bool m_originalFilter;
    bool m_twoPlayerFilter;
    bool m_coinsFilter;
    bool m_epicFilter;
    bool m_legendaryFilter;
    bool m_mythicFilter;
    GJDifficulty m_demonFilter;
    int m_folder;
    int m_songID;
    bool m_customSongFilter;
    bool m_songFilter;
    bool m_searchIsOverlay;
    int m_searchMode;
}

[[link(android), depends(GJValueTween)]]
class GJShaderState {
    TodoReturn reset();
    TodoReturn stopTweenAction(int);
    TodoReturn timesyncShaderAction(int);
    TodoReturn timesyncShaderActions();
    TodoReturn tweenValue(float, float, int, float, int, float);
    TodoReturn updateTweenAction(float, int);
    TodoReturn updateTweenActions(float);

    gd::unordered_map<int, GJValueTween> m_someIntToValueTweenMap;
    gd::unordered_map<int, double> m_someIntToDoubleMap;
    double m_time;
    double m_prevTime;
    double m_startTime;
    float m_textureScaleX;
    float m_textureScaleY;
    cocos2d::ccColor3B m_blurRefColor;
    float m_blurIntensity;
    int m_blurUnk60;
    bool m_blurOnlyEmpty;
    float m_shockWaveUnk68;
    float m_shockWaveUnk6c;
    float m_shockWaveUnk70;
    float m_shockWaveUnk74;
    float m_shockWaveUnk78;
    float m_shockWaveUnk7c;
    float m_shockWaveUnk80;
    float m_shockWaveUnk84;
    float m_shockWaveUnk88;
    bool m_shockWaveInvert;
    float m_shockWaveUnk90;
    float m_shockWaveUnk94;
    int m_shockWaveUnk98;
    bool m_shockWaveUnk9c;
    bool m_shockWaveCenterMoving;
    bool m_shockWaveUnk9e;
    float m_shockWaveUnka0;
    cocos2d::CCPoint m_shockWaveUnka4;
    bool m_shockWaveCenterDirty;
    cocos2d::CCPoint m_shockWaveCenter;
    double m_shockLineUnkb8;
    float m_shockLineUnkc0;
    float m_shockLineUnkc4;
    float m_shockLineUnkc8;
    bool m_shockLineAxis;
    bool m_shockLineDirection;
    bool m_shockLineDual;
    bool m_shockLineUnkcf;
    float m_shockLineUnkd0;
    float m_shockLineUnkd4;
    float m_shockLineUnkd8;
    float m_shockLineUnkdc;
    float m_shockLineUnke0;
    float m_shockLineUnke4;
    int m_shockLineUnke8;
    bool m_shockLineUnkec;
    bool m_shockLineCenterMoving;
    bool m_shockLineUnkee;
    float m_shockLineUnkf0;
    cocos2d::CCPoint m_shockLineUnkf4;
    bool m_shockLineCenterDirty;
    cocos2d::CCPoint m_shockLineCenter;
    float m_glitchUnk108;
    float m_glitchUnk10c;
    float m_glitchUnk110;
    float m_glitchUnk114;
    float m_glitchUnk118;
    float m_glitchUnk11c;
    bool m_glitchUnk120;
    float m_chromaticUnk124;
    float m_chromaticUnk128;
    bool m_chromaticUnk12c;
    float m_cGUnk130;
    float m_cGUnk134;
    float m_cGUnk138;
    float m_cGUnk13c;
    float m_cGUnk140;
    float m_cGUnk144;
    float m_cGUnk148;
    float m_cGUnk14c;
    bool m_cGUnk150;
    bool m_cGUnk151;
    bool m_cGUnk152;
    bool m_cGUnk153;
    float m_pixelateTargetX;
    float m_pixelateTargetY;
    bool m_pixelateSnapGrid;
    bool m_pixelatePixelating;
    bool m_pixelateRelative;
    bool m_pixelateHardEdges;
    float m_lensCircleUnk160;
    float m_lensCircleUnk164;
    float m_lensCircleStrength;
    int m_lensCircleUnk16c;
    int m_lensCircleUnk170;
    bool m_lensCircleUnk174;
    bool m_lensCircleAdditive;
    char m_lensCircleTintR;
    char m_lensCircleTintG;
    char m_lensCircleTintB;
    cocos2d::CCPoint m_lensCircleUnk17c;
    cocos2d::CCPoint m_lensCircleUnk184;
    float m_radialBlurUnk18c;
    float m_radialBlurUnk190;
    bool m_radialBlurUnk194;
    int m_radialBlurUnk198;
    cocos2d::CCPoint m_radialBlurUnk19c;
    cocos2d::CCPoint m_radialBlurUnk1a4;
    float m_motionBlurUnk1ac;
    float m_motionBlurUnk1b0;
    float m_motionBlurSpeedX;
    float m_motionBlurSpeedY;
    float m_motionBlurUnk1bc;
    float m_motionBlurUnk1c0;
    int m_motionBlurUnk1c4;
    int m_motionBlurUnk1c8;
    bool m_motionBlurDual;
    bool m_motionBlurUnk1cd;
    float m_bulgeValue;
    bool m_bulgeUnk1d4;
    int m_bulgeUnk1d8;
    float m_bulgeRadius;
    cocos2d::CCPoint m_bulgeUnk1e0;
    cocos2d::CCPoint m_bulgeUnk1e8;
    float m_pinchUnk1f0;
    float m_pinchUnk1f4;
    bool m_pinchUnk1f8;
    bool m_pinchUnk1f9;
    int m_pinchUnk1fc;
    int m_pinchUnk200;
    cocos2d::CCPoint m_pinchUnk204;
    cocos2d::CCPoint m_pinchUnk20c;
    bool m_pinchUnk214;
    float m_pinchUnk218;
    cocos2d::CCPoint m_pinchUnk21c;
    float m_grayscaleValue;
    bool m_grayscaleUseLum;
    int m_grayscaleUnk22c;
    cocos2d::ccColor3B m_grayscaleTint;
    float m_sepiaValue;
    float m_invertColorEditRGB;
    float m_invertColorR;
    float m_invertColorG;
    float m_invertColorB;
    bool m_invertColorClampRGB;
    float m_hueShiftDegrees;
    float m_colorChangeCR;
    float m_colorChangeCG;
    float m_colorChangeCB;
    float m_colorChangeBR;
    float m_colorChangeBG;
    float m_colorChangeBB;
    float m_splitUnk268;
    float m_splitUnk26c;
    bool m_splitUnk260;
    int m_blurRefChannel;
    int m_somethingZLayerUnk278;
    bool m_zLayerDirty;
    bool m_somethingZLayerUnk27d;
    bool m_usesShaders;
}

[[link(android)]]
class GJShopLayer : cocos2d::CCLayer, GJPurchaseDelegate, DialogDelegate, RewardedVideoDelegate {
    // virtual ~GJShopLayer();
    GJShopLayer() {
    	m_closing = false;
    	m_currencyLabel = nullptr;
    	m_shopItems = nullptr;
    	m_type = ShopType::Normal;
    	m_sheetName = "";
    	m_unkNode1 = nullptr;
    	m_unkNode2 = nullptr;
    	m_videoPlaying = false;
    	m_unkBool = false;
    	m_shopKeeper = nullptr;
    	m_zolgurothDialogIndex = 0;
    	m_affordDialogIndex = 0;
    }

    static GJShopLayer* create(ShopType type) {
    	auto ret = new GJShopLayer();
    	if (ret->init(type)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void exitVideoAdItems() = imac 0x3101a0;
    bool init(ShopType) = imac 0x30e2e0;
    void onBack(cocos2d::CCObject* sender) = win 0x2a5590, imac 0x30fc90;
    void onCommunityCredits(cocos2d::CCObject* sender) = win 0x2a42c0;
    void onPlushies(cocos2d::CCObject* sender);
    void onSelectItem(cocos2d::CCObject* sender) = imac 0x30fe40;
    void onVideoAd(cocos2d::CCObject* sender) = imac 0x30fc40;
    static cocos2d::CCScene* scene(ShopType) = win 0x2a1dd0;
    void showCantAffordMessage(GJStoreItem*);
    void showReactMessage() = win 0x2a57c0;
    void updateCurrencyCounter();

    virtual void onExit() = win 0x2a4040;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = imac 0x312560;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x2a57b0;
    virtual void didPurchaseItem(GJStoreItem*);
    virtual void rewardedVideoFinished() = win 0x2a4400, imac 0x310270;
    virtual void dialogClosed(DialogLayer*) = win 0x2a6e40, imac 0x3123a0;

    bool m_closing;
    CCCounterLabel* m_currencyLabel;
    cocos2d::CCDictionary* m_shopItems;
    ShopType m_type;
    gd::string m_sheetName;
    cocos2d::CCNode* m_unkNode1;
    cocos2d::CCNode* m_unkNode2;
    bool m_videoPlaying;
    bool m_unkBool;
    AnimatedShopKeeper* m_shopKeeper;
    int m_zolgurothDialogIndex;
    int m_affordDialogIndex;
}

[[link(android)]]
class GJSmartBlockPreview : cocos2d::CCNode {
    // virtual ~GJSmartBlockPreview();

    static GJSmartBlockPreview* create(gd::string);

    TodoReturn addChance(int, int);
    TodoReturn addCount(int);
    TodoReturn addPreview(gd::string, gd::string, LevelEditorLayer*);
    TodoReturn addTemplateGuide(gd::string, int);
    TodoReturn addTemplateGuide(SmartPrefabResult, float);
    TodoReturn createInfoLabel();
    bool init(gd::string);
    TodoReturn toggleSelectItem(bool);
}

[[link(android)]]
class GJSmartBlockPreviewSprite : cocos2d::CCNode {
    // virtual ~GJSmartBlockPreviewSprite();

    static GJSmartBlockPreviewSprite* create();

    virtual bool init();
    virtual void visit() = imac 0x4161d0;
}

[[link(android)]]
class GJSmartPrefab : cocos2d::CCObject {
    // virtual ~GJSmartPrefab();

    static GJSmartPrefab* create();

    TodoReturn createWithCoder(DS_Dictionary*) = imac 0x414f60;
    void dataLoaded(DS_Dictionary*);
    bool init();

    virtual void encodeWithCoder(DS_Dictionary*) = win 0x2ae190, imac 0x4150a0;
    virtual bool canEncode();
}

[[link(android)]]
class GJSmartTemplate : cocos2d::CCObject {
    // virtual ~GJSmartTemplate();

    static GJSmartTemplate* create() = win 0x2a91c0;

    TodoReturn applyTransformationsForType(SmartBlockType, cocos2d::CCSprite*);
    TodoReturn createWithCoder(DS_Dictionary*) = imac 0x4149d0;
    void dataLoaded(DS_Dictionary*) = win 0x2add60;
    TodoReturn flipBlockType(SmartBlockType, bool, bool);
    TodoReturn flipBlockTypeX(SmartBlockType);
    TodoReturn flipBlockTypeY(SmartBlockType);
    TodoReturn flipKey(gd::string, bool, bool);
    TodoReturn generateRemapDict();
    TodoReturn getNoCornerKey(gd::string);
    TodoReturn getPrefab(cocos2d::CCPoint, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*);
    TodoReturn getPrefab(gd::string, bool, bool);
    TodoReturn getPrefabs(gd::string);
    TodoReturn getPrefabWithID(gd::string, int);
    TodoReturn getRandomPrefab(gd::string);
    TodoReturn getSimplifiedKey(gd::string);
    TodoReturn getSimplifiedType(SmartBlockType, bool&);
    TodoReturn getTemplateState(gd::vector<SmartPrefabResult>&);
    TodoReturn getTotalChanceForPrefab(gd::string);
    TodoReturn getVerySimplifiedKey(gd::string) = imac 0x4105b0;
    bool init();
    bool isUnrequired(gd::string);
    TodoReturn keyFromNeighbors(cocos2d::CCPoint, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*, SmartGameObject*);
    TodoReturn keyFromNeighbors(SmartBlockType, SmartBlockType, SmartBlockType, SmartBlockType, SmartBlockType, SmartBlockType, SmartBlockType, SmartBlockType, SmartBlockType);
    TodoReturn keyFromNeighborsOld(bool, bool, bool, bool, bool, bool, bool, bool);
    TodoReturn logTemplateStatus(bool);
    TodoReturn offsetForDir(GJSmartDirection, int);
    TodoReturn offsetForObject(SmartGameObject*);
    TodoReturn offsetForType(SmartBlockType);
    TodoReturn removePrefab(gd::string, int);
    TodoReturn resetScannedPrefabs();
    TodoReturn rotateBlockType(SmartBlockType, int);
    TodoReturn rotateBlockType90(SmartBlockType);
    TodoReturn rotateKey(gd::string, int);
    TodoReturn savePrefab(gd::string, gd::string);
    TodoReturn saveRemap(gd::string);
    TodoReturn saveRemapToDict(gd::string, gd::string, cocos2d::CCDictionary*) = imac 0x410260;
    TodoReturn scanForPrefab(gd::string);
    TodoReturn shouldDiscardObject(SmartBlockType, GJSmartDirection);
    TodoReturn smartObjectToType(SmartGameObject*, cocos2d::CCPoint);
    TodoReturn smartTypeToObjectKey(SmartBlockType);

    virtual void encodeWithCoder(DS_Dictionary*) = win 0x2ae030, imac 0x414da0;
    virtual bool canEncode();
}

[[link(android)]]
class GJSongBrowser : GJDropDownLayer, FLAlertLayerProtocol, TableViewCellDelegate {
    // virtual ~GJSongBrowser();

    static GJSongBrowser* create() = win 0x2af990;

    void loadPage(int) = win 0x2aff90;
    void onDeleteAll(cocos2d::CCObject* sender);
    void onNextPage(cocos2d::CCObject* sender) = win 0x2b0220;
    void onPrevPage(cocos2d::CCObject* sender);
    void setupPageInfo(int, int, int);
    TodoReturn setupSongBrowser(cocos2d::CCArray*);

    virtual bool init() = win 0x2afb10;
    virtual void customSetup() = win 0x2afc10;
    virtual void exitLayer(cocos2d::CCObject*);
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x2b0350, imac 0x5e7100;
    virtual bool cellPerformedAction(TableViewCell*, int, CellAction, cocos2d::CCNode*) = imac 0x5e71e0;
    virtual int getSelectedCellIdx();

    int m_page;
    int m_songID;
    bool m_selected;
    CCMenuItemSpriteExtra* m_rightArrow;
    CCMenuItemSpriteExtra* m_leftArrow;
    cocos2d::CCLabelBMFont* m_countText;
    PAD = android32 0x8;
    cocos2d::CCArray* m_downloadedSongs;
    CustomListView* m_listView;
}

[[link(android)]]
class GJSpecialColorSelect : FLAlertLayer {
    // virtual ~GJSpecialColorSelect();

    static GJSpecialColorSelect* create(int, GJSpecialColorSelectDelegate*, ColorSelectType) = win 0x2b0550, imac 0x60d0b0;

    ButtonSprite* getButtonByTag(int);
    void highlightSelected(ButtonSprite*);
    bool init(int, GJSpecialColorSelectDelegate*, ColorSelectType) = win 0x2b0660, imac 0x60d220;
    void onClose(cocos2d::CCObject* sender) = win 0x2b1200;
    void onSelectColor(cocos2d::CCObject* sender) = win 0x2b1120, imac 0x60f4b0;
    static const char* textForColorIdx(int) = win 0x2b12a0, imac 0x60f480;

    virtual void keyBackClicked() = win 0x2b1250;

    GJSpecialColorSelectDelegate* m_delegate;
    int m_colorID;
    cocos2d::CCArray* m_buttonSprites;
}

[[link(android)]]
class GJSpecialColorSelectDelegate {
    virtual void colorSelectClosed(GJSpecialColorSelect*, int);
}

[[link(android)]]
class GJSpiderSprite : GJRobotSprite {
    // virtual ~GJSpiderSprite();

    static GJSpiderSprite* create(int) = win 0x2a0300;

    bool init(int) = imac 0x5c45b0;
}

[[link(android)]]
class GJSpriteColor {
    // GJSpriteColor();

    int getColorMode();

    int m_colorID;
    int m_defaultColorID;
    float m_opacity;
    float m_baseOpacity;
    cocos2d::ccHSVValue m_hsv;
    bool m_usesHSV;
    bool m_usesCustomBlend;
    cocos2d::ccColor3B m_customColor;
}

[[link(android)]]
class GJStoreItem : cocos2d::CCNode {
    // virtual ~GJStoreItem();
    	GJStoreItem() {
    	m_index = 0;
    	m_typeID = 0;
    	m_unlockType = 0;
    	m_price = 0;
    	m_shopType = ShopType::Normal;
    }

    static GJStoreItem* create(int index, int typeID, int unlockType, int price, ShopType shopType) {
    	auto ret = new GJStoreItem();
    	if (ret->init(index, typeID, unlockType, price, shopType)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    gd::string getCurrencyKey() {
    	return m_shopType == ShopType::Diamond ? "29" : "14";
    }
    bool init(int index, int typeID, int unlockType, int price, ShopType shopType) {
    	if (!CCNode::init()) return false;
    	m_index = index;
    	m_typeID = typeID;
    	m_unlockType = unlockType;
    	m_price = price;
    	m_shopType = shopType;
    	return true;
    }

    geode::SeedValueRSV m_index;
    geode::SeedValueRSV m_typeID;
    geode::SeedValueRSV m_unlockType;
    geode::SeedValueRSV m_price;
    ShopType m_shopType;
}

[[link(android)]]
class GJTransformControl : cocos2d::CCLayer {
    // virtual ~GJTransformControl();

    static GJTransformControl* create();

    TodoReturn applyRotation(float);
    TodoReturn calculateRotationOffset();
    void finishTouch();
    void loadFromState(GJTransformState&);
    TodoReturn loadValues(GameObject*, cocos2d::CCArray*, gd::unordered_map<int, GameObjectEditorState>&);
    TodoReturn logCurrentZeroPos();
    void onToggleLockScale(cocos2d::CCObject* sender);
    void refreshControl() = win 0x1295d0;
    void saveToState(GJTransformState&);
    void scaleButtons(float) = win 0x1297f0;
    cocos2d::CCSprite* spriteByTag(int tag) {
    	return static_cast<cocos2d::CCSprite*>(m_warpSprites->objectAtIndex(tag - 1));
    }
    TodoReturn updateAnchorSprite(cocos2d::CCPoint);
    void updateButtons(bool, bool) = win 0x1298b0;
    TodoReturn updateMinMaxPositions();

    virtual bool init() = win 0x129080;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x12a710, imac 0x53240;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x12a8e0, imac 0x536c0;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x12ae40, imac 0x53c60;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);

    // 2lazy
    cocos2d::CCNode* m_mainNodeParent;
    cocos2d::CCNode* m_mainNode;
    cocos2d::CCArray* m_unk1;
    int m_touchID;
    short m_transformButtonType;
    GJTransformControlDelegate* m_delegate;
    cocos2d::CCPoint m_cursorDifference;
    cocos2d::CCPoint m_touchStart;
    cocos2d::CCPoint m_unk3;
    cocos2d::CCPoint m_unk4;
    cocos2d::CCPoint m_unk5;
    cocos2d::CCPoint m_unk6;
    cocos2d::CCPoint m_unk7;
    cocos2d::CCArray* m_warpSprites;
    cocos2d::CCPoint m_rotatePosition;
    CCMenuItemSpriteExtra* m_warpLockButton;
    float m_scaleX;
    float m_scaleY;
    bool m_warpLocked;
    float m_unk10;
    float m_unk11;
    float m_unk12;
    float m_buttonScale;
}

[[link(android)]]
class GJTransformControlDelegate {
    virtual void transformScaleXChanged(float);
    virtual void transformScaleYChanged(float);
    virtual void transformScaleXYChanged(float, float);
    virtual void transformRotationXChanged(float);
    virtual void transformRotationYChanged(float);
    virtual void transformRotationChanged(float);
    virtual void transformResetRotation();
    virtual void transformRestoreRotation();
    virtual void transformSkewXChanged(float);
    virtual void transformSkewYChanged(float);
    virtual void transformChangeBegin();
    virtual void transformChangeEnded();
    virtual void updateTransformControl();
    virtual void anchorPointMoved(cocos2d::CCPoint);
    virtual TodoReturn getTransformNode();
    virtual TodoReturn getUI();
}

[[link(android)]]
class GJUINode : cocos2d::CCNode {
    // virtual ~GJUINode();

    static GJUINode* create(UIButtonConfig&) = imac 0x4b4480;

    TodoReturn activeRangeTouchTest(cocos2d::CCPoint);
    TodoReturn activeTouchTest(cocos2d::CCPoint);
    TodoReturn getButtonScale();
    TodoReturn getOpacity();
    TodoReturn highlightButton(int);
    bool init(UIButtonConfig&);
    void loadFromConfig(UIButtonConfig&);
    TodoReturn resetState();
    TodoReturn saveToConfig(UIButtonConfig&);
    void setOpacity(unsigned char);
    TodoReturn toggleHighlight(int, bool);
    void toggleModeB(bool);
    TodoReturn touchEnded();
    TodoReturn touchTest(cocos2d::CCPoint);
    TodoReturn updateButtonFrames();
    TodoReturn updateButtonPositions();
    TodoReturn updateButtonScale(float);
    TodoReturn updateDeadzone(int);
    TodoReturn updateDragRadius(float);
    TodoReturn updateHeight(float);
    TodoReturn updateRangePos(cocos2d::CCPoint);
    TodoReturn updateSize(float, float);
    TodoReturn updateWidth(float);

    virtual void draw() = imac 0x4b7710;
}

[[link(android)]]
class GJUnlockableItem : cocos2d::CCObject {
    // virtual ~GJUnlockableItem();

    static GJUnlockableItem* create();

    bool init();
}

[[link(android)]]
class GJUserCell : TableViewCell, FLAlertLayerProtocol, UploadPopupDelegate, UploadActionDelegate {
    // virtual ~GJUserCell();
    GJUserCell(char const*, float, float);

    void loadFromScore(GJUserScore*) = win 0xb9f70;
    void onCancelFriendRequest(cocos2d::CCObject* sender);
    void onRemoveFriend(cocos2d::CCObject* sender);
    void onSendMessage(cocos2d::CCObject* sender);
    void onUnblockUser(cocos2d::CCObject* sender);
    void onViewFriendRequest(cocos2d::CCObject* sender);
    void onViewProfile(cocos2d::CCObject* sender);
    TodoReturn updateBGColor(int);

    virtual bool init() = win 0xb9f50, imac 0x243ca0;
    virtual void draw();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xbae70, imac 0x2444e0;
    virtual void uploadActionFinished(int, int) = win 0xbb230;
    virtual void uploadActionFailed(int, int);
    virtual void onClosePopup(UploadActionPopup*);
}

[[link(android)]]
class GJUserMessage : cocos2d::CCNode {
    // virtual ~GJUserMessage();

    static GJUserMessage* create() = win 0x170ec0, imac 0x5492f0;
    static GJUserMessage* create(cocos2d::CCDictionary*) = win 0x170380;

    virtual bool init();

    int m_messageID;
    int m_accountID;
    int m_userID;
    gd::string m_title;
    gd::string m_content;
    gd::string m_username;
    gd::string m_uploadDate;
    bool m_read;
    bool m_outgoing;
    bool m_toggled;
}

[[link(android)]]
class GJUserScore : cocos2d::CCNode {
    // virtual ~GJUserScore();

    static GJUserScore* create() {
    	auto ret = new GJUserScore();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}

    	delete ret;
    	return nullptr;
    }
    static GJUserScore* create(cocos2d::CCDictionary*) = win 0x16e1a0;
    GJUserScore() = win 0x1401d0;

    bool isCurrentUser() = win 0x16fb90;
    TodoReturn mergeWithScore(GJUserScore*);

    virtual bool init();

    gd::string m_userName;
    gd::string m_userUDID;
    int m_scoreType;
    int m_userID;
    int m_accountID;
    int m_stars;
    int m_moons;
    int m_diamonds;
    int m_demons;
    int m_playerRank;
    int m_creatorPoints;
    int m_secretCoins;
    int m_userCoins;
    int m_iconID;
    int m_color1;
    int m_color2;
    int m_color3;
    int m_special;
    IconType m_iconType;
    int m_messageState;
    int m_friendStatus;
    int m_commentHistoryStatus;
    gd::string m_youtubeURL;
    gd::string m_twitterURL;
    gd::string m_twitchURL;
    int m_playerCube;
    int m_playerShip;
    int m_playerBall;
    int m_playerUfo;
    int m_playerWave;
    int m_playerRobot;
    int m_playerSpider;
    int m_playerSwing;
    int m_playerJetpack;
    int m_playerStreak;
    bool m_glowEnabled;
    int m_playerExplosion;
    int m_modBadge;
    int m_globalRank;
    int m_friendReqStatus;
    int m_newMsgCount;
    int m_friendReqCount;
    int m_newFriendCount;
    bool m_newFriendRequest;
    gd::string m_unkString;
    int m_unkInt;
    int m_unkInt2;
    void* m_unkSizeT;
    gd::string m_demonInfo;
    gd::string m_starsInfo;
    gd::string m_platformerInfo;
}

[[link(android)]]
class GJValueTween {
    void step(float delta) = win 0x1fff90;

    float m_fromValue;
    float m_toValue;
    float m_duration;
    float m_deltaTime;
    float m_currentValue;
    int m_easingType;
    float m_easingRate;
    bool m_finished;
    bool m_disabled;
    PAD = win 0xa;
}

[[link(android)]]
class GJWorldNode : cocos2d::CCNode {
    // virtual ~GJWorldNode();

    static GJWorldNode* create(int, WorldSelectLayer*);

    TodoReturn addDotsToLevel(int, bool);
    TodoReturn dotPositionForLevel(int, int);
    bool init(int, WorldSelectLayer*);
    void onLevel(cocos2d::CCObject* sender);
    TodoReturn playStep1();
    TodoReturn playStep2();
    TodoReturn playStep3();
    TodoReturn positionForLevelButton(int);
    TodoReturn unlockActiveItem();
}

[[link(android)]]
class GJWriteMessagePopup : FLAlertLayer, TextInputDelegate, UploadMessageDelegate, UploadPopupDelegate, FLAlertLayerProtocol {
    // virtual ~GJWriteMessagePopup();

    static GJWriteMessagePopup* create(int, int) = imac 0x2942b0;

    TodoReturn closeMessagePopup(bool);
    bool init(int, int);
    void onClearBody(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    void onSend(cocos2d::CCObject* sender);
    TodoReturn updateBody(gd::string);
    TodoReturn updateCharCountLabel(int);
    TodoReturn updateSubject(gd::string);
    TodoReturn updateText(gd::string, int);

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void textInputOpened(CCTextInputNode*) {}
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x292fc0;
    virtual void uploadMessageFinished(int) = win 0x2935a0, imac 0x296b40;
    virtual void uploadMessageFailed(int) = win 0x293620, imac 0x296c00;
    virtual void onClosePopup(UploadActionPopup*) = win 0x2936d0, imac 0x296d30;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x293770, imac 0x296e80;
    virtual void textInputShouldOffset(CCTextInputNode*, float);
    virtual void textInputReturn(CCTextInputNode*);
}

[[link(android)]]
class GManager : cocos2d::CCNode {
    // virtual ~GManager();

    TodoReturn getCompressedSaveString();
    TodoReturn getSaveString();
    TodoReturn load();
    void loadDataFromFile(gd::string const&) = win 0x6aa90, imac 0x498880;
    void loadFromCompressedString(gd::string&);
    void loadFromString(gd::string&);
    void save();
    TodoReturn saveData(DS_Dictionary*, gd::string);
    void saveGMTo(gd::string) = win 0x6a9a0;
    TodoReturn tryLoadData(DS_Dictionary*, gd::string const&);
    inline GManager() {}

    virtual bool init() = win 0x6a7c0, imac 0x498370;
    virtual void setup() = win 0x6a7d0, imac 0x498390;
    virtual void encodeDataTo(DS_Dictionary*);
    virtual void dataLoaded(DS_Dictionary*);
    virtual void firstLoad();

    gd::string m_fileName;
    bool m_setup;
    bool m_saved;
    bool m_quickSave;
}

[[link(android)]]
class GooglePlayDelegate {
    virtual void googlePlaySignedIn() {}
}

[[link(android)]]
class GooglePlayManager : cocos2d::CCNode {
    // virtual ~GooglePlayManager();

    static GooglePlayManager* sharedState();

    void googlePlaySignedIn();

    virtual bool init();
}

[[link(android)]]
class GradientTriggerObject : EffectGameObject {
    // virtual ~GradientTriggerObject();

    static GradientTriggerObject* create();

    virtual bool init();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = imac 0x18be20;
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class GraphicsReloadLayer : cocos2d::CCLayer {
    // virtual ~GraphicsReloadLayer();

    static GraphicsReloadLayer* create(cocos2d::TextureQuality, cocos2d::CCSize, bool, bool, bool);

    bool init(cocos2d::TextureQuality, cocos2d::CCSize, bool, bool, bool);
    TodoReturn performReload();
    static cocos2d::CCScene* scene(cocos2d::TextureQuality, cocos2d::CCSize, bool, bool, bool);
}

[[link(android)]]
class GravityEffectSprite : cocos2d::CCSprite {
    // virtual ~GravityEffectSprite();

    static GravityEffectSprite* create();

    TodoReturn updateSpritesColor(cocos2d::ccColor3B);

    virtual bool init();
    virtual void draw();
}

[[link(android), depends(KeyframeObject)]]
class GroupCommandObject2 {
    // ~GroupCommandObject2();
    // GroupCommandObject2();
    // GroupCommandObject2(GroupCommandObject2 const&);

    TodoReturn reset();
    TodoReturn resetDelta(bool);
    TodoReturn runFollowCommand(double, double, double);
    TodoReturn runMoveCommand(cocos2d::CCPoint, double, int, double, bool, bool, bool, bool, double, double);
    TodoReturn runPlayerFollowCommand(double, double, int, double, double);
    TodoReturn runRotateCommand(double, double, int, double, bool, int);
    TodoReturn runTransformCommand(double, int, double);
    TodoReturn step(float);
    TodoReturn stepTransformCommand(float, bool, bool);
    TodoReturn updateAction(int, float);
    TodoReturn updateEffectAction(float, int);

    PAD = win 0x1b8;
    gd::vector<KeyframeObject> m_unkVecKeyframeObject;
    PAD = win 0x8;
    GameObject* m_gameObject;
    PAD = win 0x8;
    gd::vector<int> m_unkVecInt;
    PAD = win 0x8;
}

[[link(android)]]
class HardStreak : cocos2d::CCDrawNode {
    // virtual ~HardStreak();

    static HardStreak* create() = win 0x2b1560;

    void addPoint(cocos2d::CCPoint p0) = win 0x2b2010, imac 0x9ce00;
    TodoReturn clearAboveXPos(float);
    TodoReturn clearBehindXPos(float);
    HardStreak* createDuplicate() {
    	auto ret = HardStreak::create();
    	ret->setBlendFunc(this->getBlendFunc());
    	ret->m_currentPoint = m_currentPoint;
    	ret->m_isSolid = m_isSolid;
    	ret->m_waveSize = m_waveSize;
    	ret->m_isSolid = m_isSolid;
    	ret->m_isFlipped = m_isFlipped;
    	ret->m_pulseSize = m_pulseSize;
    	ret->setOpacity(this->getOpacity());
    	ret->setColor(this->getColor());

    	CCObject* obj;
    	CCARRAY_FOREACH(m_pointArray, obj){
    		auto nodePoint = static_cast<PointNode*>(obj);
    		ret->addPoint(nodePoint->m_point);
    	}

    	return ret;
    }
    void firstSetup();
    TodoReturn normalizeAngle(double);
    TodoReturn quadCornerOffset(cocos2d::CCPoint, cocos2d::CCPoint, float);
    void reset() {
    	this->clear();
    	m_pointArray->removeAllObjects();
    }
    void resumeStroke();
    TodoReturn scheduleAutoUpdate();
    void stopStroke() = win 0x2b16d0;
    callback void updateStroke(float) = win 0x2b1710;

    virtual bool init();

    cocos2d::CCArray* m_pointArray;
    cocos2d::CCPoint m_currentPoint;
    float m_waveSize;
    float m_pulseSize;
    bool m_isSolid;
    bool m_isFlipped;
    bool m_drawStreak;
}

[[link(android)]]
class HSVLiveOverlay : FLAlertLayer, HSVWidgetDelegate {
    // virtual ~HSVLiveOverlay();
    HSVLiveOverlay() {
    	m_object = nullptr;
    	m_objects = nullptr;
    	m_controls = nullptr;
    	m_unkArray = nullptr;
    	m_delegate = nullptr;
    	m_activeTab = -1;
    	m_widget = nullptr;
    	m_unkBool1 = false;
    	m_unkBool2 = false;
    	m_unkBool3 = false;
    }

    static HSVLiveOverlay* create(GameObject* object, cocos2d::CCArray* objects) {
    	auto ret = new HSVLiveOverlay();
    	if (ret->init(object, objects)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void closeColorSelect(cocos2d::CCObject* sender);
    void createHSVWidget(int) = win 0x2b28f0, imac 0x258800;
    void determineStartValues() = win 0x2b2670, imac 0x2586d0;
    bool init(GameObject*, cocos2d::CCArray*) = win 0x2b21d0, imac 0x258280;
    void onSelectTab(cocos2d::CCObject* sender) = win 0x2b28c0, imac 0x2587c0;
    void toggleControls(bool);

    virtual void keyBackClicked();
    virtual void show();
    virtual void hsvChanged(ConfigureHSVWidget*) = win 0x2b2ae0;

    GameObject* m_object;
    cocos2d::CCArray* m_objects;
    cocos2d::CCArray* m_controls;
    cocos2d::CCArray* m_unkArray;
    ColorSelectDelegate* m_delegate;
    int m_activeTab;
    ConfigureHSVWidget* m_widget;
    bool m_unkBool1;
    bool m_unkBool2;
    bool m_unkBool3;
}

[[link(android)]]
class HSVWidgetDelegate {
    virtual void hsvPopupClosed(HSVWidgetPopup*, cocos2d::ccHSVValue) {}
    virtual void hsvChanged(ConfigureHSVWidget*) {}
}

[[link(android)]]
class HSVWidgetPopup : FLAlertLayer {
    // virtual ~HSVWidgetPopup();

    static HSVWidgetPopup* create(cocos2d::ccHSVValue, HSVWidgetDelegate*, gd::string) = win 0x96410;

    bool init(cocos2d::ccHSVValue, HSVWidgetDelegate*, gd::string) = win 0x96530, imac 0x41bf80;
    void onClose(cocos2d::CCObject* sender) = win 0x96860;

    virtual void keyBackClicked();

    ConfigureHSVWidget* m_widget;
    HSVWidgetDelegate* m_delegate;
}

[[link(android)]]
class InfoAlertButton : CCMenuItemSpriteExtra {
    // virtual ~InfoAlertButton();

    static InfoAlertButton* create(gd::string title, gd::string desc, float spriteScale) = win 0x2b2c60;

    bool init(gd::string title, gd::string desc, float spriteScale) = imac 0x55e170;

    virtual void activate();

    gd::string m_title;
    gd::string m_description;
    float m_textScale;
    bool m_scroll;
}

[[link(android)]]
class InfoLayer : FLAlertLayer, LevelCommentDelegate, CommentUploadDelegate, FLAlertLayerProtocol {
    // virtual ~InfoLayer();

    static InfoLayer* create(GJGameLevel*, GJUserScore*, GJLevelList*) = win 0x2b30e0, imac 0x798060;

    TodoReturn confirmReport(cocos2d::CCObject*) = win 0x2b5660;
    int getAccountID();
    int getID() {
    	if(m_score) return m_score->m_userID;
    	if(m_levelList) return - m_levelList->m_listID;
    	if(m_level) return m_level->m_levelID;
    	return 0;
    }
    int getRealID();
    TodoReturn getSpriteButton(char const*, cocos2d::SEL_MenuHandler, cocos2d::CCMenu*, float, cocos2d::CCPoint) = win 0x2b51c0;
    bool init(GJGameLevel*, GJUserScore*, GJLevelList*) = win 0x2b3280;
    bool isCorrect(char const*);
    void loadPage(int, bool) = win 0x2b6b60, imac 0x79b120;
    void onClose(cocos2d::CCObject* sender) = win 0x2b69a0;
    void onComment(cocos2d::CCObject* sender) = win 0x2b5e00;
    void onCopyLevelID(cocos2d::CCObject* sender) = imac 0x34bdf0;
    void onGetComments(cocos2d::CCObject* sender) = imac 0x79b110;
    void onLevelInfo(cocos2d::CCObject* sender) = win 0x2b63c0;
    void onMore(cocos2d::CCObject* sender) = win 0x2b5ce0, imac 0x79a250;
    void onNextPage(cocos2d::CCObject* sender) = win 0x2b7740, imac 0x79adc0;
    void onOriginal(cocos2d::CCObject* sender) = win 0x2b5d40;
    void onPrevPage(cocos2d::CCObject* sender) = win 0x2b7750, imac 0x79ada0;
    void onRefreshComments(cocos2d::CCObject* sender);
    void onSimilar(cocos2d::CCObject* sender);
    TodoReturn reloadWindow() = win 0x2b7ad0;
    void setupCommentsBrowser(cocos2d::CCArray*) = win 0x2b70d0, imac 0x79b4f0;
    void setupLevelInfo() = win 0x2b5300;
    void toggleCommentMode(cocos2d::CCObject* sender) = win 0x2b7cf0, imac 0x79aec0;
    void toggleExtendedMode(cocos2d::CCObject* sender);
    void toggleSmallCommentMode(cocos2d::CCObject* sender) = win 0x2b79e0;
    TodoReturn updateCommentModeButtons() = win 0x2b7db0;
    TodoReturn updateLevelsLabel();

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void show() = imac 0x79d150;
    virtual void loadCommentsFinished(cocos2d::CCArray*, char const*) = win 0x2b7360;
    virtual void loadCommentsFailed(char const*) = win 0x2b73d0;
    virtual void setupPageInfo(gd::string, char const*) = win 0x2b7420;
    virtual void commentUploadFinished(int) = win 0x2b7760, imac 0x79cd00;
    virtual void commentUploadFailed(int, CommentError) = win 0x2b7830, imac 0x79ce50;
    virtual void updateUserScoreFinished() = win 0x2b7610, imac 0x79cb60;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x2b5bc0, imac 0x79bf20;

    GJGameLevel* m_level;
    GJUserScore* m_score;
    GJLevelList* m_levelList;
    gd::string m_commentKey;
    LoadingCircle* m_loadingCircle;
    cocos2d::CCLabelBMFont* m_pageLabel;
    cocos2d::CCLabelBMFont* m_noComments;
    GJCommentListLayer* m_list;
    CCMenuItemSpriteExtra* m_rightArrow;
    CCMenuItemSpriteExtra* m_leftArrow;
    CCMenuItemSpriteExtra* m_likeBtn;
    CCMenuItemSpriteExtra* m_timeBtn;
    CCMenuItemSpriteExtra* m_reportBtn;
    CCMenuItemSpriteExtra* m_commentsBtn;
    CCMenuItemSpriteExtra* m_refreshCommentsBtn;
    int m_itemCount;
    int m_pageStartIdx;
    int m_pageEndIdx;
    int m_page;
    bool m_canUpdateUserScore;
    CommentKeyType m_mode;
}

[[link(android)]]
class InheritanceNode : cocos2d::CCObject {
    // virtual ~InheritanceNode();

    static InheritanceNode* create(int, InheritanceNode*);

    bool init(int, InheritanceNode*);
}

[[link(android)]]
class ItemInfoPopup : FLAlertLayer {
    // virtual ~ItemInfoPopup();

    static ItemInfoPopup* create(int, UnlockType) = win 0x273d10, imac 0x35b070;

    bool init(int, UnlockType);
    bool isUnlockedByDefault(int, UnlockType) = imac 0x35f190;
    static gd::string nameForUnlockType(int, UnlockType) = win 0x275dd0, imac 0x35eeb0;
    void onClose(cocos2d::CCObject* sender);
    void onCredit(cocos2d::CCObject* sender) = win 0x275da0, imac 0x35f1c0;

    virtual void keyBackClicked();

    int m_itemID;
    UnlockType m_unlockType;
    int m_accountID;
}

[[link(android)]]
class ItemTriggerGameObject : EffectGameObject {
    // virtual ~ItemTriggerGameObject();

    static ItemTriggerGameObject* create(char const*);

    bool init(char const*);

    virtual void customSetup();
    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = win 0x4a7020, imac 0x1d2fb0;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*) = win 0x4a7180;
}

[[link(android)]]
class KeybindingsLayer : FLAlertLayer {
    // virtual ~KeybindingsLayer();

    static KeybindingsLayer* create();

    TodoReturn addKeyPair(char const*, char const*);
    TodoReturn countForPage(int);
    void goToPage(int);
    TodoReturn incrementCountForPage(int);
    TodoReturn infoKey(int);
    TodoReturn layerForPage(int);
    TodoReturn layerKey(int);
    TodoReturn nextPosition(int);
    TodoReturn objectKey(int);
    TodoReturn objectsForPage(int);
    void onClose(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender);
    void onNextPage(cocos2d::CCObject* sender);
    void onPrevPage(cocos2d::CCObject* sender);
    void onToggle(cocos2d::CCObject* sender);
    TodoReturn pageKey(int);

    virtual bool init();
    virtual void keyBackClicked();
}

[[link(android)]]
class KeybindingsManager : cocos2d::CCNode {
    // virtual ~KeybindingsManager();

    static KeybindingsManager* sharedState();

    TodoReturn commandForKey(cocos2d::enumKeyCodes, GJKeyGroup, bool, bool, bool);
    TodoReturn commandForKeyMods(cocos2d::enumKeyCodes, GJKeyGroup);
    TodoReturn commandForKeyNoMods(cocos2d::enumKeyCodes, GJKeyGroup);
    TodoReturn commandToKeyForGroup(GJKeyGroup);
    void dataLoaded(DS_Dictionary*) = imac 0x4d1b60;
    void encodeDataTo(DS_Dictionary*);
    void firstSetup();
    TodoReturn groupForCommand(GJKeyCommand);
    TodoReturn keyForCommand(GJKeyCommand);
    TodoReturn keyToCommandForGroup(GJKeyGroup);

    virtual bool init();
}

[[link(android)]]
class KeyframeAnimTriggerObject : EffectGameObject {
    // virtual ~KeyframeAnimTriggerObject();

    static KeyframeAnimTriggerObject* create();

    virtual bool init();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class KeyframeGameObject : EffectGameObject {
    // virtual ~KeyframeGameObject();

    static KeyframeGameObject* create();

    TodoReturn updateShadowObjects(GJBaseGameLayer*, EditorUI*);

    virtual bool init();
    virtual void setOpacity(unsigned char) = win 0x49ca20, imac 0x1b5000;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class KeyframeObject {
    // KeyframeObject();
    // KeyframeObject(KeyframeObject const&);

    TodoReturn setupSpline(gd::vector<KeyframeObject*>&);

    PAD = win 0x20;
    gd::vector<double> m_unkVecDouble1;
    gd::vector<double> m_unkVecDouble2;
    gd::vector<double> m_unkVecDouble3;
    gd::vector<double> m_unkVecDouble4;
    gd::vector<double> m_unkVecDouble5;
    PAD = win 0x29;
    gd::vector<double> m_unkVecDouble6;
    gd::vector<double> m_unkVecDouble7;
    gd::vector<double> m_unkVecDouble8;
    gd::vector<double> m_unkVecDouble9;
    gd::vector<double> m_unkVecDouble10;
    PAD = win 0x80;
}

[[link(android)]]
class LabelGameObject : EffectGameObject {
    // virtual ~LabelGameObject();

    static LabelGameObject* create();

    TodoReturn createLabel(gd::string);
    TodoReturn queueUpdateLabel(gd::string);
    TodoReturn removeLabel();
    TodoReturn unlockLabelColor();
    TodoReturn updateLabel(float) = win 0x49ad80;
    TodoReturn updateLabel(gd::string) = imac 0x1afdc0;
    TodoReturn updateLabelAlign(int);
    TodoReturn updateLabelIfDirty();
    TodoReturn updatePreviewLabel() = win 0x49abc0;

    virtual bool init();
    virtual void setOpacity(unsigned char);
    virtual void setupCustomSprites(gd::string);
    virtual void addMainSpriteToParent(bool);
    virtual void resetObject();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = imac 0x1aff90;
    virtual gd::string getSaveString(GJBaseGameLayer*);
    virtual void setObjectColor(cocos2d::ccColor3B const&);
    virtual void updateTextKerning(int) = imac 0x1af930;
    virtual int getTextKerning();

    PAD = android32 0x11;

    // property 391
    int m_alignment;

    // property 389
    bool m_showSecondsOnly;

    // property 390
    int m_shownSpecial;

    // property 466
    bool m_isTimeCounter;

    // property 488
    int m_kerning;

    PAD = android32 0x8;
}

[[link(android)]]
class LeaderboardManagerDelegate {
    virtual void updateUserScoreFinished() {}
    virtual void updateUserScoreFailed() {}
    virtual void loadLeaderboardFinished(cocos2d::CCArray*, char const*) {}
    virtual void loadLeaderboardFailed(char const*) {}
}

[[link(android)]]
class LeaderboardsLayer : cocos2d::CCLayer, LeaderboardManagerDelegate, FLAlertLayerProtocol {
    // virtual ~LeaderboardsLayer();
    inline LeaderboardsLayer() {
    	m_list = nullptr;
    	m_userScores = nullptr;
    	m_state = LeaderboardState::Default;
    	m_topBtn = nullptr;
    	m_globalBtn = nullptr;
    	m_creatorsBtn = nullptr;
    	m_friendsBtn = nullptr;
    	m_circle = nullptr;
    	m_noInternet = nullptr;
    	m_tabs = nullptr;
    }

    static LeaderboardsLayer* create(LeaderboardState state) {
    	auto ret = new LeaderboardsLayer();
    	if (ret->init(state)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(LeaderboardState) = win 0x2b9bb0;
    bool isCorrect(char const*);
    void onBack(cocos2d::CCObject* sender) = win 0x2bbdb0;
    void onCreators(cocos2d::CCObject* sender);
    void onGlobal(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender);
    void onTop(cocos2d::CCObject* sender);
    void onWeek(cocos2d::CCObject* sender);
    void refreshTabs() = win 0x2bab60;
    static cocos2d::CCScene* scene(LeaderboardState state) {
    	auto scene = cocos2d::CCScene::create();
    	auto layer = LeaderboardsLayer::create(state);
    	scene->addChild(layer);
    	return scene;
    }
    void selectLeaderboard(LeaderboardState) = win 0x2bac90, imac 0x4fc470;
    void setupLevelBrowser(cocos2d::CCArray*) = win 0x2baa00;
    TodoReturn setupTabs();
    void toggleTabButtons() = win 0x2baee0;

    virtual void keyBackClicked();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool);
    virtual void updateUserScoreFinished() = win 0x2bb0d0, imac 0x4fca30;
    virtual void updateUserScoreFailed();
    virtual void loadLeaderboardFinished(cocos2d::CCArray*, char const*) = win 0x2bb100, imac 0x4fcb30;
    virtual void loadLeaderboardFailed(char const*) = win 0x2bb190;

    GJListLayer* m_list;
    cocos2d::CCArray* m_userScores;
    LeaderboardState m_state;
    CCMenuItemToggler* m_topBtn;
    CCMenuItemToggler* m_globalBtn;
    CCMenuItemToggler* m_creatorsBtn;
    CCMenuItemToggler* m_friendsBtn;
    LoadingCircle* m_circle;
    TextArea* m_noInternet;
    cocos2d::CCArray* m_tabs;
}

[[link(android)]]
class LevelAreaInnerLayer : cocos2d::CCLayer, DialogDelegate {
    // virtual ~LevelAreaInnerLayer();

    static LevelAreaInnerLayer* create(bool);

    bool init(bool) = win 0x2be180;
    void onBack(cocos2d::CCObject* sender) = win 0x2c0310;
    void onDoor(cocos2d::CCObject* sender) = win 0x2bfe40, imac 0x268460;
    void onInfo(cocos2d::CCObject* sender);
    void onNextFloor(cocos2d::CCObject* sender);
    bool playStep1();
    static cocos2d::CCScene* scene(bool) = win 0x2be070;
    cocos2d::CCAction* showFloor1CompleteDialog();
    TodoReturn tryResumeTowerMusic();

    virtual void keyBackClicked() = win 0x2c0370;
    virtual void dialogClosed(DialogLayer*) = win 0x2bf810, imac 0x269250;
}

[[link(android)]]
class LevelAreaLayer : cocos2d::CCLayer, DialogDelegate {
    // virtual ~LevelAreaLayer();

    static LevelAreaLayer* create();

    cocos2d::CCAction* addGodRay(float, float, float, float, float, cocos2d::CCPoint);
    void addTorch(cocos2d::CCNode*, cocos2d::CCPoint, int, float, int, bool);
    cocos2d::CCAction* fadeInsideTower();
    void onBack(cocos2d::CCObject* sender);
    void onClickDoor(cocos2d::CCObject* sender);
    bool onEnterTower();
    static cocos2d::CCScene* scene();
    cocos2d::CCAction* showDialog();

    virtual bool init() = imac 0x2651d0;
    virtual void keyBackClicked();
    virtual void dialogClosed(DialogLayer*);
}

[[link(android)]]
class LevelBrowserLayer : cocos2d::CCLayerColor, LevelManagerDelegate, FLAlertLayerProtocol, SetIDPopupDelegate, SetTextPopupDelegate, TableViewCellDelegate, ShareCommentDelegate {
    ~LevelBrowserLayer() = win 0x2c05e0, imac 0x4773a0;
    LevelBrowserLayer() {}

    static LevelBrowserLayer* create(GJSearchObject*) = win 0x2c0810, imac 0x4775e0;
    static cocos2d::CCScene* scene(GJSearchObject* search) = win 0x2c07c0;

    TodoReturn createNewLevel(cocos2d::CCObject*);
    TodoReturn createNewList(cocos2d::CCObject*) = imac 0x47d990;
    TodoReturn createNewSmartTemplate(cocos2d::CCObject*);
    TodoReturn deleteSelected();
    TodoReturn exitLayer(cocos2d::CCObject*);
    cocos2d::CCArray* getItemsMatchingSearch(cocos2d::CCArray*, gd::string, GJSearchObject*) = win 0x2c69a0;
    gd::string getSearchTitle() = win 0x2c3800;
    bool init(GJSearchObject*) = win 0x2c0880;
    bool isCorrect(char const*) = win 0x2c2190;
    void loadPage(GJSearchObject*) = win 0x2c2360, imac 0x47aa50;
    void onClearSearch(cocos2d::CCObject* sender) = win 0x2c65c0, imac 0x47a9d0;
    void onDeleteAll(cocos2d::CCObject* sender) = win 0x2c6010, imac 0x479d70;
    void onDeleteSelected(cocos2d::CCObject* sender) = win 0x2c6d30, imac 0x479430;
    void onFavorites(cocos2d::CCObject* sender) = win 0x2c5e50;
    void onGoToFolder(cocos2d::CCObject* sender) = win 0x2c45e0;
    void onGoToLastPage(cocos2d::CCObject* sender);
    void onGoToPage(cocos2d::CCObject* sender) = win 0x2c44d0, imac 0x479320;
    void onHelp(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender) = win 0x2c4c10, imac 0x47a290;
    void onLocalMode(cocos2d::CCObject* sender) = win 0x2c5a90;
    void onMyOnlineLevels(cocos2d::CCObject* sender) = win 0x2c5c80, imac 0x4798a0;
    void onNew(cocos2d::CCObject* sender) = win 0x2c55e0, imac 0x4797b0;
    void onNextPage(cocos2d::CCObject* sender);
    void onPrevPage(cocos2d::CCObject* sender);
    void onRefresh(cocos2d::CCObject* sender) = win 0x2c6480;
    void onRemoveAllFavorites(cocos2d::CCObject* sender);
    void onSaved(cocos2d::CCObject* sender) = win 0x2c5f30;
    void onSavedMode(cocos2d::CCObject* sender) = win 0x2c59b0;
    void onSearch(cocos2d::CCObject* sender) = win 0x2c6660;
    void onToggleAllObjects(cocos2d::CCObject* sender) = win 0x2c7070, imac 0x479720;
    void reloadAllObjects() {
    	static_cast<CustomListView*>(m_list->m_listView)->reloadAll();
    }
    void setSearchObject(GJSearchObject*);
    void setupLevelBrowser(cocos2d::CCArray*) = win 0x2c34f0, imac 0x47c2e0;
    void show();
    void updateLevelsLabel();
    void updatePageLabel() = win 0x2c4890, imac 0x479200;

    virtual void onEnter() = win 0x2c76d0;
    virtual void onEnterTransitionDidFinish();
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void registerWithTouchDispatcher() = win 0x2c7810, imac 0x47e490;
    virtual void keyBackClicked();
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x2c4b70, imac 0x47d830;
    virtual void loadLevelsFinished(cocos2d::CCArray*, char const*, int) = win 0x2c4060;
    virtual void loadLevelsFailed(char const*, int);
    virtual void setupPageInfo(gd::string, char const*) = win 0x2c41e0;
    virtual void onBack(cocos2d::CCObject* sender) = win 0x2c4ac0, imac 0x47d740;
    virtual void shareCommentClosed(gd::string, ShareCommentLayer*) = win 0x2c5b70, imac 0x47db20;
    virtual void setTextPopupClosed(SetTextPopup*, gd::string) = win 0x2c68e0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x2c7110, imac 0x31810;
    virtual void setIDPopupClosed(SetIDPopup*, int) = win 0x2c4690, imac 0x47d610;
    virtual cocos2d::CCArray* updateResultArray(cocos2d::CCArray*) = win 0x2c0590;
    virtual bool cellPerformedAction(TableViewCell*, int, CellAction, cocos2d::CCNode*) = win 0x2c7770, imac 0x47e360;

    bool m_unk;
    bool m_allSelected;
    TextArea* m_noInternet;
    GJListLayer* m_list;
    CCMenuItemSpriteExtra* m_rightArrow;
    CCMenuItemSpriteExtra* m_leftArrow;
    CCMenuItemSpriteExtra* m_lastBtn;
    CCMenuItemSpriteExtra* m_cancelSearchBtn;
    CCMenuItemSpriteExtra* m_refreshBtn;
    cocos2d::CCArray* m_levels;
    GJSearchObject* m_searchObject;
    cocos2d::CCLabelBMFont* m_countText;
    cocos2d::CCLabelBMFont* m_pageText;
    CCMenuItemSpriteExtra* m_pageBtn;
    cocos2d::CCLabelBMFont* m_folderText;
    CCMenuItemSpriteExtra* m_folderBtn;
    CCMenuItemToggler* m_allObjectsToggler;
    int m_itemCount;
    int m_pageStartIdx;
    int m_pageEndIdx;
    LoadingCircle* m_circle;
    int m_lastPage;
    bool m_isOverlay;
    cocos2d::CCScene* m_scene;
    int m_zOffset;
    bool m_unk2;
    int m_listHeight;
    float m_unkFloat;
    float m_unkFloat2;
    TableViewCellDelegate* m_delegate;
    bool m_cached;
}

[[link(android)]]
class LevelCell : TableViewCell {
    // virtual ~LevelCell();
    LevelCell(char const*, float, float);

    static LevelCell* create(float, float) = imac 0x23c3a0;

    void loadCustomLevelCell() = win 0xadb20;
    void loadFromLevel(GJGameLevel*) = win 0xad940, imac 0x232600;
    void loadLocalLevelCell() = win 0xb05f0;
    void onClick(cocos2d::CCObject* sender) = win 0xb1080, imac 0x23f990;
    void onToggle(cocos2d::CCObject* sender);
    void onViewProfile(cocos2d::CCObject* sender) = win 0xb12a0, imac 0x23faf0;
    void updateBGColor(int);
    void updateCellMode(int) = win 0xb0df0, imac 0x23bfa0;
    void updateToggle();

    virtual bool init() = win 0xad920, imac 0x23c550;
    virtual void draw() = win 0xb12e0;

    CCMenuItemSpriteExtra* m_button;
    GJGameLevel* m_level;
    bool m_cellDrawn;
    CCMenuItemToggler* m_toggler;
    cocos2d::CCPoint m_point;
    cocos2d::CCMenu* m_mainMenu;
    bool m_compactView;
    int m_cellMode;
}

[[link(android)]]
class LevelCommentDelegate {
    virtual void loadCommentsFinished(cocos2d::CCArray*, char const*) {}
    virtual void loadCommentsFailed(char const*) {}
    virtual void updateUserScoreFinished() {}
    virtual void setupPageInfo(gd::string, char const*) {}
}

[[link(android)]]
class LevelDeleteDelegate {
    virtual void levelDeleteFinished(int) {}
    virtual void levelDeleteFailed(int) {}
}

[[link(android)]]
class LevelDownloadDelegate {
    virtual void levelDownloadFinished(GJGameLevel*) {}
    virtual void levelDownloadFailed(int) {}
}

[[link(android)]]
class LevelEditorLayer : GJBaseGameLayer, LevelSettingsDelegate {
    // virtual ~LevelEditorLayer();
    LevelEditorLayer() = win 0x2c84f0;

    static LevelEditorLayer* get() {
        return GameManager::sharedState()->m_levelEditorLayer;
    }

    static LevelEditorLayer* create(GJGameLevel*, bool) = win 0x2c9470, imac 0xdab10;

    TodoReturn activateTriggerEffect(EffectGameObject*, float, float, float, bool);
    TodoReturn addDelayedSpawn(EffectGameObject*, float);
    TodoReturn addExclusionList(cocos2d::CCArray*, cocos2d::CCDictionary*);
    TodoReturn addObjectFromVector(gd::vector<gd::string>&, gd::vector<void*>&);
    TodoReturn addObjectsAtPosition(cocos2d::CCPoint, cocos2d::CCArray*, cocos2d::CCArray*);
    TodoReturn addObjectsInRect(cocos2d::CCRect, bool, cocos2d::CCArray*, cocos2d::CCArray*);
    TodoReturn addObjectToGroup(GameObject*, int);
    TodoReturn addPlayer2Point(cocos2d::CCPoint, bool);
    TodoReturn addPlayerCollisionBlock();
    TodoReturn addPlayerPoint(cocos2d::CCPoint);
    void addSpecial(GameObject*) = win 0x2cf2c0;
    TodoReturn addToRedoList(UndoObject*);
    TodoReturn addTouchPoint(cocos2d::CCPoint);
    TodoReturn addToUndoList(UndoObject*, bool) = imac 0xdfb10;
    TodoReturn applyAttributeState(GameObject*, GameObject*);
    TodoReturn applyGroupState(GameObject*, GameObject*);
    TodoReturn breakApartTextObject(TextGameObject*);
    bool canPasteState();
    TodoReturn clearPlayerPoints();
    TodoReturn clearTouchPoints();
    TodoReturn copyObjectState(GameObject*);
    TodoReturn copyParticleState(ParticleGameObject*);
    GameObject* createObject(int, cocos2d::CCPoint, bool) = win 0x2cbdb0;
    void createObjectsFromSetup(gd::string&);
    cocos2d::CCArray* createObjectsFromString(gd::string const&, bool, bool) = win 0x2cb740;
    TodoReturn dirtifyTriggers();
    TodoReturn duplicateKeyframeAnimation(int);
    TodoReturn fastUpdateDisabledGroups();
    int findGameObject(int);
    TodoReturn findStartPosObject();
    TodoReturn forceShowSelectedObjects(bool);
    TodoReturn fullUpdateDisabledGroups();
    TodoReturn getAllObjects();
    TodoReturn getDelayedSpawnNode();
    TodoReturn getGridPos(cocos2d::CCPoint);
    TodoReturn getLastObjectX() = imac 0xece30;
    gd::string getLevelString() = win 0x2ce350, imac 0xe3360;
    TodoReturn getLockedLayers();
    TodoReturn getNextColorChannel();
    int getNextFreeAreaEffectID(cocos2d::CCArray*) = win 0x2d24f0;
    TodoReturn getNextFreeBlockID(cocos2d::CCArray*);
    int getNextFreeEditorLayer(cocos2d::CCArray*);
    TodoReturn getNextFreeEnterChannel(cocos2d::CCArray*);
    int getNextFreeGradientID(cocos2d::CCArray*) = win 0x2d25d0;
    int getNextFreeGroupID(cocos2d::CCArray*) = win 0x2d1e50, imac 0xeb4f0;
    int getNextFreeItemID(cocos2d::CCArray*) = win 0x2d20d0;
    TodoReturn getNextFreeOrderChannel(cocos2d::CCArray*);
    TodoReturn getNextFreeSFXGroupID(cocos2d::CCArray*);
    TodoReturn getNextFreeSFXID(cocos2d::CCArray*);
    TodoReturn getObjectRect(GameObject*, bool, bool) = win 0x2ccf10;
    TodoReturn getRelativeOffset(GameObject*);
    TodoReturn getSavedEditorPosition(int) = imac 0xe9050;
    TodoReturn getSavedEditorPositions() = imac 0xe9090;
    TodoReturn getSectionCount() = imac 0xe94b0;
    TodoReturn getSelectedEditorOrder();
    TodoReturn getSelectedEffectPos();
    TodoReturn getSelectedOrderChannel();
    TodoReturn getSFXIDs();
    TodoReturn getSongIDs(bool&);
    TodoReturn getTriggerGroup(int);
    void handleAction(bool, cocos2d::CCArray*) = win 0x2cdc50, imac 0xe2a40;
    bool hasAction(bool);
    bool init(GJGameLevel*, bool) = win 0x2c9500;
    bool isLayerLocked(int layer) {
    	if (layer < 10000 && m_layerLockingEnabled) {
    		return m_lockedLayers.at(layer);
    	}
    	return false;
    }
    GameObject* objectAtPosition(cocos2d::CCPoint) = win 0x2cc760;
    TodoReturn objectMoved(GameObject*) = imac 0xe9c00;
    TodoReturn objectsAtPosition(cocos2d::CCPoint);
    cocos2d::CCArray* objectsInRect(cocos2d::CCRect, bool);
    void onPausePlaytest();
    void onPlaytest() = win 0x2d7150;
    void onResumePlaytest() = win 0x2d7b80;
    void onStopPlaytest() = win 0x2d7d70;
    TodoReturn pasteAttributeState(GameObject*, cocos2d::CCArray*);
    TodoReturn pasteColorState(GameObject*, cocos2d::CCArray*);
    TodoReturn pasteGroupState(GameObject*, cocos2d::CCArray*);
    TodoReturn pasteParticleState(ParticleGameObject*, cocos2d::CCArray*);
    void processLoadedMoveActions() = imac 0xb7220;
    TodoReturn quickUpdateAllPositions() = win 0x2d6ee0;
    TodoReturn recreateGroups();
    void redoLastAction() {
    	return this->handleAction(false, m_redoObjects);
    }
    TodoReturn refreshSpecial(GameObject*);
    TodoReturn removeAllObjects();
    TodoReturn removeAllObjectsOfType(int) = win 0x2cd9d0;
    TodoReturn removeObject(GameObject*, bool) = imac 0xe20e0;
    TodoReturn removePlayerCollisionBlock();
    void removeSpecial(GameObject*) = win 0x2cf9d0, imac 0xe21a0;
    TodoReturn resetDelayedSpawnNodes();
    TodoReturn resetEffectTriggerOptim(GameObject*, cocos2d::CCArray*);
    void resetMovingObjects();
    void resetObjectVector();
    TodoReturn resetPlayback();
    TodoReturn resetToggledGroups();
    TodoReturn resetToggledGroupsAndObjects();
    TodoReturn resetUnusedColorChannels();
    TodoReturn reverseKeyframeAnimationOrder(int);
    TodoReturn reverseObjectChanged(EffectGameObject*);
    TodoReturn rotationForSlopeNearObject(GameObject*) = imac 0xe0a70;
    TodoReturn runColorEffect(EffectGameObject*, int, float, float, bool);
    TodoReturn saveEditorPosition(cocos2d::CCPoint&, int) = imac 0xe9030;
    static cocos2d::CCScene* scene(GJGameLevel* level, bool p1) {
    	auto scene = cocos2d::CCScene::create();
    	auto layer = LevelEditorLayer::create(level, p1);
    	scene->addChild(layer);
    	return scene;
    }
    void setObjectCount(int);
    TodoReturn shouldBlend(int);
    TodoReturn sortBatchnodeChildren(float);
    TodoReturn spawnGroupPreview(int, float, float, float, float, float, bool, bool);
    TodoReturn stopPlayback();
    TodoReturn stopTriggersInGroup(int, float);
    TodoReturn timeObjectChanged();
    TodoReturn toggleBackground(bool);
    TodoReturn toggleGrid(bool);
    TodoReturn toggleGround(bool) = imac 0xdeb80;
    TodoReturn toggleGroupPreview(int, bool);
    TodoReturn toggleLockActiveLayer();
    TodoReturn transferDefaultColors(GJEffectManager*, GJEffectManager*);
    TodoReturn triggerFollowCommand(EffectGameObject*);
    TodoReturn triggerPlayerFollowCommand(EffectGameObject*);
    TodoReturn triggerRotateCommand(EffectGameObject*);
    bool tryUpdateSpeedObject(EffectGameObject*, bool) = win 0x2cffb0, imac 0xe9a70;
    bool typeExistsAtPosition(int, cocos2d::CCPoint, bool, bool, float) = win 0x2cc160;
    void undoLastAction() {
    	return this->handleAction(true, m_undoObjects);
    }
    TodoReturn unlockAllLayers() = imac 0xe9560;
    TodoReturn updateAnimateOnTriggerObjects(bool);
    TodoReturn updateArt(float);
    TodoReturn updateBlendValues();
    void updateEditor(float) = win 0x2d0150, imac 0xdd440;
    void updateEditorMode() = win 0x2d2c30, imac 0xde7b0;
    void updateGameObjects() = imac 0xdd840;
    TodoReturn updateGridLayer();
    TodoReturn updateGridLayerParent();
    TodoReturn updateKeyframeObjects() = win 0x2d92b0, imac 0xeaf50;
    TodoReturn updateKeyframeVisibility(bool);
    void updateLevelFont(int) = win 0x2d64f0;
    void updateObjectColors(cocos2d::CCArray* gameObjects) = win 0x2d15b0, imac 0xeb000;
    static void updateObjectLabel(GameObject*) = win 0x2ced60, imac 0xe95b0;
    void updateOptions();
    void updatePreviewAnim();
    void updatePreviewParticle(ParticleGameObject*) = imac 0x1a1120;
    void updatePreviewParticles();
    TodoReturn updateToggledGroups();
    TodoReturn validGroup(GameObject*, bool);

    virtual void draw();
    virtual void postUpdate(float) = win 0x2d86f0, imac 0xf1aa0;
    virtual void updateVisibility(float) = win 0x2d0520, imac 0xea450;
    virtual TodoReturn playerTookDamage(PlayerObject*) = win 0x2d86e0, imac 0xf1a80;
    virtual void updateColor(cocos2d::ccColor3B& color, float fadeTime, int colorID, bool blending, float opacity, cocos2d::ccHSVValue& copyHSV, int colorIDToCopy, bool copyOpacity, EffectGameObject* callerObject, int unk1, int unk2) = win 0x2d4ea0, imac 0xee810;
    virtual void updateDebugDraw() = win 0x2d9330;
    virtual void addToGroup(GameObject*, int, bool) = win 0x2d5e90, imac 0xef190;
    virtual void removeFromGroup(GameObject*, int) = win 0x2d5fe0;
    virtual void updateObjectSection(GameObject*) = win 0x2d6db0, imac 0xf0410;
    virtual TodoReturn updateDisabledObjectsLastPos(cocos2d::CCArray*) = win 0x2d7060;
    virtual float timeForPos(cocos2d::CCPoint, int, int, bool, int) = win 0x2d5d30, imac 0xeeb60;
    virtual float posForTime(float) = win 0x2d5da0, imac 0xeebf0;
    virtual void resetSPTriggered() = imac 0xeec90;
    virtual TodoReturn didRotateGameplay() = win 0x2d6d40, imac 0xf0210;
    virtual TodoReturn manualUpdateObjectColors(GameObject*) = win 0x2d1520;
    virtual TodoReturn claimCustomParticle(gd::string const&, cocos2d::ParticleStruct const&, int, int, int, bool) = win 0x2d8e80;
    virtual TodoReturn unclaimCustomParticle(gd::string const&, cocos2d::CCParticleSystemQuad*) = win 0x2d8f40, imac 0xf2a40;
    virtual TodoReturn activatedAudioTrigger(SFXTriggerGameObject*) = win 0x2d85e0, imac 0xf19a0;
    virtual void checkpointActivated(CheckpointGameObject*) = win 0x2d8610, imac 0xf19d0;
    virtual void addKeyframe(KeyframeGameObject*) = win 0x2d8f80, imac 0xf2a80;
    virtual void levelSettingsUpdated() = win 0x2cae50;

    bool m_drawTriggerBoxes;
    bool m_showGrid;
    bool m_hideGridOnPlay;
    bool m_drawEffectLines;
    bool m_showGround;
    bool m_showDurationLines;
    bool m_increaseMaxUndoRedo;
    bool m_hideBackground;
    bool m_gv0120;
    bool m_layerLockingEnabled;
    bool m_unkBool4;
    bool m_previewParticles;
    bool m_previewAnimations;
    bool m_previewShaders;
    bool m_hideParticleIcons;
    bool m_unkBool5;
    bool m_playTestSmoothFix;

    // haven't verified the mac and ios paddings
    PAD = win 0xf, android32 0xf, android64 0xf, mac 0xf, ios 0xf;

    cocos2d::CCArray* m_unkArr0;
    cocos2d::CCArray* m_unkArr1;
    cocos2d::CCArray* m_unkArr2;
    cocos2d::CCArray* m_unkArr3;
    cocos2d::CCArray* m_unkArr4;
    cocos2d::CCArray* m_unkArr8;
    cocos2d::CCArray* m_unkArr11;
    cocos2d::CCArray* m_unkArr12;
    cocos2d::CCArray* m_unkArr13;
    cocos2d::CCDictionary* m_unkDict3;
    cocos2d::CCArray* m_unkArr5;

    // haven't verified the mac and ios paddings
    PAD = win 0x10, android32 0x8, android64 0x10, mac 0x10, ios 0x10;

    cocos2d::CCDictionary* m_unkDict4;
    cocos2d::CCArray* m_unkArr7;
    bool m_unkBool3;
    bool m_unkBool2;
    geode::SeedValueRSV m_coinCount;

    // haven't verified the mac and ios paddings
    PAD = win 0x8, android32 0x8, android64 0x8, mac 0x8, ios 0x8;

    cocos2d::CCArray* m_unkArr6;

    // haven't verified the mac and ios paddings
    PAD = win 0x8, android32 0x4, android64 0x8, mac 0x8, ios 0x8;

    cocos2d::CCDictionary* m_unkDict1;
    cocos2d::CCDictionary* m_unkDict2;
    bool m_unkBool0;
    bool m_unkBool1;
    short m_currentLayer;

    // haven't verified the mac and ios paddings
    PAD = win 0x1c, android32 0x10, android64 0x1c, mac 0x1c, ios 0x1c;
    float m_trailTimer;
    PAD = win 0x4, android32 0x4, android64 0x4, mac 0x4, ios 0x4;

    EditorUI* m_editorUI;
    cocos2d::CCArray* m_undoObjects;
    cocos2d::CCArray* m_redoObjects;
    geode::SeedValueRSV m_objectCount;
    DrawGridLayer* m_drawGridLayer;
    bool m_unkBool;
    bool m_previewMode;

    // 2.206 win pad unknown
    PAD = win 0xfa, android32 0x7a, android64 0xf4;

    gd::vector<bool> m_lockedLayers;

    PAD = win 0xe8, android32 0x90, android64 0xf8;
}

[[link(android)]]
class LevelFeatureLayer : FLAlertLayer {
    // virtual ~LevelFeatureLayer();

    static LevelFeatureLayer* create(int);

    bool init(int);
    void onClose(cocos2d::CCObject* sender);
    void onDown(cocos2d::CCObject* sender);
    void onDown2(cocos2d::CCObject* sender);
    void onRemoveValues(cocos2d::CCObject* sender);
    void onSetEpicOnly(cocos2d::CCObject* sender);
    void onSetFeatured(cocos2d::CCObject* sender);
    void onToggleEpic(cocos2d::CCObject* sender);
    void onUp(cocos2d::CCObject* sender);
    void onUp2(cocos2d::CCObject* sender);
    TodoReturn updateStars();

    virtual void keyBackClicked();
}

[[link(android)]]
class LevelInfoLayer : cocos2d::CCLayer, LevelDownloadDelegate, LevelUpdateDelegate, RateLevelDelegate, LikeItemDelegate, FLAlertLayerProtocol, LevelDeleteDelegate, NumberInputDelegate, SetIDPopupDelegate, TableViewCellDelegate {
    // virtual ~LevelInfoLayer();
    // LevelInfoLayer() = ios 0x31658;

    static LevelInfoLayer* create(GJGameLevel* level, bool challenge) = win 0x2e2680, imac 0x2a8f40;

    void confirmClone(cocos2d::CCObject*) = win 0x2e8e20, imac 0x2adcc0;
    void confirmDelete(cocos2d::CCObject*) = win 0x2e8f90;
    void confirmMoveToBottom(cocos2d::CCObject*) = win 0x2ea6c0;
    void confirmMoveToTop(cocos2d::CCObject*) = win 0x2ea580, imac 0x2ae370;
    void confirmOwnerDelete(cocos2d::CCObject*);
    void downloadLevel() = win 0x2e5590;
    void incrementDislikes();
    void incrementLikes();
    bool init(GJGameLevel* level, bool challenge) = win 0x2e28b0;
    void loadLevelStep() = win 0x2e8820, imac 0x2b0010;
    void onAddToList(cocos2d::CCObject* sender) = win 0x2e4f80, imac 0x2ae680;
    void onBack(cocos2d::CCObject* sender) = win 0x2ebb00, imac 0x2adf10;
    void onClone(cocos2d::CCObject* sender);
    void onDelete(cocos2d::CCObject* sender);
    void onFavorite(cocos2d::CCObject* sender) = win 0x2e5250, imac 0x2ae2f0;
    void onFeatured(cocos2d::CCObject* sender);
    void onGarage(cocos2d::CCObject* sender) = win 0x2e53d0;
    void onInfo(cocos2d::CCObject* sender) = win 0x2e8980, imac 0x2ad5f0;
    void onLevelInfo(cocos2d::CCObject* sender) = win 0x2ea330;
    void onLevelOptions(cocos2d::CCObject* sender) = win 0x2ea1e0;
    void onLevelLeaderboard(cocos2d::CCObject* sender) = win 0x2e52f0, imac 0x2ad620;
    void onLike(cocos2d::CCObject* sender) = win 0x2e9c80;
    void onLowDetailMode(cocos2d::CCObject* sender);
    void onOwnerDelete(cocos2d::CCObject* sender);
    void onPlay(cocos2d::CCObject* sender) = win 0x2e79f0;
    void onPlayReplay(cocos2d::CCObject* sender);
    void onRate(cocos2d::CCObject* sender) = win 0x2e9500;
    void onRateDemon(cocos2d::CCObject* sender) = win 0x2e9b00, imac 0x2ad870;
    void onRateStars(cocos2d::CCObject* sender) = win 0x2e97e0;
    void onRateStarsMod(cocos2d::CCObject* sender) = win 0x2e9aa0, imac 0x2ada70;
    void onSetFolder(cocos2d::CCObject* sender) = win 0x2e5120, imac 0x2ae5e0;
    void onUpdate(cocos2d::CCObject* sender) = win 0x2ea0a0;
    void onViewProfile(cocos2d::CCObject* sender) = win 0x2ea280, imac 0x2ab460;
    void playStep2();
    void playStep3();
    void playStep4() = win 0x2e88d0;
    static cocos2d::CCScene* scene(GJGameLevel* level, bool challenge) = win 0x2e2630;
    void setupLevelInfo() = win 0x2e63e0;
    void setupPlatformerStats() = win 0x2e58a0;
    void setupProgressBars() = win 0x2e5cd0;
    bool shouldDownloadLevel();
    void showSongWarning() = imac 0x2afdd0;
    void showUpdateAlert(UpdateResponse) = win 0x2e7530, imac 0x2af910;
    void tryCloneLevel(cocos2d::CCObject*) = win 0x2e89c0;
    TodoReturn tryShowAd();
    void updateLabelValues() = win 0x2ea7f0, imac 0x2ae9a0;
    void updateSideButtons() = win 0x2e9de0;

    virtual void keyBackClicked() = win 0x2ebbf0;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x2ebc00, imac 0x2b0af0;
    virtual void numberInputClosed(NumberInputLayer*) = win 0x2e8c50;
    virtual bool cellPerformedAction(TableViewCell*, int, CellAction, cocos2d::CCNode*) = imac 0x2ae6e0;
    virtual void levelDownloadFinished(GJGameLevel*) = win 0x2e7030;
    virtual void levelDownloadFailed(int) = win 0x2e7390, imac 0x2af7b0;
    virtual void levelUpdateFinished(GJGameLevel*, UpdateResponse) = win 0x2e74c0, imac 0x2af8a0;
    virtual void levelUpdateFailed(int) = win 0x2e7620, imac 0x2afab0;
    virtual void levelDeleteFinished(int) = win 0x2e7750;
    virtual void levelDeleteFailed(int) = win 0x2e7890;
    virtual void rateLevelClosed() = win 0x2e9af0;
    virtual void likedItem(LikeItemType, int, bool) = win 0x2e9d70, imac 0x2b07e0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x2eb630, imac 0x2b08f0;
    virtual void setIDPopupClosed(SetIDPopup*, int);

    bool m_isBusy;
    cocos2d::CCMenu* m_playBtnMenu;
    GJGameLevel* m_level;
    cocos2d::CCArray* m_coins;
    CCMenuItemSpriteExtra* m_likeBtn;
    CCMenuItemSpriteExtra* m_starRateBtn;
    CCMenuItemSpriteExtra* m_demonRateBtn;
    void* m_unk2;
    cocos2d::CCLabelBMFont* m_lengthLabel;
    cocos2d::CCLabelBMFont* m_exactLengthLabel;
    cocos2d::CCLabelBMFont* m_downloadsLabel;
    cocos2d::CCLabelBMFont* m_likesLabel;
    cocos2d::CCLabelBMFont* m_orbsLabel;
    cocos2d::CCLabelBMFont* m_folderLabel;
    CCMenuItemSpriteExtra* m_cloneBtn;
    void* m_unk3;
    cocos2d::CCSprite* m_likesIcon;
    cocos2d::CCSprite* m_orbsIcon;
    int m_unk6;
    int m_unk7;
    LoadingCircle* m_circle;
    GJDifficultySprite* m_difficultySprite;
    cocos2d::CCSprite* m_starsIcon;
    cocos2d::CCLabelBMFont* m_starsLabel;
    cocos2d::CCArray* m_icons;
    PAD = win 0x10, android32 0x10, android64 0x10, mac 0x10, ios 0x10;
    bool m_challenge;
    PAD = win 0x8, android32 0x4, android64 0x8, mac 0x8, ios 0x8;
    cocos2d::CCSprite* m_playSprite;
    cocos2d::CCProgressTimer* m_progressTimer;
    CustomSongWidget* m_songWidget;
}

[[link(android)]]
class LevelLeaderboard : FLAlertLayer, LeaderboardManagerDelegate, FLAlertLayerProtocol {
    // virtual ~LevelLeaderboard();

    static LevelLeaderboard* create(GJGameLevel*, LevelLeaderboardType, LevelLeaderboardMode) = win 0x2ebda0, imac 0x3c6720;

    TodoReturn deleteLocalScores();
    TodoReturn getLocalScores();
    TodoReturn getSpriteButton(gd::string, cocos2d::SEL_MenuHandler, cocos2d::CCMenu*, float, cocos2d::CCPoint, int) = imac 0x3c7940;
    bool init(GJGameLevel*, LevelLeaderboardType, LevelLeaderboardMode) = win 0x2ebee0;
    bool isCorrect(char const*);
    void loadScores();
    void onChangeMode(cocos2d::CCObject* sender) = win 0x2edb60;
    void onChangeType(cocos2d::CCObject* sender) = win 0x2edac0;
    void onClose(cocos2d::CCObject* sender);
    void onDeleteLocalScores(cocos2d::CCObject* sender) = imac 0x3c7b60;
    void onUpdate(cocos2d::CCObject* sender) = win 0x2edbe0;
    TodoReturn reloadLeaderboard(LevelLeaderboardType, LevelLeaderboardMode);
    TodoReturn setupLeaderboard(cocos2d::CCArray*);

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void show() = win 0x867a0;
    virtual void loadLeaderboardFinished(cocos2d::CCArray*, char const*) = win 0x2edf60;
    virtual void loadLeaderboardFailed(char const*) = win 0x2ee000;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x2ed390, imac 0x3c82a0;
    virtual void updateUserScoreFinished() = win 0x2ed9b0;
    virtual void updateUserScoreFailed();

    GJGameLevel* m_level;
    LevelLeaderboardType m_type;
    LevelLeaderboardMode m_mode;
    cocos2d::CCArray* m_scores;
    GJCommentListLayer* m_list;
    LoadingCircle* m_circle;
    TextArea* m_noInternet;
    CCMenuItemSpriteExtra* m_refreshBtn;
    CCMenuItemSpriteExtra* m_timeBtn;
    CCMenuItemSpriteExtra* m_pointsBtn;
}

[[link(android)]]
class LevelListCell : TableViewCell {
    // virtual ~LevelListCell();
    LevelListCell(char const*, float, float);

    static LevelListCell* create(float, float);

    void loadFromList(GJLevelList*) = win 0xbdf90, imac 0x2333e0;
    void onClick(cocos2d::CCObject* sender) = win 0xbf3c0, imac 0x246d70;
    void onListInfo(cocos2d::CCObject* sender);
    void onViewProfile(cocos2d::CCObject* sender) = imac 0x246e50;
    TodoReturn updateBGColor(int);

    virtual bool init();
    virtual void draw();

    GJLevelList* m_levelList;
    bool m_addingLevel;
}

[[link(android)]]
class LevelListDeleteDelegate {
    virtual void levelListDeleteFinished(int) {}
    virtual void levelListDeleteFailed(int) {}
}

[[link(android)]]
class LevelListLayer : LevelBrowserLayer, TextInputDelegate, SelectListIconDelegate, LikeItemDelegate, LevelListDeleteDelegate {
    // virtual ~LevelListLayer();
    LevelListLayer() {
    	m_buttonMenu = nullptr;
    	m_searchKey1 = "";
    	m_levelList = nullptr;
    	m_searchKey2 = "";
    	m_likeButton = nullptr;
    	m_exiting = false;
    	m_titleInput = nullptr;
    	m_editMode = 0;
    	m_objects = nullptr;
    	m_diffSprite = nullptr;
    	m_featureSprite = nullptr;
    	m_rewardPosition = cocos2d::CCPointMake(0.f, 0.f);
    	m_exited = false;
    }

    static LevelListLayer* create(GJLevelList* list) {
    	auto ret = new LevelListLayer();
    	if (ret->init(list)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void cloneList() = win 0x2f35b0;
    void confirmClone(cocos2d::CCObject*) = win 0x2f34c0, imac 0x349b20;
    void confirmDelete(cocos2d::CCObject*) = win 0x2f3840;
    void confirmOwnerDelete(cocos2d::CCObject*) = win 0x2f3970, imac 0x349cb0;
    bool init(GJLevelList*) = win 0x2eea10;
    void onClaimReward(cocos2d::CCObject* sender) = win 0x2f1470;
    void onDelete();
    void onDescription(cocos2d::CCObject* sender) = imac 0x349ec0;
    void onFavorite(cocos2d::CCObject* sender) = win 0x2f2b00, imac 0x349c00;
    void onInfo(cocos2d::CCObject* sender) = win 0x2f2e00, imac 0x349a70;
    void onLike(cocos2d::CCObject* sender) = win 0x2f2e40;
    void onListInfo(cocos2d::CCObject* sender);
    void onRefreshLevelList(cocos2d::CCObject* sender) = win 0x2f1ae0;
    void onSelectIcon(cocos2d::CCObject* sender) = win 0x2f3080;
    void onShare(cocos2d::CCObject* sender) = win 0x2f31f0, imac 0x34a040;
    void onToggleEditMode(cocos2d::CCObject* sender) = win 0x2f3480, imac 0x349fb0;
    void onViewProfile(cocos2d::CCObject* sender) = win 0x2f2ac0, imac 0x349920;
    void ownerDelete();
    static cocos2d::CCScene* scene(GJLevelList*) = win 0x2ee7e0;
    void updateEditMode();
    void updateSideButtons() = win 0x2f2f80, imac 0x34a1a0;
    void updateStatsArt() = win 0x2f04f0;
    void verifyListName();

    virtual void onEnter() = win 0x2f04a0;
    virtual void onExit();
    virtual void loadLevelsFinished(cocos2d::CCArray*, char const*, int) = win 0x2f1ca0, imac 0x34b4a0;
    virtual void loadLevelsFailed(char const*, int) = win 0x2c4190;
    virtual void onBack(cocos2d::CCObject* sender) = win 0x2f2500;
    virtual void shareCommentClosed(gd::string, ShareCommentLayer*) = win 0x2f2d00;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x2f2920, imac 0x34bfa0;
    virtual void setIDPopupClosed(SetIDPopup*, int) = win 0x2f2450, imac 0x34bac0;
    virtual cocos2d::CCArray* updateResultArray(cocos2d::CCArray*);
    virtual bool cellPerformedAction(TableViewCell*, int, CellAction, cocos2d::CCNode*) = win 0x2f2000, imac 0x34b710;
    virtual void likedItem(LikeItemType, int, bool) = win 0x2f2f20, imac 0x34c470;
    virtual void iconSelectClosed(SelectListIconLayer*) = win 0x2f31d0, imac 0x34c6b0;
    virtual void levelListDeleteFinished(int) = win 0x2f3af0;
    virtual void levelListDeleteFailed(int) = win 0x2f3c20;
    virtual void textInputOpened(CCTextInputNode*) = win 0x2f3fe0;
    virtual void textInputClosed(CCTextInputNode*) = win 0x2f3d50, imac 0x34ca40;
    virtual void textChanged(CCTextInputNode*) = win 0x2f4140, imac 0x34cd20;

    cocos2d::CCMenu* m_buttonMenu;
    gd::string m_searchKey1;
    GJLevelList* m_levelList;
    gd::string m_searchKey2;
    CCMenuItemSpriteExtra* m_likeButton;
    bool m_exiting;
    CCTextInputNode* m_titleInput;
    int m_editMode;
    cocos2d::CCArray* m_objects;
    cocos2d::CCSprite* m_diffSprite;
    cocos2d::CCSprite* m_featureSprite;
    cocos2d::CCPoint m_rewardPosition;
    bool m_exited;
}

[[link(android)]]
class LevelManagerDelegate {
    virtual void loadLevelsFinished(cocos2d::CCArray*, char const*) {}
    virtual void loadLevelsFailed(char const*) {}
    virtual void loadLevelsFinished(cocos2d::CCArray*, char const*, int) {}
    virtual void loadLevelsFailed(char const*, int) {}
    virtual void setupPageInfo(gd::string, char const*) {}
}

[[link(android)]]
class LevelOptionsLayer : GJOptionsLayer {
    // virtual ~LevelOptionsLayer();

    static LevelOptionsLayer* create(LevelSettingsObject*);

    bool init(LevelSettingsObject*) = win 0x30f290, imac 0x25ed20;
    void onSettings(cocos2d::CCObject* sender) = win 0x30f7c0, imac 0x25f220;

    virtual void valueDidChange(int, float) = win 0x30f9a0, imac 0x25f4c0;
    virtual float getValue(int) = win 0x30f9c0, imac 0x25f4e0;
    virtual void setupOptions() = win 0x30f300;
    virtual void didToggle(int) = win 0x30f9e0, imac 0x25f500;

    LevelSettingsObject* m_settingsObject;
}

[[link(android)]]
class LevelOptionsLayer2 : LevelOptionsLayer {
    // virtual ~LevelOptionsLayer2();

    static LevelOptionsLayer2* create(LevelSettingsObject*);

    bool init(LevelSettingsObject*) = imac 0x25f6c0;

    virtual void setupOptions() = win 0x30fc40, imac 0x25f7c0;
}

[[link(android)]]
class LevelPage : cocos2d::CCLayer, DialogDelegate {
    // virtual ~LevelPage();
    LevelPage() {}

    static LevelPage* create(GJGameLevel* level) {
    	auto ret = new LevelPage();
    	if (ret->init(level)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void addSecretCoin() = win 0x307630;
    void addSecretDoor();
    bool init(GJGameLevel*) = win 0x304e90;
    void onInfo(cocos2d::CCObject* sender) = win 0x309080;
    void onMoreGames(cocos2d::CCObject* sender);
    void onPlay(cocos2d::CCObject* sender) = win 0x308b10, imac 0x421330;
    void onSecretDoor(cocos2d::CCObject* sender) = win 0x307f50, imac 0x423580;
    void onTheTower(cocos2d::CCObject* sender) = win 0x306f70;
    void playCoinEffect() = win 0x307870, imac 0x423130;
    void playStep2();
    void playStep3() = win 0x308f80;
    void updateDynamicPage(GJGameLevel*) = win 0x305b20;

    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x309520, imac 0x424030;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void registerWithTouchDispatcher() = win 0x9b1a0;
    virtual void dialogClosed(DialogLayer*) = win 0x308a30;

    bool m_isBusy;
    GJGameLevel* m_level;
    cocos2d::CCMenu* m_levelMenu;
    cocos2d::extension::CCScale9Sprite* m_levelDisplay;
    cocos2d::CCLabelBMFont* m_normalProgressLabel;
    cocos2d::CCLabelBMFont* m_practiceProgressLabel;
    cocos2d::CCLabelBMFont* m_nameLabel;
    cocos2d::CCLabelBMFont* m_starsLabel;
    float m_progressWidth;
    cocos2d::CCSprite* m_normalProgressBar;
    cocos2d::CCSprite* m_practiceProgressBar;
    cocos2d::CCSprite* m_difficultySprite;
    cocos2d::CCSprite* m_starsSprite;
    cocos2d::CCSize m_levelDisplaySize;
    cocos2d::CCArray* m_coins;
    cocos2d::CCArray* m_dynamicObjects;
    cocos2d::CCArray* m_levelObjects;
    cocos2d::CCArray* m_progressObjects;
    GameObject* m_coinObject;
    cocos2d::CCSprite* m_secretDoor;
}

[[link(android)]]
class LevelSearchLayer : cocos2d::CCLayer, TextInputDelegate, FLAlertLayerProtocol, DemonFilterDelegate {
    // virtual ~LevelSearchLayer();

    static LevelSearchLayer* create(int) = imac 0x610360;
    static cocos2d::CCScene* scene(int) = win 0x2f7410;

    bool checkDiff(int);
    bool checkTime(int);
    void clearFilters();
    void confirmClearFilters(cocos2d::CCObject*);
    inline char const* getDiffKey(int diff) {
    	return cocos2d::CCString::createWithFormat("D%i", diff)->getCString();
    }
    gd::string getLevelLenKey() = win 0x14b660;
    gd::string getSearchDiffKey();
    GJSearchObject* getSearchObject(SearchType, gd::string) = win 0x2fb0b0;
    inline char const* getTimeKey(int time) {
    	return cocos2d::CCString::createWithFormat("T%i", time)->getCString();
    }
    bool init(int) = win 0x2f7560, imac 0x610470;
    void onBack(cocos2d::CCObject* sender) = win 0x2fce60;
    void onClearFreeSearch(cocos2d::CCObject* sender) = win 0x2fce20, imac 0x6131b0;
    void onClose(cocos2d::CCObject* sender) {
    	m_searchInput->onClickTrackNode(false);
    }
    void onFollowed(cocos2d::CCObject* sender) = win 0x2fc8e0;
    void onFriends(cocos2d::CCObject* sender) = win 0x2fc820;
    void onLatestStars(cocos2d::CCObject* sender) = win 0x2fc760;
    void onMagic(cocos2d::CCObject* sender) = win 0x2fc5e0;
    void onMoreOptions(cocos2d::CCObject* sender) = win 0x2f98a0;
    void onMostDownloaded(cocos2d::CCObject* sender) = win 0x2fc2e0;
    void onMostLikes(cocos2d::CCObject* sender) = win 0x2fc3a0;
    void onMostRecent(cocos2d::CCObject* sender) = win 0x2fc6a0;
    void onSearch(cocos2d::CCObject* sender) = win 0x2fc9a0;
    void onSearchMode(cocos2d::CCObject* sender) = win 0x2f9850, imac 0x612b30;
    void onSearchUser(cocos2d::CCObject* sender) = win 0x2fcbe0;
    void onSpecialDemon(cocos2d::CCObject* sender) = win 0x2f94b0;
    void onStarAward(cocos2d::CCObject* sender);
    void onSuggested(cocos2d::CCObject* sender) = win 0x2fc460;
    void onTrending(cocos2d::CCObject* sender) = win 0x2fc520;
    void toggleDifficulty(cocos2d::CCObject*) = win 0x2fd1e0, imac 0x6136b0;
    void toggleDifficultyNum(int, bool) = win 0x2fd540, imac 0x613e50;
    void toggleStar(cocos2d::CCObject*) = win 0x2fced0;
    void toggleTime(cocos2d::CCObject*);
    void toggleTimeNum(int, bool) = win 0x2fd950, imac 0x613fe0;
    void updateSearchLabel(char const*) = win 0x2fad40;

    virtual void keyBackClicked() = win 0x2fdae0;
    virtual void textInputOpened(CCTextInputNode*);
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*);
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x2faae0, imac 0x6147f0;
    virtual void demonFilterSelectClosed(int) = win 0x2f9610;

    int m_type;
    CCTextInputNode* m_searchInput;
    cocos2d::CCSprite* m_starsSprite;
    cocos2d::CCArray* m_difficultySprites;
    cocos2d::CCArray* m_lengthSprites;
    cocos2d::CCDictionary* m_difficultyDict;
    cocos2d::CCSprite* m_lastDifficultySprite;
    CCMenuItemSpriteExtra* m_demonTypeButton;
}

[[link(android)]]
class LevelSelectLayer : cocos2d::CCLayer, BoomScrollLayerDelegate, DynamicScrollDelegate {
    ~LevelSelectLayer();
    LevelSelectLayer() {}

    static LevelSelectLayer* create(int page) {
    	auto ret = new LevelSelectLayer();
    	if (ret->init(page)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    cocos2d::ccColor3B colorForPage(int page) = win 0x304800, imac 0x421010;
    cocos2d::ccColor3B getColorValue(int, int, float) = imac 0x420d70;
    bool init(int page) = win 0x303660;
    void onBack(cocos2d::CCObject* sender) = win 0x304ca0;
    void onDownload(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender) = win 0x304e20;
    void onNext(cocos2d::CCObject* sender);
    void onPlay(cocos2d::CCObject* sender) = imac 0x4212e0;
    void onPrev(cocos2d::CCObject* sender);
    static cocos2d::CCScene* scene(int) = win 0x303530;
    void tryShowAd();

    virtual void keyBackClicked() = win 0x304cf0;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x304d40, imac 0x421130;
    virtual void updatePageWithObject(cocos2d::CCObject*, cocos2d::CCObject*) = win 0x304470, imac 0x41f420;
    virtual void scrollLayerMoved(cocos2d::CCPoint) = win 0x3044e0, imac 0x420c00;

    float m_width;
    cocos2d::CCSprite* m_backgroundSprite;
    GJGroundLayer* m_groundLayer;
    BoomScrollLayer* m_scrollLayer;
    int m_unknown;
    int m_scrolls;
    bool m_masterDetectiveUnlocked;
}

[[link(android)]]
class LevelSettingsDelegate {
    virtual void levelSettingsUpdated() {}
}

[[link(android)]]
class LevelSettingsLayer : FLAlertLayer, ColorSelectDelegate, SelectArtDelegate, SelectSettingDelegate, FLAlertLayerProtocol, CustomSongLayerDelegate, TextInputDelegate {
    // virtual ~LevelSettingsLayer();

    static LevelSettingsLayer* create(LevelSettingsObject*, LevelEditorLayer*) = win 0x309ac0, imac 0x258e80;

    void createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint) = win 0x30c5f0, imac 0x25bd30;
    bool init(LevelSettingsObject*, LevelEditorLayer*) = win 0x309cb0, imac 0x259080;
    void onBGArt(cocos2d::CCObject* sender) = win 0x30ce80, imac 0x25ba90;
    void onClose(cocos2d::CCObject* sender) = win 0x30ca70, imac 0x25bc20;
    void onCol(cocos2d::CCObject* sender);
    void onDisable(cocos2d::CCObject* sender);
    void onFGArt(cocos2d::CCObject* sender) = win 0x30cf50, imac 0x25bbc0;
    void onGameplayMode(cocos2d::CCObject* sender) = win 0x30c1c0, imac 0x25b910;
    void onGArt(cocos2d::CCObject* sender) = win 0x30ced0, imac 0x25bad0;
    void onLiveEdit(cocos2d::CCObject* sender) = win 0x30cbb0, imac 0x25b8d0;
    void onMode(cocos2d::CCObject* sender) = win 0x30c390, imac 0x25c010;
    void onOptionToggle(cocos2d::CCObject* sender) = win 0x30c860, imac 0x25bf60;
    void onSelectFont(cocos2d::CCObject* sender);
    void onSelectMode(cocos2d::CCObject* sender) = imac 0x25c7b0;
    void onSelectSpeed(cocos2d::CCObject* sender) = imac 0x25c870;
    void onSettings(cocos2d::CCObject* sender) = win 0x30c2d0, imac 0x25c060;
    void onShowPicker(cocos2d::CCObject* sender) = win 0x30cc00, imac 0x25b4e0;
    void onSpeed(cocos2d::CCObject* sender) = win 0x30c340, imac 0x25bfd0;
    void showPicker(ColorAction*);
    void updateColorSprite(ColorChannelSprite*) = win 0x30cd20, imac 0x25ca00;
    void updateColorSprites() = win 0x30ccb0, imac 0x25b560;
    void updateGameplayModeButtons() = win 0x30c200, imac 0x25b9e0;

    virtual void registerWithTouchDispatcher() = win 0x30c570;
    virtual void keyBackClicked() = win 0x30d410, imac 0x25cf50;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xc3110;
    virtual void colorSelectClosed(cocos2d::CCNode*) = win 0x30cca0, imac 0x25c9d0;
    virtual void selectArtClosed(SelectArtLayer*) = win 0x30d0c0, imac 0x25cce0;
    virtual void selectSettingClosed(SelectSettingLayer*) = win 0x30c3f0, imac 0x25c450;
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x30c8a0, imac 0x25c6b0;

    SongSelectNode* m_songSelectNode;
    Speed m_speed;
    ColorChannelSprite* m_bgColorSprite;
    ColorChannelSprite* m_gColorSprite;
    ColorChannelSprite* m_g2ColorSprite;
    ColorChannelSprite* m_lineColorSprite;
    ColorChannelSprite* m_mgColorSprite;
    ColorChannelSprite* m_mg2ColorSprite;
    cocos2d::CCSprite* m_moreColorsSprite;
    cocos2d::CCSprite* m_backgroundSprite;
    cocos2d::CCSprite* m_groundSprite;
    cocos2d::CCSprite* m_middlegroundSprite;
    cocos2d::CCSprite* m_speedSprite;
    cocos2d::CCSprite* m_modeSprite;
    LevelSettingsObject* m_settingsObject;
    void* m_unkPtr;
    cocos2d::CCArray* m_modeToggles;
    cocos2d::CCArray* m_speedButtons;
    LevelSettingsDelegate* m_delegate;
    LevelEditorLayer* m_editorLayer;
    CCTextInputNode* m_orderInput;
    CCTextInputNode* m_channelInput;
    CCMenuItemSpriteExtra* m_classicButton;
    CCMenuItemSpriteExtra* m_platformerButton;
    bool m_disableInput;
}

[[link(android)]]
class LevelSettingsObject : cocos2d::CCNode {
    // virtual ~LevelSettingsObject();

    static LevelSettingsObject* create();

    gd::string getSaveString() = win 0x2dd450;
    static LevelSettingsObject* objectFromDict(cocos2d::CCDictionary*) = win 0x2dee10, imac 0xf74f0;
    static LevelSettingsObject* objectFromString(gd::string const& str) {
    	return objectFromDict(GameToolbox::stringSetupToDict(str, ","));
    }
    void setupColorsFromLegacyMode(cocos2d::CCDictionary*) = win 0x2e0660, imac 0xf8cf0;
    bool shouldUseYSection() {
    	return m_platformerMode || m_dynamicLevelHeight;
    }

    virtual bool init() = win 0x2dd140;

    GJEffectManager* m_effectManager;
    // property kA2
    int m_startMode;
    // property kA4
    Speed m_startSpeed;
    // property kA3
    bool m_startMini;
    // property kA8
    bool m_startDual;
    // property kA28
    bool m_mirrorMode;
    // property kA29
    bool m_rotateGameplay;
    // property kA10
    bool m_twoPlayerMode;
    // property kA22
    bool m_platformerMode;
    // property kA13
    float m_songOffset;
    // property kA15
    bool m_fadeIn;
    // property kA16
    bool m_fadeOut;
    // property kA6
    int m_backgroundIndex;
    // property kA7
    int m_groundIndex;
    // property kA18
    int m_fontIndex;
    // property kA25
    int m_middleGroundIndex;
    // property kA9
    bool m_startsWithStartPos;
    // property kA11
    bool m_isFlipped;
    // property kA20
    bool m_reverseGameplay;
    // property kA21
    bool m_disableStartPos;
    // property kA19
    int m_targetOrder;
    // property kA26
    int m_targetChannel;

    GJGameLevel* m_level;
    // property kA14
    gd::string m_guidelineString;

    bool m_unkBool;
    // property kS39
    int m_colorPage;
    // property kA17
    int m_groundLineIndex;
    // property kA23
    bool m_propertykA23;
    // property kA24
    bool m_propertykA24;
    // property kA43
    bool m_noTimePenalty;
    // property kA44
    int m_propertykA44;
    // property kA35
    bool m_resetCamera;
    // property kA36
    int m_spawnGroup;
    // property kA27
    bool m_allowMultiRotation;
    // property kA31
    bool m_enablePlayerSqueeze;
    // property kA32
    bool m_fixGravityBug;
    // property kA33
    bool m_fixNegativeScale;
    // property kA34
    bool m_fixRobotJump;
    // property kA37
    bool m_dynamicLevelHeight;
    // property kA38
    bool m_sortGroups;
    // property kA39
    bool m_fixRadiusCollision;
    // property kA40
    bool m_enable22Changes;
    // property kA41
    bool m_allowStaticRotate;
    // property kA42
    bool m_reverseSync;
    // property kA45
    bool m_propertykA45;
}

[[link(android)]]
class LevelTools {
    static int artistForAudio(int) = win 0x314140;
    static gd::string base64DecodeString(gd::string);
    static gd::string base64EncodeString(gd::string);
    static cocos2d::CCDictionary* createStarPackDict();
    static gd::string fbURLForArtist(int) = win 0x316250;
    static int getAudioBPM(int);
    static gd::string getAudioFileName(int) = win 0x313570, imac 0x4ea4a0;
    static gd::string getAudioString(int) = imac 0x4ec090;
    static gd::string getAudioTitle(int) = win 0x3129f0, imac 0x4e9f00;
    static TodoReturn getLastGameplayReversed();
    static TodoReturn getLastGameplayRotated();
    static TodoReturn getLastTimewarp();
    static GJGameLevel* getLevel(int, bool) = win 0x310140, imac 0x4e79a0;
    static TodoReturn getLevelList();
    static SongInfoObject* getSongObject(int id) {
    	auto artistID = artistForAudio(id);
    	return SongInfoObject::create(id, getAudioTitle(id), nameForArtist(artistID), artistID, 0.f, "", "", "", 0, "", false, 0, -1);
    }
    static TodoReturn moveTriggerObjectsToArray(cocos2d::CCArray*, cocos2d::CCDictionary*, int);
    static gd::string nameForArtist(int) = win 0x314210;
    static gd::string ngURLForArtist(int) = win 0x315830;
    static TodoReturn offsetBPMForTrack(int);
    static float posForTime(float time, cocos2d::CCArray* p1, int p2, bool p3, int& p4);
    static float posForTimeInternal(float time, cocos2d::CCArray* gameObjects, int speedmodValue, bool disabledSpeedmod, bool, bool, int&, int) = win 0x317cc0;
    static TodoReturn sortChannelOrderObjects(cocos2d::CCArray*, cocos2d::CCDictionary*, bool);
    static TodoReturn sortSpeedObjects(cocos2d::CCArray*, GJBaseGameLayer*) = imac 0x66620;
    static float timeForPos(cocos2d::CCPoint, cocos2d::CCArray*, int, int, int, bool, bool, bool, bool, int);
    static TodoReturn toggleDebugLogging(bool);
    static gd::string urlForAudio(int) = win 0x314510;
    static TodoReturn valueForSpeedMod(int);
    static bool verifyLevelIntegrity(gd::string, int) = win 0x318320, imac 0x4edab0;
    static gd::string ytURLForArtist(int) = win 0x315cd0;
}

[[link(android)]]
class LevelUpdateDelegate {
    virtual void levelUpdateFinished(GJGameLevel*, UpdateResponse) {}
    virtual void levelUpdateFailed(int) {}
}

[[link(android)]]
class LevelUploadDelegate {
    virtual void levelUploadFinished(GJGameLevel*) {}
    virtual void levelUploadFailed(GJGameLevel*) {}
}

[[link(android)]]
class LikeItemDelegate {
    virtual void likedItem(LikeItemType, int, bool) {}
}

[[link(android)]]
class LikeItemLayer : FLAlertLayer {
    // virtual ~LikeItemLayer();

    static LikeItemLayer* create(LikeItemType, int, int) = win 0x318cc0, imac 0x5e0790;

    bool init(LikeItemType, int, int) = win 0x318dc0, imac 0x5e0900;
    void onClose(cocos2d::CCObject* sender);
    void onDislike(cocos2d::CCObject* sender);
    void onLike(cocos2d::CCObject* sender) = win 0x319190;
    void triggerLike(bool isLiked) = win 0x3191b0;

    virtual void keyBackClicked();

    LikeItemType m_itemType;
    int m_itemID;
    int m_commentSourceID;
    LikeItemDelegate* m_likeDelegate;
}

[[link(android)]]
class ListButtonBar : cocos2d::CCNode {
    // virtual ~ListButtonBar();

    static ListButtonBar* create(cocos2d::CCArray*, cocos2d::CCPoint, int, int, float, float, float, float, int) = win 0x6ad70, imac 0x3dd480;

    int getPage();
    void goToPage(int) = win 0x6b380;
    bool init(cocos2d::CCArray*, cocos2d::CCPoint, int, int, float, float, float, float, int) = win 0x6ae80, imac 0x3dd550;
    void onLeft(cocos2d::CCObject* sender) = win 0x6b430;
    void onRight(cocos2d::CCObject* sender) = win 0x6b410;

    BoomScrollLayer* m_scrollLayer;
    cocos2d::CCArray* m_pages;
    ListButtonBarDelegate* m_delegate;
    bool m_useMoveAnimation;
}

[[link(android)]]
class ListButtonBarDelegate {
    virtual void listButtonBarSwitchedPage(ListButtonBar*, int);
}

[[link(android)]]
class ListButtonPage : cocos2d::CCLayer {
    // virtual ~ListButtonPage();

    static ListButtonPage* create(cocos2d::CCArray*, cocos2d::CCPoint, int, int, float, float, float) = win 0x6b450, imac 0x3dd9a0;

    bool init(cocos2d::CCArray*, cocos2d::CCPoint, int, int, float, float, float) = imac 0x3ddc80;
}

[[link(android)]]
class ListCell : TableViewCell {
    // virtual ~ListCell();
    ListCell(char const*, float, float);

    void loadFromObject(cocos2d::CCObject*, int, int, int);
    TodoReturn updateBGColor(int);

    virtual bool init();
    virtual void draw() = win 0x3c6f0, imac 0x2f8c40;
}

[[link(android)]]
class ListUploadDelegate {
    virtual void listUploadFinished(GJLevelList*);
    virtual void listUploadFailed(GJLevelList*, int);
}

[[link(android)]]
class LoadingCircle : cocos2d::CCLayerColor {
    // virtual ~LoadingCircle();
    LoadingCircle() {}

    static LoadingCircle* create() = win 0x6b840;

    void fadeAndRemove() = win 0x6bb20;
    void show() = win 0x6ba20;

    void setFade(bool fade) {
    	m_fade = fade;
    }

    virtual bool init() = win 0x6b940, imac 0x4ab350;
    virtual void draw() = win 0x6bbc0;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) { return true; }
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void registerWithTouchDispatcher() = win 0x6bbe0;

    inline void setParentLayer(cocos2d::CCLayer* layer) {
    	m_parentLayer = layer;
    }

    cocos2d::CCSprite* m_sprite;
    cocos2d::CCLayer* m_parentLayer;
    bool m_fade;
}

[[link(android)]]
class LoadingCircleSprite : cocos2d::CCSprite {
    // virtual ~LoadingCircleSprite();

    static LoadingCircleSprite* create();

    void fadeInCircle(bool reverseOpacity) {
    	this->stopActionByTag(0);
    	if (reverseOpacity) this->setOpacity(0);
    	this->setVisible(true);
    	auto fadeAction = cocos2d::CCFadeTo::create(.4f, 200);
    	fadeAction->setTag(0);
    	this->runAction(fadeAction);
    }
    void hideCircle() {
    	this->stopActionByTag(0);
    	this->setOpacity(0);
    	this->setVisible(false);
    }

    virtual bool init();
}

[[link(android)]]
class LoadingLayer : cocos2d::CCLayer {
    // virtual ~LoadingLayer();

    static LoadingLayer* create(bool) = imac 0x38e8c0;

    const char* getLoadingString() = win 0x31a750, imac 0x38f130;
    bool init(bool) = win 0x319420, imac 0x38e9a0;
    void loadAssets() = win 0x319cc0, imac 0x38f1f0;
    void loadingFinished() = imac 0x38f990;
    static cocos2d::CCScene* scene(bool) = win 0x319310;
    void updateProgress(int) = win 0x319c40, imac 0x38f190;

    bool m_unknown;
    bool m_unknown2;
    int m_loadStep;
    cocos2d::CCLabelBMFont* m_caption;
    TextArea* m_textArea;
    cocos2d::CCSprite* m_sliderBar;
    float m_sliderGrooveXPos;
    float m_sliderGrooveHeight;
    bool m_fromRefresh;
}

[[link(android)]]
class LocalLevelManager : GManager {
    // virtual ~LocalLevelManager();

    static LocalLevelManager* sharedState() = win 0x31ae90, imac 0x5de3a0;
    inline static LocalLevelManager* get() {
    	return LocalLevelManager::sharedState();
    }

    cocos2d::CCDictionary* getAllLevelsInDict() = win 0x31b300;
    TodoReturn getAllLevelsWithName(gd::string);
    cocos2d::CCArray* getCreatedLevels(int folder) {
    	if (folder < 1) return m_localLevels;
    	auto ret = cocos2d::CCArray::create();
    	CCObject* obj;
    	CCARRAY_FOREACH(m_localLevels, obj) {
    		if (!obj) return ret;
    		if (static_cast<GJGameLevel*>(obj)->m_levelFolder == folder) ret->addObject(obj);
    	}
    	return ret;
    }
    cocos2d::CCArray* getCreatedLists(int folder) {
    	if (folder < 1) return m_localLists;
    	auto ret = cocos2d::CCArray::create();
    	CCObject* obj;
    	CCARRAY_FOREACH(m_localLists, obj) {
    		if (!obj) return ret;
    		if (static_cast<GJLevelList*>(obj)->m_folder == folder) ret->addObject(obj);
    	}
    	return ret;
    }
    cocos2d::CCDictionary* getLevelsInNameGroups();
    gd::string getMainLevelString(int) = win 0x31b1f0;
    TodoReturn markLevelsAsUnmodified();
    TodoReturn moveLevelToTop(GJGameLevel*);
    TodoReturn reorderLevels();
    TodoReturn tryLoadMainLevelString(int);
    TodoReturn updateLevelOrder() = win 0x31b7f0;
    TodoReturn updateLevelRevision() = win 0x31b460;

    virtual bool init() = win 0x31af30;
    virtual void encodeDataTo(DS_Dictionary*) = win 0x31b900;
    virtual void dataLoaded(DS_Dictionary*) = win 0x31b960, imac 0x5df9f0;
    virtual void firstLoad() = win 0x31b870;

    cocos2d::CCArray* m_localLevels;
    cocos2d::CCArray* m_localLists;
    gd::unordered_map<int, gd::string> m_mainLevels;
}

[[link(android)]]
class MapPackCell : TableViewCell {
    // virtual ~MapPackCell();
    MapPackCell(char const*, float, float);

    void loadFromMapPack(GJMapPack*) = win 0xb14e0, imac 0x232820;
    void onClaimReward(cocos2d::CCObject* sender);
    void onClick(cocos2d::CCObject* sender) = win 0xb2000;
    void playCompleteEffect() = win 0xb21d0, imac 0x240240;
    void reloadCell() {
    	this->loadFromMapPack(m_mapPack);
    }
    void updateBGColor(int idx) {
    	m_backgroundLayer->setColor(idx % 2 == 0 ? cocos2d::ccColor3B { 161, 88, 44 } : cocos2d::ccColor3B { 194, 114, 62 });
    	m_backgroundLayer->setOpacity(255);
    }

    virtual bool init() = win 0xb1480;
    virtual void draw() = imac 0x240470;

    GJMapPack* m_mapPack;
    CCMenuItemSpriteExtra* m_viewButton;
    CCMenuItemSpriteExtra* m_rewardButton;
    cocos2d::CCArray* m_rewardLabels;
    cocos2d::CCArray* m_rewardSprites;
}

[[link(android)]]
class MapSelectLayer : cocos2d::CCLayer {
    // virtual ~MapSelectLayer();

    static MapSelectLayer* create();

    TodoReturn checkTouchMonster(cocos2d::CCPoint);
    TodoReturn createObjectAtPoint(cocos2d::CCPoint);
    TodoReturn getConstrainedMapPos(cocos2d::CCPoint);
    void onBack(cocos2d::CCObject* sender);
    static cocos2d::CCScene* scene();

    virtual void update(float) = imac 0x2567e0;
    virtual bool init();
    virtual void onExit() = imac 0x256aa0;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = imac 0x257150;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = imac 0x257260;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void scrollWheel(float, float) = imac 0x2565a0;

    GJBigSprite* m_bigSprite;
    SimplePlayer* m_player;
    cocos2d::CCNode* m_mainLayer;
    bool m_unloadTexturesOnExit;
    bool m_backPressed;
    bool m_blockExit;
    bool m_inTouch;
    double m_lastTouchTime;
    bool m_editMode;
    cocos2d::CCPoint m_lastTouchPos;
    cocos2d::CCPoint m_mapPos;
    cocos2d::CCArray* m_monsters;
    LevelEditorLayer* m_editorLayer;
}

[[link(android), depends(GJGroundLayer), depends(GameToolbox)]]
class MenuGameLayer : cocos2d::CCLayer {
    // virtual ~MenuGameLayer();
    MenuGameLayer() {}

    static MenuGameLayer* create() {
    	auto ret = new MenuGameLayer();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void destroyPlayer() = win 0x31e2a0, imac 0x4e6fa0;
    cocos2d::ccColor3B getBGColor(int) = win 0x31cc00, imac 0x4e5ee0;
    void resetPlayer() = win 0x31d670;
    void tryJump(float) = win 0x31ced0;
    void updateColor(float) = win 0x31cab0, imac 0x4e61e0;
    void updateColors() = imac 0x4e6bc0;

    virtual void update(float) = win 0x31d1a0, imac 0x4e6c30;
    virtual bool init() = win 0x31c380;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x31e560;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) {}
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void registerWithTouchDispatcher() = win 0x31e710;

    bool m_videoOptionsOpen;
    float m_deltaCount;
    bool m_isDestroyingPlayer;
    int m_initCount;
    cocos2d::CCPoint m_unused1;
    PlayerObject* m_playerObject;
    cocos2d::CCSprite* m_backgroundSprite;
    GJGroundLayer* m_groundLayer;
    float m_backgroundSpeed;
}

[[link(android)]]
class MenuLayer : cocos2d::CCLayer, FLAlertLayerProtocol, GooglePlayDelegate {
    // virtual ~MenuLayer();

    static MenuLayer* get() {
    	return GameManager::get()->m_menuLayer;
    }

    static cocos2d::CCScene* scene(bool) = win 0x31e860;
    // static MenuLayer* create() = ios 0x275f90;

    void endGame() = win 0x321330;
    void firstNetworkTest() = win 0x320250;
    void onAchievements(cocos2d::CCObject* sender) = win 0x320780;
    void onCreator(cocos2d::CCObject* sender) = win 0x320c90;
    void onDaily(cocos2d::CCObject* sender) = win 0x320000;
    void onDiscord(cocos2d::CCObject* sender);
    void onEveryplay(cocos2d::CCObject* sender) {}
    void onFacebook(cocos2d::CCObject* sender);
    void onFreeLevels(cocos2d::CCObject* sender);
    void onFullVersion(cocos2d::CCObject* sender);
    void onGameCenter(cocos2d::CCObject* sender);
    void onGarage(cocos2d::CCObject* sender) = win 0x320d20;
    void onGooglePlayGames(cocos2d::CCObject* sender);
    void onMoreGames(cocos2d::CCObject* sender);
    void onMyProfile(cocos2d::CCObject* sender) = win 0x320540;
    void onNewgrounds(cocos2d::CCObject* sender);
    void onOptions(cocos2d::CCObject* sender) = win 0x3209d0;
    void onOptionsInstant() = win 0x3209e0;
    void onPlay(cocos2d::CCObject* sender) = win 0x320930;
    void onQuit(cocos2d::CCObject* sender) = win 0x320ee0;
    void onRobTop(cocos2d::CCObject* sender);
    void onStats(cocos2d::CCObject* sender) = win 0x320b70;
    void onTrailer(cocos2d::CCObject* sender);
    void onTwitch(cocos2d::CCObject* sender);
    void onTwitter(cocos2d::CCObject* sender);
    void onYouTube(cocos2d::CCObject* sender);
    void openOptions(bool videoOptions) = win 0x3209f0;
    void showGCQuestion();
    void showMeltdownPromo() {}
    void showTOS() = win 0x320420;
    void syncPlatformAchievements(float);
    void tryShowAd(float);
    void updateUserProfileButton() = win 0x320150;
    void videoOptionsClosed() {
    	m_menuGameLayer->m_videoOptionsOpen = false;
    }
    void videoOptionsOpened() {
    	m_menuGameLayer->m_videoOptionsOpen = true;
    }
    void willClose();

    virtual bool init() = win 0x31e9f0;
    virtual void keyBackClicked();
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x3212c0, imac 0x37e4e0;
    virtual void googlePlaySignedIn() = win 0x3208e0, imac 0x37df70;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x3210b0, imac 0x37e230;

    bool m_showingTOS;
    cocos2d::CCSprite* m_gpSprite;
    cocos2d::CCSprite* m_viewProfileSprite;
    cocos2d::CCLabelBMFont* m_profileLabel;
    CCMenuItemSpriteExtra* m_profileButton;
    void* m_unknown;
    MenuGameLayer* m_menuGameLayer;
}

[[link(android)]]
class MessageListDelegate {
    virtual void loadMessagesFinished(cocos2d::CCArray*, char const*) {}
    virtual void loadMessagesFailed(char const*, GJErrorCode) {}
    virtual void forceReloadMessages(bool) {}
    virtual void setupPageInfo(gd::string, char const*) {}
}

[[link(android)]]
class MessagesProfilePage : FLAlertLayer, FLAlertLayerProtocol, UploadActionDelegate, UploadPopupDelegate, MessageListDelegate {
    // virtual ~MessagesProfilePage();

    static MessagesProfilePage* create(bool) = win 0x3214d0, imac 0x21b330;

    void deleteSelected() = win 0x3225f0;
    bool init(bool) = win 0x321670;
    bool isCorrect(char const*);
    void loadPage(int);
    void onClose(cocos2d::CCObject* sender) = win 0x322a10;
    void onDeleteSelected(cocos2d::CCObject* sender);
    void onNextPage(cocos2d::CCObject* sender) = win 0x323430;
    void onPrevPage(cocos2d::CCObject* sender) = win 0x323440;
    void onSentMessages(cocos2d::CCObject* sender) = win 0x322270;
    void onToggleAllObjects(cocos2d::CCObject* sender);
    void onUpdate(cocos2d::CCObject* sender);
    void setupCommentsBrowser(cocos2d::CCArray*) = win 0x322f90;
    void untoggleAll();
    void updateLevelsLabel();
    void updatePageArrows();

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x322870;
    virtual void onClosePopup(UploadActionPopup*) = win 0x13d2a0;
    virtual void uploadActionFinished(int, int);
    virtual void uploadActionFailed(int, int) = win 0x13d460;
    virtual void loadMessagesFinished(cocos2d::CCArray*, char const*) = win 0x323120, imac 0x21d130;
    virtual void loadMessagesFailed(char const*, GJErrorCode) = win 0x13dc50, imac 0x21d250;
    virtual void forceReloadMessages(bool) = win 0x323270;
    virtual void setupPageInfo(gd::string, char const*) = imac 0x21d3a0;

    bool m_sentMessages;
    gd::string m_messageKey;
    cocos2d::CCLabelBMFont* m_levelsLabel;
    cocos2d::CCLabelBMFont* m_errorLabel;
    GJCommentListLayer* m_listLayer;
    LoadingCircle* m_loadingCircle;
    UploadActionPopup* m_actionPopup;
    void* m_unkPtr;
    CCMenuItemSpriteExtra* m_nextButton;
    CCMenuItemSpriteExtra* m_prevButton;
    CCMenuItemSpriteExtra* m_refreshButton;
    CCMenuItemToggler* m_toggleAllToggler;
    int m_itemCount;
    int m_pageStartIdx;
    int m_pageEndIdx;
    int m_page;
    bool m_toggledAll;
}

[[link(android)]]
class MoreOptionsLayer : FLAlertLayer, TextInputDelegate, GooglePlayDelegate, GJDropDownLayerDelegate {
    // virtual ~MoreOptionsLayer();
    MoreOptionsLayer() {}

    static MoreOptionsLayer* create() {
    	auto ret = new MoreOptionsLayer();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void addToggle(char const*, char const*, char const*);
    int countForPage(int);
    void goToPage(int) = win 0x35f6b0;
    void incrementCountForPage(int);
    const char* infoKey(int);
    cocos2d::CCLayer* layerForPage(int);
    const char* layerKey(int);
    cocos2d::CCPoint nextPosition(int);
    const char* objectKey(int);
    cocos2d::CCArray* objectsForPage(int);
    void offsetToNextPage();
    void onClose(cocos2d::CCObject* sender) = win 0x360950;
    void onFMODDebug(cocos2d::CCObject* sender) = win 0x3604c0;
    void onGPSignIn(cocos2d::CCObject* sender);
    void onGPSignOut(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender);
    void onKeybindings(cocos2d::CCObject* sender);
    void onNextPage(cocos2d::CCObject* sender);
    void onParental(cocos2d::CCObject* sender);
    void onPrevPage(cocos2d::CCObject* sender);
    void onSongBrowser(cocos2d::CCObject* sender);
    void onToggle(cocos2d::CCObject* sender) = win 0x35fc50;
    const char* pageKey(int);
    void toggleGP();

    virtual bool init() = win 0x35d840, imac 0x784c20;
    virtual void keyBackClicked();
    virtual void textInputShouldOffset(CCTextInputNode*, float);
    virtual void textInputReturn(CCTextInputNode*);
    virtual void googlePlaySignedIn() = win 0x360ac0;
    virtual void dropDownLayerWillClose(GJDropDownLayer*);

    int m_page;
    int m_toggleCount;
    int m_pageCount;
    cocos2d::CCDictionary* m_variables;
    cocos2d::CCDictionary* m_objects;
    CCMenuItemSpriteExtra* m_leftBtn;
    CCMenuItemSpriteExtra* m_rightBtn;
    CCTextInputNode* m_offsetInput;
    CCMenuItemSpriteExtra* m_gpSignInBtn;
    CCMenuItemSpriteExtra* m_gpSignOutBtn;
    cocos2d::CCLabelBMFont* m_categoryLabel;
}

[[link(android)]]
class MoreSearchLayer : FLAlertLayer, TextInputDelegate {
    // virtual ~MoreSearchLayer();
    inline MoreSearchLayer() {}

    static MoreSearchLayer* create() {
    	auto ret = new MoreSearchLayer();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void audioNext(cocos2d::CCObject* sender);
    void audioPrevious(cocos2d::CCObject* sender);
    void createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint) = win 0x302550;
    void onClose(cocos2d::CCObject* sender) = win 0x3027b0, imac 0x616d80;
    void onCoins(cocos2d::CCObject* sender);
    void onCompleted(cocos2d::CCObject* sender);
    void onEpic(cocos2d::CCObject* sender);
    void onFeatured(cocos2d::CCObject* sender);
    void onFollowed(cocos2d::CCObject* sender);
    void onFriends(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender) = win 0x302400;
    void onLegendary(cocos2d::CCObject* sender);
    void onMythic(cocos2d::CCObject* sender);
    void onNoStar(cocos2d::CCObject* sender);
    void onOriginal(cocos2d::CCObject* sender);
    void onSongFilter(cocos2d::CCObject* sender) = win 0x3010e0, imac 0x6171c0;
    void onSongMode(cocos2d::CCObject* sender) = win 0x301e00, imac 0x6173e0;
    void onTwoPlayer(cocos2d::CCObject* sender);
    void onUncompleted(cocos2d::CCObject* sender);
    void selectSong(int songID) = win 0x301cc0, imac 0x617880;
    void toggleSongNodes(bool, bool) = win 0x3022c0, imac 0x617740;
    void updateAudioLabel() = win 0x3017c0;

    virtual bool init() = win 0x2fde40, imac 0x615990;
    virtual void keyBackClicked() = win 0x302bb0, imac 0x617b60;
    virtual void textInputShouldOffset(CCTextInputNode*, float) = win 0x7b5c0;
    virtual void textInputReturn(CCTextInputNode*) = win 0x7b620;

    cocos2d::CCLabelBMFont* m_audioTrackName;
    CCMenuItemSpriteExtra* m_songLeftBtn;
    CCMenuItemSpriteExtra* m_songRightBtn;
    CCMenuItemSpriteExtra* m_normalBtn;
    CCMenuItemSpriteExtra* m_customBtn;
    CCTextInputNode* m_enterSongID;
    cocos2d::CCArray* m_commonSongNodes;
    cocos2d::CCArray* m_normalSongNodes;
    cocos2d::CCArray* m_customSongNodes;
}

[[link(android)]]
class MoreVideoOptionsLayer : FLAlertLayer, TextInputDelegate {
    // virtual ~MoreVideoOptionsLayer();

    static MoreVideoOptionsLayer* create();

    void addToggle(char const* label, char const* key, char const* description);
    int countForPage(int);
    void goToPage(int);
    void incrementCountForPage(int);
    const char* infoKey(int);
    TodoReturn layerForPage(int);
    const char* layerKey(int);
    TodoReturn nextPosition(int);
    TodoReturn objectKey(int);
    TodoReturn objectsForPage(int);
    void onApplyFPS(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender);
    void onNextPage(cocos2d::CCObject* sender);
    void onPrevPage(cocos2d::CCObject* sender);
    void onToggle(cocos2d::CCObject* sender);
    const char* pageKey(int);
    void updateFPSButtons();

    virtual bool init() = imac 0x78a680;
    virtual void keyBackClicked() = win 0x3655f0;
}

[[link(android)]]
class MPLobbyLayer : cocos2d::CCLayer, GJMPDelegate, UploadPopupDelegate, UploadActionDelegate, FLAlertLayerProtocol, TextInputDelegate {
    // virtual ~MPLobbyLayer();

    static MPLobbyLayer* create(int);

    bool init(int);
    void onBack(cocos2d::CCObject* sender);
    void onBtn1(cocos2d::CCObject* sender);
    void onBtn2(cocos2d::CCObject* sender);
    void onBtn3(cocos2d::CCObject* sender);
    void onComment(cocos2d::CCObject* sender);
    TodoReturn onUpdateLobby();
    TodoReturn postComment();
    static cocos2d::CCScene* scene(int);
    TodoReturn tryExitLobby();
    TodoReturn updateLobby(float);

    virtual void keyBackClicked();
    virtual void keyDown(cocos2d::enumKeyCodes) = imac 0x480a90;
    virtual TodoReturn joinLobbyFinished(int);
    virtual TodoReturn joinLobbyFailed(int, GJMPErrorCode) = imac 0x4808c0;
    virtual TodoReturn updateComments();
    virtual TodoReturn didUploadMPComment(int) = imac 0x4808a0;
    virtual void textInputOpened(CCTextInputNode*);
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*);
    virtual void keyUp(cocos2d::enumKeyCodes);
    virtual void FLAlert_Clicked(FLAlertLayer*, bool);
    virtual void uploadActionFinished(int, int);
    virtual void uploadActionFailed(int, int);
    virtual void onClosePopup(UploadActionPopup*);
}

[[link(android)]]
class MultilineBitmapFont : cocos2d::CCSprite {
    // virtual ~MultilineBitmapFont();
    	MultilineBitmapFont() {
    	m_specialDescriptors = nullptr;
    	m_characters = nullptr;
    	m_lines = nullptr;
    	m_unkInt = 0;
    	m_unkBool = false;
    	m_unkPtr = nullptr;
    	m_height = 0;
    	m_width = 0;
    	m_position = cocos2d::CCPointMake(0.f, 0.f);
    	m_maxWidth = 0.f;
    	m_disableColor = false;
    }

    static MultilineBitmapFont* createWithFont(char const* p0, gd::string p1, float p2, float p3, cocos2d::CCPoint p4, int p5, bool p6) {
    	auto ret = new MultilineBitmapFont();
    	if (ret->initWithFont(p0, p1, p2, p3, p4, p5, p6)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    bool initWithFont(char const*, gd::string, float, float, cocos2d::CCPoint, int, bool) = win 0x6bea0;
    unsigned int moveSpecialDescriptors(int, int) = win 0x6d0a0;
    gd::string readColorInfo(gd::string) = win 0x6c7d0, imac 0x474280;
    gd::string stringWithMaxWidth(gd::string, float, float) = win 0x6d130, imac 0x474f90;

    virtual void setOpacity(unsigned char) = win 0x6c750;

    std::array<int, 300> m_hugeIntArray;
    cocos2d::CCArray* m_specialDescriptors;
    cocos2d::CCArray* m_characters;
    cocos2d::CCArray* m_lines;
    int m_unkInt;
    bool m_unkBool;
    void* m_unkPtr;
    int m_height;
    int m_width;
    cocos2d::CCPoint m_position;
    float m_maxWidth;
    bool m_disableColor;
}

[[link(android)]]
class MultiplayerLayer : cocos2d::CCLayer {
    // virtual ~MultiplayerLayer();

    static MultiplayerLayer* create();

    void onBack(cocos2d::CCObject* sender);
    void onBtn1(cocos2d::CCObject* sender);
    void onBtn2(cocos2d::CCObject* sender);
    static cocos2d::CCScene* scene();

    virtual bool init();
    virtual void keyBackClicked();
}

[[link(android)]]
class MultiTriggerPopup : SetupTriggerPopup {
    // virtual ~MultiTriggerPopup();

    static MultiTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class MusicArtistObject : cocos2d::CCObject {
    // virtual ~MusicArtistObject();

    static MusicArtistObject* create(int, gd::string, gd::string, gd::string);

    bool init(int, gd::string, gd::string, gd::string);
}

[[link(android)]]
class MusicBrowser : FLAlertLayer, MusicDownloadDelegate, TableViewCellDelegate, SetTextPopupDelegate, FLAlertLayerProtocol, SliderDelegate {
    // virtual ~MusicBrowser();

    static MusicBrowser* create(int, GJSongType) = win 0x323660, imac 0x5f55f0;

    bool init(int, GJSongType) = win 0x323810, imac 0x5f57e0;
    void onArtistFilters(cocos2d::CCObject* sender) = win 0x325930, imac 0x5f6710;
    void onClearSearch(cocos2d::CCObject* sender) = imac 0x5f6650;
    void onClose(cocos2d::CCObject* sender) = win 0x325a20;
    void onPage(cocos2d::CCObject* sender) = win 0x3255b0, imac 0x42aab0;
    void onPlaybackControl(cocos2d::CCObject* sender) = win 0x3249b0, imac 0x5f6bd0;
    void onSearch(cocos2d::CCObject* sender) = win 0x3256d0, imac 0x5f6520;
    void onTagFilters(cocos2d::CCObject* sender) = win 0x3258c0, imac 0x5f66b0;
    void onUpdateLibrary(cocos2d::CCObject* sender);
    void setupList(MusicSearchResult*) = win 0x324e70, imac 0x5f6d70;
    void setupSongControls() = win 0x3246d0;
    void sliderChanged(cocos2d::CCObject* sender);
    void trySetupMusicBrowser();
    void updatePageLabel();

    virtual void update(float) = win 0x3243d0;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void musicActionFinished(GJMusicAction) = win 0x324cd0;
    virtual void musicActionFailed(GJMusicAction) = win 0x324d40;
    virtual void sliderEnded(Slider*) = win 0x324a10;
    virtual void setTextPopupClosed(SetTextPopup*, gd::string) = imac 0x5f7770;
    virtual bool cellPerformedAction(TableViewCell*, int, CellAction, cocos2d::CCNode*) = win 0x325570;
    virtual int getSelectedCellIdx();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x3259c0, imac 0x5f7980;

    GJSongType m_songType;
    MusicSearchResult* m_searchResult;
    GJCommentListLayer* m_listLayer;
    cocos2d::CCLabelBMFont* m_infoLabel;
    cocos2d::CCLabelBMFont* m_pageLabel;
    CCMenuItemSpriteExtra* m_prevButton;
    CCMenuItemSpriteExtra* m_nextButton;
    CCMenuItemSpriteExtra* m_refreshButton;
    CCMenuItemSpriteExtra* m_clearSearchButton;
    CCMenuItemSpriteExtra* m_tagFilterButton;
    CCMenuItemSpriteExtra* m_artistFilterButton;
    LoadingCircleSprite* m_circleSprite;
    int m_songID;
    int m_libraryVersion;
    bool m_gettingURL;
    bool m_selectedCell;
    MusicBrowserDelegate* m_delegate;
    Slider* m_playSlider;
    cocos2d::CCLabelBMFont* m_playLabel;
    CCMenuItemSpriteExtra* m_playButton;
    win, mac {
    	bool m_autoUpdating;
    }
}

[[link(android)]]
class MusicBrowserDelegate {
    virtual void musicBrowserClosed(MusicBrowser*) {}
}

[[link(android)]]
class MusicDelegateHandler : cocos2d::CCNode {
    // virtual ~MusicDelegateHandler();

    static MusicDelegateHandler* create(MusicDownloadDelegate*);

    bool init(MusicDownloadDelegate*);
}

[[link(android)]]
class MusicDownloadDelegate {
    virtual void loadSongInfoFinished(SongInfoObject*) {}
    virtual void loadSongInfoFailed(int, GJSongError) {}
    virtual void downloadSongFinished(int) {}
    virtual void downloadSongFailed(int, GJSongError) {}
    virtual void songStateChanged() {}
    virtual void downloadSFXFinished(int) {}
    virtual void downloadSFXFailed(int, GJSongError) {}
    virtual void musicActionFinished(GJMusicAction) {}
    virtual void musicActionFailed(GJMusicAction) {}
}

[[link(android)]]
class MusicDownloadManager : cocos2d::CCNode, PlatformDownloadDelegate {
    // virtual ~MusicDownloadManager();

    static MusicDownloadManager* sharedState() = win 0x3275d0, imac 0x571d80;

    void addDLToActive(char const* tag, cocos2d::CCObject* obj) = win 0x329810;
    void addDLToActive(char const* tag);
    TodoReturn addMusicDownloadDelegate(MusicDownloadDelegate*) = win 0x327d50;
    void addSongObjectFromString(gd::string);
    void clearSong(int songID) {
    	const char* key = cocos2d::CCString::createWithFormat("%i", songID)->getCString();
    	m_songObjects->removeObjectForKey(key);
    }
    void clearUnusedSongs() = win 0x328f80;
    void createArtistsInfo(gd::string) = win 0x328a70;
    void createSongsInfo(gd::string, gd::string) = win 0x3286c0, imac 0x574e80;
    void dataLoaded(DS_Dictionary*) = win 0x32a270, imac 0x578180;
    void deleteSFX(int);
    void deleteSong(int);
    void downloadCustomSong(int) = win 0x32ab60;
    void downloadMusicLibrary();
    void downloadSFX(int);
    void downloadSFXFailed(int, GJSongError);
    void downloadSFXFinished(int);
    void downloadSFXLibrary();
    void downloadSong(int) = win 0x329280, imac 0x576790;
    void downloadSongFailed(int, GJSongError);
    void downloadSongFinished(int);
    void encodeDataTo(DS_Dictionary*);
    TodoReturn filterMusicByArtistID(int, cocos2d::CCArray*);
    TodoReturn filterMusicByTag(int, cocos2d::CCArray*);
    void firstSetup();
    TodoReturn generateCustomContentURL(gd::string) = win 0x32e100;
    TodoReturn generateResourceAssetList();
    TodoReturn getAllMusicArtists(OptionsObjectDelegate*);
    TodoReturn getAllMusicObjects(GJSongType);
    TodoReturn getAllMusicTags(OptionsObjectDelegate*);
    TodoReturn getAllSFXObjects(bool);
    TodoReturn getAllSongs();
    void getCustomContentURL() = win 0x32a760, imac 0x5787f0;
    cocos2d::CCObject* getDLObject(char const*) = win 0x39d70;
    cocos2d::CCArray* getDownloadedSongs() = win 0x328ec0;
    TodoReturn getDownloadProgress(int);
    TodoReturn getMusicArtistForID(int);
    TodoReturn getMusicObject(int);
    TodoReturn getSFXDownloadKey(int);
    TodoReturn getSFXDownloadProgress(int);
    TodoReturn getSFXFolderObjectForID(int);
    TodoReturn getSFXFolderPathForID(int, bool);
    TodoReturn getSFXObject(int);
    TodoReturn getSongDownloadKey(int);
    void getSongInfo(int, bool) = win 0x327fa0, imac 0x573510;
    TodoReturn getSongInfoKey(int);
    SongInfoObject* getSongInfoObject(int) = win 0x329990, imac 0x5733b0;
    TodoReturn getSongPriority();
    void handleIt(bool, gd::string, gd::string, GJHttpType);
    void handleItDelayed(bool, gd::string, gd::string, GJHttpType);
    void handleItND(cocos2d::CCNode*, void*);
    TodoReturn incrementPriorityForSong(int) = imac 0x573380;
    bool isDLActive(char const* tag);
    bool isMusicLibraryLoaded();
    bool isResourceSFX(int);
    bool isResourceSong(int id) {
    	return m_resourceSongUnorderedSet.contains(id);
    }
    bool isRunningActionForSongID(int) = imac 0x573030;
    bool isSFXDownloaded(int);
    bool isSFXLibraryLoaded();
    bool isSongDownloaded(int) = win 0x329aa0;
    void limitDownloadedSongs();
    void loadSongInfoFailed(int, GJSongError);
    void loadSongInfoFinished(SongInfoObject*) = win 0x32ea90;
    void musicActionFailed(GJMusicAction);
    void musicActionFinished(GJMusicAction);
    TodoReturn nameForTagID(int);
    void onDownloadMusicLibraryCompleted(cocos2d::extension::CCHttpClient*, cocos2d::extension::CCHttpResponse*);
    void onDownloadSFXCompleted(cocos2d::extension::CCHttpClient*, cocos2d::extension::CCHttpResponse*);
    void onDownloadSFXLibraryCompleted(cocos2d::extension::CCHttpClient*, cocos2d::extension::CCHttpResponse*);
    void onDownloadSongCompleted(cocos2d::extension::CCHttpClient*, cocos2d::extension::CCHttpResponse*) = win 0x329570;
    void onGetCustomContentURLCompleted(gd::string, gd::string);
    void onGetSongInfoCompleted(gd::string, gd::string) = win 0x328280;
    void onProcessHttpRequestCompleted(cocos2d::extension::CCHttpClient*, cocos2d::extension::CCHttpResponse*);
    void onTryUpdateMusicLibraryCompleted(cocos2d::extension::CCHttpClient*, cocos2d::extension::CCHttpResponse*);
    void onTryUpdateSFXLibraryCompleted(cocos2d::extension::CCHttpClient*, cocos2d::extension::CCHttpResponse*);
    void parseMusicLibrary();
    void parseSFXLibrary();
    gd::string pathForSFX(int) = win 0x32a050, imac 0x577cc0;
    gd::string pathForSFXFolder(int) = win 0x329f00;
    gd::string pathForSong(int) = win 0x329d20;
    gd::string pathForSongFolder(int) = win 0x329bd0;
    void ProcessHttpGetRequest(gd::string, gd::string, cocos2d::extension::SEL_HttpResponse, int, int) = imac 0x5721e0;
    callback void ProcessHttpRequest(gd::string, gd::string, gd::string, GJHttpType);
    void removeDLFromActive(char const*);
    TodoReturn removeMusicDownloadDelegate(MusicDownloadDelegate*);
    static cocos2d::CCDictionary* responseToDict(gd::string, char const*);
    void showTOS(FLAlertLayerProtocol*) = win 0x32a110;
    void songStateChanged() = win 0x327f40;
    TodoReturn stopDownload(int) = imac 0x573100;
    TodoReturn storeMusicObject(SongInfoObject*);
    TodoReturn storeSFXInfoObject(SFXInfoObject*);
    TodoReturn tryLoadLibraries();
    TodoReturn tryUpdateMusicLibrary();
    TodoReturn tryUpdateSFXLibrary();

    virtual bool init();

    cocos2d::CCDictionary* m_activeDownloads;
    cocos2d::CCArray* m_musicDownloadDelegates;
    cocos2d::CCDictionary* m_songObjects;
    cocos2d::CCDictionary* m_MDLM003;
    int m_songPriority;
    gd::string m_customContentURL;
    cocos2d::CCDictionary* m_sfxObjects;
    cocos2d::CCArray* m_sfxArtists;
    int m_sfxLibraryVersion;
    int m_sfxObjectCount;
    bool m_requestedSfxLibraryDownloaded;
    cocos2d::CCDictionary* m_musicObjects;
    cocos2d::CCDictionary* m_musicArtists;
    gd::map<int, gd::string> m_musicTags;
    int m_musicLibraryVersion;
    int m_musicObjectCount;
    bool m_requestedMusicLibraryDownloaded;
    bool m_triedToLoadLibraries;
    bool m_unkBool;
    gd::unordered_set<int> m_resourceSfxUnorderedSet;
    gd::unordered_set<int> m_resourceSongUnorderedSet;
}

[[link(android)]]
class MusicSearchResult : cocos2d::CCObject, OptionsObjectDelegate {
    // virtual ~MusicSearchResult();
    MusicSearchResult() = win 0x3267b0;

    static MusicSearchResult* create(GJSongType songType) {
    	auto ret = new MusicSearchResult();
    	if (ret->init(songType)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    cocos2d::CCArray* applyArtistFilters(cocos2d::CCArray*);
    cocos2d::CCArray* applyTagFilters(cocos2d::CCArray*) = win 0x331350, imac 0x5809f0;
    void createArtistFilterObjects();
    void createTagFilterObjects();
    cocos2d::CCArray* getFilesMatchingSearch(cocos2d::CCArray*, gd::string) = win 0x331980, imac 0x5816c0;
    bool init(GJSongType songType) {
    	m_songType = songType;
    	return true;
    }
    void updateFutureCount(cocos2d::CCArray*, cocos2d::CCArray*);
    void updateObjects() {
    	this->updateObjects(m_sortType);
    }

    virtual void updateObjects(AudioSortType) = win 0x331430, imac 0x5813b0;
    virtual void stateChanged(OptionsObject*) = win 0x331420;

    cocos2d::CCArray* m_filterObjects;
    cocos2d::CCArray* m_tagFilterObjects;
    cocos2d::CCArray* m_artistFilterObjects;
    int m_startIndex;
    int m_audioType;
    gd::string m_searchQuery;
    AudioSortType m_sortType;
    bool m_tagFilter;
    bool m_artistFilter;
    GJSongType m_songType;
}

[[link(android)]]
class NCSInfoLayer {
    // virtual ~NCSInfoLayer();

    static NCSInfoLayer* create(CustomSongLayer*);

    bool init(CustomSongLayer*);
    void onClose(cocos2d::CCObject* sender);
    void onLibrary(cocos2d::CCObject* sender);
    void onNCS(cocos2d::CCObject* sender);
    void onNCSIO(cocos2d::CCObject* sender);
    void onNCSUsage(cocos2d::CCObject* sender);

    virtual void keyBackClicked();
}

[[link(android)]]
class NewgroundsInfoLayer : FLAlertLayer, FLAlertLayerProtocol {
    // virtual ~NewgroundsInfoLayer();

    static NewgroundsInfoLayer* create();

    void onArtists(cocos2d::CCObject* sender);
    void onChanges(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    void onGuidelines(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender);
    void onNewgrounds(cocos2d::CCObject* sender);
    void onSupporter(cocos2d::CCObject* sender);

    virtual bool init() = imac 0x205350;
    virtual void keyBackClicked();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool);
}

[[link(android)]]
class NodePoint : cocos2d::CCObject {
    // virtual ~NodePoint();

    static NodePoint* create(cocos2d::CCPoint);

    bool init(cocos2d::CCPoint);

    cocos2d::CCPoint m_point;
}

[[link(android)]]
class NumberInputDelegate {
    virtual void numberInputClosed(NumberInputLayer*) {}
}

[[link(android)]]
class NumberInputLayer : FLAlertLayer {
    // virtual ~NumberInputLayer();
    NumberInputLayer() {
    	m_okButton = nullptr;
    	m_minimum = 4;
    	m_maximum = 4;
    	m_inputString = "";
    	m_delegate = nullptr;
    }

    static NumberInputLayer* create() {
    	auto ret = new NumberInputLayer();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void deleteLast() {
    	if (!m_inputString.empty()) {
    		m_inputString = m_inputString.substr(0, m_inputString.size() - 1);
    		this->updateNumberState();
    	}
    }
    void inputNumber(int num) {
    	if (m_inputString.size() < m_maximum) {
    		m_inputString += cocos2d::CCString::createWithFormat("%i", num)->getCString();
    		this->updateNumberState();
    	}
    }
    void onClose(cocos2d::CCObject* sender);
    void onDone(cocos2d::CCObject* sender) {
    	if (m_delegate) m_delegate->numberInputClosed(this);
    	this->onClose(nullptr);
    }
    void onNumber(cocos2d::CCObject* sender) = win 0x332ab0, imac 0x47f0a0;
    void updateNumberState() = win 0x332c40;

    virtual bool init() = win 0x332500;
    virtual void registerWithTouchDispatcher() = win 0x52d60;
    virtual void keyBackClicked();

    cocos2d::CCLabelBMFont* m_inputLabel;
    CCMenuItemSpriteExtra* m_okButton;
    int m_minimum;
    int m_maximum;
    gd::string m_inputString;
    NumberInputDelegate* m_delegate;
}

[[link(android)]]
class OBB2D : cocos2d::CCNode {
    // virtual ~OBB2D();

    static OBB2D* create(cocos2d::CCPoint, float, float, float) = win 0x6d880;

    void calculateWithCenter(cocos2d::CCPoint, float, float, float) = win 0x6da50, imac 0x5db1a0;
    TodoReturn computeAxes();
    TodoReturn getBoundingRect();
    bool init(cocos2d::CCPoint, float, float, float);
    TodoReturn orderCorners() = win 0x6dd70;
    TodoReturn overlaps(OBB2D*);
    TodoReturn overlaps1Way(OBB2D*) = win 0x6e100;
}

[[link(android)]]
class ObjectControlGameObject : EffectGameObject {
    // virtual ~ObjectControlGameObject();

    static ObjectControlGameObject* create();

    virtual bool init();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class ObjectManager : cocos2d::CCNode {
    // virtual ~ObjectManager();

    TodoReturn animLoaded(char const*);
    TodoReturn getDefinition(char const*);
    TodoReturn getGlobalAnimCopy(char const*);
    static ObjectManager* instance() = win 0x6e3d0;
    TodoReturn loadCopiedAnimations() = win 0x6e800;
    TodoReturn loadCopiedSets();
    TodoReturn purgeObjectManager();
    TodoReturn replaceAllOccurencesOfString(cocos2d::CCString*, cocos2d::CCString*, cocos2d::CCDictionary*);
    void setLoaded(char const*);
    void setup() = win 0x6e4c0;

    virtual bool init() = win 0x6e460;
}

[[link(android)]]
class ObjectToolbox : cocos2d::CCNode {
    // virtual ~ObjectToolbox();

    static ObjectToolbox* sharedState() = win 0x332db0;

    TodoReturn allKeys();
    float gridNodeSizeForKey(int key) = win 0x35aca0, imac 0x7034f0;
    const char* intKeyToFrame(int key) {
    	return m_allKeys[key].c_str();
    }
    TodoReturn perspectiveBlockFrame(int);

    virtual bool init() = win 0x332e70;

    gd::map<int, gd::string> m_allKeys;
}

[[link(android)]]
class OnlineListDelegate {
    virtual void loadListFinished(cocos2d::CCArray*, char const*) {}
    virtual void loadListFailed(char const*) {}
    virtual void setupPageInfo(gd::string, char const*) {}
}

[[link(android)]]
class OpacityEffectAction {
    TodoReturn step(float);

    PAD = win 0x2c;
}

[[link(android)]]
class OptionsCell : TableViewCell {
    // virtual ~OptionsCell();
    OptionsCell(char const*, float, float);

    void loadFromObject(OptionsObject*) = win 0xb49f0, imac 0x232040;
    void onToggleOption(cocos2d::CCObject* sender);
    TodoReturn updateBGColor(int);
}

[[link(android)]]
class OptionsLayer : GJDropDownLayer, FLAlertLayerProtocol {
    // virtual ~OptionsLayer();
    inline OptionsLayer() {
    	m_optionsMenu = nullptr;
    	m_unknown = nullptr;
    	m_layerChoice = 0;
    	m_recordReplays = false;
    	m_musicSlider = nullptr;
    	m_sfxSlider = nullptr;
    	m_lastVaultDialog = -1;
    }

    static OptionsLayer* create() {
    	auto ret = new OptionsLayer();
    	if (ret->init("Settings")) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    TodoReturn createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint);
    void exitLayer();
    void musicSliderChanged(cocos2d::CCObject*) = win 0x35ca90, imac 0x784550;
    void onAccount(cocos2d::CCObject* sender) = win 0x35d580;
    void onHelp(cocos2d::CCObject* sender) = win 0x35d530;
    void onMenuMusic(cocos2d::CCObject* sender);
    void onOptions(cocos2d::CCObject* sender) = win 0x35cc70;
    void onProgressBar(cocos2d::CCObject* sender);
    void onRate(cocos2d::CCObject* sender);
    void onRecordReplays(cocos2d::CCObject* sender);
    void onSecretVault(cocos2d::CCObject* sender) = win 0x35cdd0;
    void onSoundtracks(cocos2d::CCObject* sender);
    void onSupport(cocos2d::CCObject* sender);
    void onVideo(cocos2d::CCObject* sender);
    void sfxSliderChanged(cocos2d::CCObject*);
    void tryEnableRecord();

    virtual void customSetup() = win 0x35be10;
    virtual void layerHidden() = win 0x35d660, imac 0x784a10;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) {}

    cocos2d::CCMenu* m_optionsMenu;
    void* m_unknown;
    int m_layerChoice;
    bool m_recordReplays;
    Slider* m_musicSlider;
    Slider* m_sfxSlider;
    int m_lastVaultDialog;
}

[[link(android)]]
class OptionsObject : cocos2d::CCObject {
    // virtual ~OptionsObject();

    static OptionsObject* create(int, bool, gd::string, OptionsObjectDelegate*);

    bool init(int, bool, gd::string, OptionsObjectDelegate*);
    TodoReturn toggleState();
}

[[link(android)]]
class OptionsObjectDelegate {
    virtual void stateChanged(OptionsObject*);
}

[[link(android)]]
class OptionsScrollLayer : FLAlertLayer, TableViewCellDelegate {
    // virtual ~OptionsScrollLayer();

    static OptionsScrollLayer* create(cocos2d::CCArray*, bool, int);

    TodoReturn getRelevantObjects(cocos2d::CCArray*);
    bool init(cocos2d::CCArray*, bool, int);
    void onClose(cocos2d::CCObject* sender);
    void setupList(cocos2d::CCArray*);

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual bool cellPerformedAction(TableViewCell*, int, CellAction, cocos2d::CCNode*) = imac 0x5f84a0;
}

[[link(android)]]
class ParentalOptionsLayer : FLAlertLayer {
    // virtual ~ParentalOptionsLayer();

    static ParentalOptionsLayer* create();

    TodoReturn addToggle(char const*, char const*, char const*);
    TodoReturn countForPage(int);
    void goToPage(int);
    TodoReturn incrementCountForPage(int);
    TodoReturn infoKey(int);
    TodoReturn layerForPage(int);
    TodoReturn layerKey(int);
    TodoReturn nextPosition(int);
    TodoReturn objectKey(int);
    TodoReturn objectsForPage(int);
    void onClose(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender);
    void onNextPage(cocos2d::CCObject* sender);
    void onPrevPage(cocos2d::CCObject* sender);
    void onToggle(cocos2d::CCObject* sender);
    TodoReturn pageKey(int);

    virtual bool init();
    virtual void keyBackClicked();
}

[[link(android)]]
class ParticleGameObject : EnhancedGameObject {
    // virtual ~ParticleGameObject();

    static ParticleGameObject* create();

    TodoReturn applyParticleSettings(cocos2d::CCParticleSystemQuad*);
    TodoReturn createAndAddCustomParticle();
    TodoReturn createParticlePreviewArt();
    void setParticleString(gd::string) = win 0x487f30, imac 0x1a0da0;
    void updateParticle() = win 0x487fc0, imac 0x1a0e30;
    TodoReturn updateParticleAngle(float, cocos2d::CCParticleSystemQuad*) = imac 0x1a0ad0;
    TodoReturn updateParticlePreviewArtOpacity(float);
    TodoReturn updateParticleScale(float);
    TodoReturn updateParticleStruct() = imac 0x1a0610;

    virtual bool init();
    virtual void setScaleX(float);
    virtual void setScaleY(float);
    virtual void setScale(float);
    virtual void setRotation(float);
    virtual void setRotationX(float);
    virtual void setRotationY(float);
    virtual void setChildColor(cocos2d::ccColor3B const&);
    virtual void customSetup();
    virtual void addMainSpriteToParent(bool);
    virtual void resetObject();
    virtual void deactivateObject(bool);
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
    virtual void claimParticle() = imac 0x1a0640;
    virtual void unclaimParticle() = imac 0x1a0be0;
    virtual void particleWasActivated() = imac 0x1a0c60;
    virtual void setObjectColor(cocos2d::ccColor3B const&);
    virtual void blendModeChanged() = imac 0x1a0520;
    virtual void updateParticleColor(cocos2d::ccColor3B const&);
    virtual void updateParticleOpacity(unsigned char);
    virtual void updateMainParticleOpacity(unsigned char) = imac 0x1a1590;
    virtual void updateSecondaryParticleOpacity(unsigned char) = imac 0x1a15f0;
    virtual void updateSyncedAnimation(float, int) = imac 0x1a16f0;
    virtual TodoReturn updateAnimateOnTrigger(bool) = imac 0x1a1840;

    gd::string m_particleData;
    bool m_updatedParticleData;
    PAD = android32 0x10f, win 0x123;

    // property 147
    bool m_hasUniformObjectColor;
    PAD = android32 0x7, win 0x7;

    // property 211
    bool m_shouldQuickStart;
    PAD = android32 0xf, win 0xf;
}

[[link(android)]]
class ParticlePreviewLayer : cocos2d::CCLayerColor {
    // virtual ~ParticlePreviewLayer();

    static ParticlePreviewLayer* create(cocos2d::CCParticleSystemQuad*);

    bool init(cocos2d::CCParticleSystemQuad*);
    TodoReturn postVisit();
    TodoReturn preVisitWithClippingRect(cocos2d::CCRect);

    virtual void draw();
    virtual void visit() = imac 0x463ed0;
}

[[link(android)]]
class PauseLayer : CCBlockLayer, FLAlertLayerProtocol {
    // virtual ~PauseLayer();
    PauseLayer() {}

    static PauseLayer* create(bool p0) {
    	auto ret = new PauseLayer();
    	if (ret && ret->init(p0)) {
    		ret->autorelease();
    		return ret;
    	}
    	CC_SAFE_DELETE(ret);
    	return nullptr;
    }

    TodoReturn createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint);
    void goEdit() = win 0x3689a0;
    bool init(bool p0) {
    	m_unkBool1 = p0;
    	return CCBlockLayer::init();
    }
    void musicSliderChanged(cocos2d::CCObject*);
    void onEdit(cocos2d::CCObject* sender);
    void onHelp(cocos2d::CCObject* sender);
    void onNormalMode(cocos2d::CCObject* sender);
    void onPracticeMode(cocos2d::CCObject* sender);
    void onQuit(cocos2d::CCObject* sender) = win 0x368c70;
    void onRecordReplays(cocos2d::CCObject* sender);
    void onReplay(cocos2d::CCObject* sender);
    void onRestart(cocos2d::CCObject* sender);
    void onRestartFull(cocos2d::CCObject* sender);
    void onResume(cocos2d::CCObject* sender);
    void onSettings(cocos2d::CCObject* sender) = win 0x3675f0;
    void onTime(cocos2d::CCObject* sender);
    void setupProgressBars();
    void sfxSliderChanged(cocos2d::CCObject*);
    TodoReturn tryShowBanner(float);
    void tryQuit(cocos2d::CCObject* sender) = win 0x368a70;

    virtual void keyBackClicked() = win 0x368e90, imac 0x3c4400;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x368dc0, imac 0x3c4300;
    virtual void customSetup() = win 0x366920, imac 0x3c24b0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x368c00;
    virtual void keyUp(cocos2d::enumKeyCodes) {}

    bool m_unkBool1;
    bool m_unkBool2;
}

[[link(android)]]
class PlatformDownloadDelegate {
    virtual void downloadFinished(char const*) {}
    virtual void downloadFailed(char const*) {}
}

[[link(android)]]
class PlatformToolbox {
    static void activateGameCenter();
    static TodoReturn copyToClipboard(gd::string);
    static TodoReturn doesFileExist(gd::string);
    static TodoReturn downloadAndSavePromoImage(gd::string, gd::string);
    static TodoReturn gameDidSave();
    static TodoReturn getDeviceRefreshRate();
    static cocos2d::CCSize getDisplaySize() = win 0x786d0, imac 0x4b0c70;
    static TodoReturn getRawPath(char const*);
    static TodoReturn getUniqueUserID();
    static TodoReturn getUserID();
    static void hideCursor() {
    	cocos2d::CCEGLView::sharedOpenGLView()->showCursor(false);
    }
    static bool isControllerConnected() {
    	#ifdef GEODE_IS_WINDOWS
    		return cocos2d::CCApplication::sharedApplication()->getControllerConnected();
    	#else
    		return false;
    	#endif
    }
    static bool isHD();
    static bool isLocalPlayerAuthenticated();
    static bool isLowMemoryDevice();
    static bool isNetworkAvailable();
    static bool isSignedInGooglePlay();
    static TodoReturn loadAndDecryptFileToString(char const*, char const*);
    static TodoReturn logEvent(char const*);
    static TodoReturn onGameLaunch();
    static void onNativePause();
    static TodoReturn onNativeResume();
    static TodoReturn onToggleKeyboard();
    static TodoReturn openAppPage();
    static void platformShutdown();
    static TodoReturn refreshWindow();
    static TodoReturn reportAchievementWithID(char const*, int);
    static TodoReturn reportLoadingFinished();
    static void resizeWindow(float width, float height);
    static TodoReturn saveAndEncryptStringToFile(gd::string, char const*, char const*);
    static TodoReturn sendMail(char const*, char const*, char const*);
    static void setBlockBackButton(bool);
    static void setKeyboardState(bool);
    static TodoReturn shouldResumeSound();
    static void showAchievements();
    static void showCursor() {
    	cocos2d::CCEGLView::sharedOpenGLView()->showCursor(true);
    }
    static TodoReturn signInGooglePlay();
    static TodoReturn signOutGooglePlay();
    static TodoReturn spriteFromSavedFile(gd::string);
    static TodoReturn toggleCallGLFinish(bool);
    static TodoReturn toggleCPUSleepMode(bool);
    static void toggleForceTimer(bool);
    static void toggleFullScreen(bool);
    static void toggleLockCursor(bool);
    static TodoReturn toggleMouseControl(bool);
    static void toggleSmoothFix(bool);
    static void toggleVerticalSync(bool);
    static TodoReturn tryShowRateDialog(gd::string);
    static TodoReturn updateMouseControl();
    static TodoReturn updateWindowedSize(float, float);
}

[[]]
class PlayerButtonCommand {
    PlayerButton m_button;
    bool m_isPush;
    bool m_isPlayer2;
    int m_step;
}

[[link(android)]]
class PlayerCheckpoint : cocos2d::CCNode {
    // virtual ~PlayerCheckpoint();
    PlayerCheckpoint();

    static PlayerCheckpoint* create() = win 0x3a4030;

    virtual bool init();

    cocos2d::CCPoint m_position;
    cocos2d::CCPoint m_lastPosition;
    int m_unkInt1;
    bool m_isUpsideDown;
    bool m_unk7b3;
    bool m_isShip;
    bool m_isBall;
    bool m_isBird;
    bool m_isSwing;
    bool m_isDart;
    bool m_isRobot;
    bool m_isSpider;
    bool m_isOnGround;
    PAD = win 0x2;
    int m_hasGhostTrail;
    std::array<uint8_t, 4> m_unkBytes1;
    float m_speed;
    bool m_isHidden;
    bool m_isGoingLeft;
    std::array<uint8_t, 34> m_unkBytes2;
    bool m_hideAttemptCount;
    std::array<uint8_t, 7> m_unkBytes3;
    bool m_unkBool;
    float m_unkFloat1;
    int m_possiblyFlags;
    int m_timeOrPercentRelated;
    std::array<uint8_t, 4> m_unkBytes4;
    gd::vector<float> m_yPositionVector;
    std::array<uint8_t, 8> m_unkBytes5;
}

[[link(android)]]
class PlayerControlGameObject : EffectGameObject {
    // virtual ~PlayerControlGameObject();

    static PlayerControlGameObject* create();

    virtual bool init();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class PlayerFireBoostSprite : cocos2d::CCSprite {
    // virtual ~PlayerFireBoostSprite();

    static PlayerFireBoostSprite* create() = win 0x38cd50, imac 0x3e99c0;

    void animateFireIn() {
    	this->stopAllActions();

    	auto scaleto = cocos2d::CCScaleTo::create(0.06f, m_size * 0.6f, m_size * 1.5f);
    	auto callfunc = cocos2d::CCCallFunc::create(this, callfunc_selector(PlayerFireBoostSprite::loopFireAnimation));
    	auto sequence = cocos2d::CCSequence::create(scaleto, callfunc, nullptr);
    	this->runAction(sequence);
    }
    void animateFireOut() {
    	this->stopAllActions();
    	auto action = cocos2d::CCScaleTo::create(0.4f, 0.01f, 0.01f);
    	this->runAction(action);
    }
    void loopFireAnimation() = win 0x38ce50;

    virtual bool init();

    float m_size;
}

[[link(android), depends(GJPointDouble)]]
class PlayerObject : GameObject, AnimatedSpriteDelegate {
    // virtual ~PlayerObject();
    // PlayerObject() = ios 0x23e4dc;

    static PlayerObject* create(int, int, GJBaseGameLayer*, cocos2d::CCLayer*, bool) = win 0x370780, imac 0x3e7d20;

    void activateStreak() = win 0x38a120, imac 0x3f0c00;
    TodoReturn addAllParticles() = win 0x372720;
    TodoReturn addToTouchedRings(RingObject*) = imac 0x4035c0;
    TodoReturn addToYVelocity(double, int);
    void animatePlatformerJump(float) = win 0x376d10, imac 0x3f1460;
    void boostPlayer(float) = win 0x389f70;
    void bumpPlayer(float, int, bool, GameObject*) = win 0x389730, imac 0x408880;
    TodoReturn buttonDown(PlayerButton);
    TodoReturn canStickToGround();
    TodoReturn checkSnapJumpToObject(GameObject*);
    void collidedWithObject(float, GameObject*, cocos2d::CCRect, bool) = win 0x37b9a0, imac 0x3f40d0;
    void collidedWithObject(float, GameObject*) = imac 0x3fa960;
    void collidedWithObjectInternal(float, GameObject*, cocos2d::CCRect, bool) = win 0x37ba60;
    void collidedWithSlope(float dt, GameObject* object, bool forced) = imac 0x3f4170;
    void collidedWithSlopeInternal(float dt, GameObject* object, bool forced) = win 0x379800;
    TodoReturn convertToClosestRotation(float);
    void copyAttributes(PlayerObject*) = win 0x38a530, imac 0x409310;
    void createFadeOutDartStreak() = win 0x382650;
    void createRobot(int);
    void createSpider(int);
    void deactivateParticle();
    void deactivateStreak(bool) = imac 0x3ea4d0;
    TodoReturn destroyFromHitHead();
    TodoReturn didHitHead();
    void disableCustomGlowColor() {
    	m_hasCustomGlowColor = false;
    }
    void disablePlayerControls() = win 0x389440, imac 0x408580;
    void disableSwingFire() = win 0x384f90;
    void doReversePlayer(bool) = win 0x382500, imac 0x3efc90;
    void enableCustomGlowColor(cocos2d::_ccColor3B const& color) {
    	m_hasCustomGlowColor = true;
    	m_glowColor = color;
    }
    void enablePlayerControls() = win 0x389590, imac 0x4085e0;
    void exitPlatformerAnimateJump();
    void fadeOutStreak2(float) = win 0x38a220, imac 0x4018b0;
    void flashPlayer(float, float, cocos2d::ccColor3B mainColor, cocos2d::ccColor3B secondColor) = imac 0x3fc830;
    void flipGravity(bool, bool) = win 0x384260, imac 0x3f1070;
    TodoReturn flipMod();
    void gameEventTriggered(int p0, int p1) {
    	if (this->m_gameLayer) {
    		this->m_gameLayer->gameEventTriggered(static_cast<GJGameEvent>(p0), p1, static_cast<int>(this->m_savedObjectType));
    	}
    }
    bool getActiveMode() = imac 0x403f50;
    TodoReturn getCurrentXVelocity();
    TodoReturn getModifiedSlopeYVel();
    TodoReturn getOldPosition(float);
    cocos2d::ccColor3B getSecondColor();
    TodoReturn getYVelocity();
    TodoReturn gravityDown();
    TodoReturn gravityUp();
    TodoReturn handlePlayerCommand(int);
    TodoReturn handleRotatedCollisionInternal(float, GameObject*, cocos2d::CCRect, bool, bool, bool) = win 0x379130;
    TodoReturn handleRotatedObjectCollision(float p0, GameObject* p1, cocos2d::CCRect p2, bool p3) {
    	return this->handleRotatedCollisionInternal(p0, p1, p2, p3, false, false);
    }
    TodoReturn handleRotatedSlopeCollision(float, GameObject*, bool);
    TodoReturn hardFlipGravity();
    void hitGround(GameObject*, bool) = win 0x385fc0;
    TodoReturn hitGroundNoJump(GameObject*, bool);
    void incrementJumps() = win 0x376c30, imac 0x3f1030;
    bool init(int, int, GJBaseGameLayer*, cocos2d::CCLayer*, bool) = win 0x370820, imac 0x3e7db0;
    bool isBoostValid(float);
    bool isFlying() {
    	return m_isShip || m_isBird || m_isDart || m_isSwing;
    }
    bool isInBasicMode() {
    	return !this->isFlying() && !m_isBall && !m_isSpider;
    }
    bool isInNormalMode() {
    	return !this->isFlying() && !m_isBall && !m_isRobot && !m_isSpider;
    }
    bool isSafeFlip(float);
    bool isSafeHeadTest();
    bool isSafeMode(float);
    bool isSafeSpiderFlip(float);
    TodoReturn levelFlipFinished() = win 0x375800;
    bool levelFlipping() {
    	return m_playEffects && PlayLayer::get()->isFlipping();
    }
    TodoReturn levelWillFlip() = imac 0x3f0d70;
    void loadFromCheckpoint(PlayerCheckpoint*) = win 0x38ba50, imac 0x409d50;
    void lockPlayer() = win 0x389360, imac 0x408420;
    TodoReturn logValues();
    void modeDidChange();
    TodoReturn performSlideCheck();
    void placeStreakPoint() = win 0x38a710, imac 0x3f0ce0;
    TodoReturn playBumpEffect(int, GameObject*) = win 0x389ae0;
    TodoReturn playBurstEffect();
    void playCompleteEffect(bool, bool) = win 0x36e0d0, imac 0x201dc0;
    void playDeathEffect() = win 0x368fc0;
    void playDynamicSpiderRun() = win 0x38b560;
    void playerDestroyed(bool) = win 0x381d30, imac 0x4016b0;
    bool playerIsFalling(float);
    TodoReturn playerIsFallingBugged();
    TodoReturn playerIsMovingUp();
    TodoReturn playerTeleported();
    TodoReturn playingEndEffect() = imac 0x408800;
    void playSpawnEffect() = win 0x381470, imac 0x400ff0;
    void playSpiderDashEffect(cocos2d::CCPoint from, cocos2d::CCPoint to) = win 0x37f160;
    void postCollision(float) = win 0x377610;
    void preCollision() = imac 0x3f1e80;
    bool preSlopeCollision(float, GameObject*) = win 0x3792d0;
    void propellPlayer(float, bool, int) = win 0x3898e0;
    bool pushButton(PlayerButton) = win 0x381f30, imac 0x401c10;
    TodoReturn pushDown();
    void pushPlayer(float);
    TodoReturn redirectDash(float);
    TodoReturn redirectPlayerForce(float, float, float, float);
    void releaseAllButtons() = win 0x389190;
    bool releaseButton(PlayerButton) = win 0x3821c0, imac 0x403080;
    TodoReturn removeAllParticles();
    void removePendingCheckpoint() = win 0x38c220, imac 0x400830;
    TodoReturn removePlacedCheckpoint() = imac 0x401670;
    TodoReturn resetAllParticles();
    TodoReturn resetCollisionLog(bool);
    TodoReturn resetCollisionValues();
    void resetPlayerIcon() = win 0x385370, imac 0x4048a0;
    TodoReturn resetStateVariables();
    void resetStreak() = imac 0x3f0b10;
    TodoReturn resetTouchedRings() = win 0x3822d0;
    TodoReturn reverseMod();
    void reversePlayer(EffectGameObject*) = win 0x382420, imac 0x403620;
    void ringJump(RingObject*, bool) = win 0x382bf0, imac 0x402090;
    void rotateGameplay(int, int, bool, float, float, bool, bool);
    TodoReturn rotateGameplayObject(GameObject*) = win 0x37b3e0;
    void rotateGameplayOnly(bool param) {
    	m_isSideways = param;
    	this->updatePlayerArt();
    }
    TodoReturn rotatePreSlopeObjects();
    void runBallRotation(float) = win 0x3772b0;
    void runBallRotation2() = win 0x377510;
    void runNormalRotation() {
    	this->runNormalRotation(false, 1.0f);
    }
    void runNormalRotation(bool, float) = imac 0x3ed660;
    void runRotateAction(bool, int) = win 0x3773e0;
    TodoReturn saveToCheckpoint(PlayerCheckpoint*);
    void setSecondColor(cocos2d::ccColor3B const&) = win 0x387430, imac 0x3eb7e0;
    void setupStreak() = win 0x372870;
    void setYVelocity(double, int) = win 0x372dc0;
    TodoReturn spawnCircle();
    TodoReturn spawnCircle2();
    TodoReturn spawnDualCircle();
    TodoReturn spawnFromPlayer(PlayerObject*, bool);
    TodoReturn spawnPortalCircle(cocos2d::ccColor3B, float) = win 0x381750;
    TodoReturn spawnScaleCircle() = imac 0x401420;
    TodoReturn specialGroundHit();
    TodoReturn speedDown();
    TodoReturn speedUp();
    void spiderTestJump(bool) = win 0x37e330;
    void spiderTestJumpInternal(bool) = win 0x37e3e0;
    void spiderTestJumpX(bool);
    void spiderTestJumpY(bool);
    void startDashing(DashRingObject*);
    TodoReturn stopBurstEffect();
    void stopDashing() = win 0x380640;
    void stopParticles() = win 0x375910;
    void stopPlatformerJumpAnimation() = win 0x3770f0, imac 0x3f1940;
    TodoReturn stopRotation(bool, int);
    void stopStreak2() = imac 0x409160;
    void storeCollision(PlayerCollisionDirection, int);
    TodoReturn switchedDirTo(PlayerButton) = win 0x381e20;
    void switchedToMode(GameObjectType) = win 0x385ec0, imac 0x400880;
    TodoReturn testForMoving(float, GameObject*);
    void toggleBirdMode(bool, bool) = win 0x3848b0, imac 0x404ac0;
    void toggleDartMode(bool, bool) = win 0x385020, imac 0x405bc0;
    void toggleFlyMode(bool, bool) = win 0x384580;
    void toggleGhostEffect(GhostType) = win 0x388ec0, imac 0x400e70;
    void togglePlatformerMode(bool val) {
        m_isPlatformer = val;
    }
    void togglePlayerScale(bool, bool) = win 0x38a790;
    void toggleRobotMode(bool, bool) = win 0x385780, imac 0x406680;
    void toggleRollMode(bool, bool) = win 0x385600, imac 0x4062a0;
    void toggleSpiderMode(bool, bool) = win 0x385b00, imac 0x406b00;
    void toggleSwingMode(bool, bool) = win 0x384bb0, imac 0x4051a0;
    void toggleVisibility(bool) = win 0x3754f0;
    TodoReturn touchedObject(GameObject*) = imac 0x40a1b0;
    void tryPlaceCheckpoint();
    TodoReturn unrotateGameplayObject(GameObject*) = win 0x37b6d0;
    TodoReturn unrotatePreSlopeObjects();
    TodoReturn updateCheckpointMode(bool);
    TodoReturn updateCheckpointTest();
    void updateCollide(PlayerCollisionDirection, GameObject*) = win 0x37dfe0, imac 0x3f9f20;
    void updateCollideBottom(float, GameObject*);
    void updateCollideLeft(float, GameObject*);
    void updateCollideRight(float, GameObject*);
    void updateCollideTop(float, GameObject*);
    void updateDashAnimation();
    void updateDashArt() = win 0x3801b0;
    void updateEffects(float param) {
    	m_waveTrail->updateStroke(param);
    }
    void updateGlowColor() = win 0x3874c0;
    TodoReturn updateInternalActions(float) = win 0x38cee0;
    void updateJump(float) = win 0x3759b0, imac 0x3eb850;
    TodoReturn updateJumpVariables();
    TodoReturn updateLastGroundObject(GameObject*);
    TodoReturn updateMove(float) = win 0x374170;
    void updatePlayerArt() = win 0x382850, imac 0x403970;
    void updatePlayerBirdFrame(int) = win 0x388370, imac 0x404ee0;
    void updatePlayerDartFrame(int) = win 0x388a70, imac 0x406030;
    void updatePlayerForce(cocos2d::CCPoint, bool);
    void updatePlayerFrame(int) = win 0x387ce0;
    void updatePlayerGlow() = win 0x38a330, imac 0x4037e0;
    void updatePlayerJetpackFrame(int) = win 0x388140;
    void updatePlayerRobotFrame(int id) {
        if (id < 1) id = 1;
        else if (id > 0x43) id = 0x44;

        createRobot(id);
    }
    void updatePlayerRollFrame(int) = win 0x388610, imac 0x406430;
    void updatePlayerScale() = win 0x38a2b0;
    void updatePlayerShipFrame(int) = win 0x387f10, imac 0x404400;
    void updatePlayerSpiderFrame(int id) {
        if (id < 1) id = 1;
        else if (id > 0x44) id = 0x45;

        createSpider(id);
    }

    void updatePlayerSpriteExtra(gd::string);
    void updatePlayerSwingFrame(int) = win 0x388840, imac 0x4055e0;
    void updateRobotAnimationSpeed() = win 0x38b170;
    void updateRotation(float, float) = win 0x377190, imac 0x3f0160;
    void updateRotation(float) = win 0x37b010, imac 0x3fa7a0;
    void updateShipRotation(float) = win 0x37ac30;
    void updateShipSpriteExtra(gd::string);
    TodoReturn updateSlopeRotation(float);
    TodoReturn updateSlopeYVelocity(float);
    void updateSpecial(float);
    TodoReturn updateStateVariables();
    TodoReturn updateStaticForce(float, float, bool);
    void updateStreakBlend(bool) = imac 0x3ea5a0;
    TodoReturn updateStreaks(float);
    void updateSwingFire() = win 0x384e60;
    void updateTimeMod(float, bool) = win 0x38ade0, imac 0x3e9dd0;
    TodoReturn usingWallLimitedMode();
    TodoReturn yStartDown();
    TodoReturn yStartUp();

    virtual void update(float) = win 0x372e30, imac 0x3ea6b0;
    virtual void setScaleX(float);
    virtual void setScaleY(float);
    virtual void setScale(float);
    virtual void setPosition(cocos2d::CCPoint const&) = win 0x3866d0, imac 0x406fb0;
    virtual void setVisible(bool) = win 0x38c910, imac 0x40a530;
    virtual void setRotation(float);
    virtual void setOpacity(unsigned char);
    virtual void setColor(cocos2d::ccColor3B const&) = win 0x3873a0;
    virtual void setFlipX(bool) = win 0x38c820;
    virtual void setFlipY(bool);
    virtual void resetObject();
    virtual cocos2d::CCPoint getRealPosition() = imac 0x408370;
    virtual OBB2D* getOrientedBox() = imac 0x4096a0;
    virtual float getObjectRotation();
    virtual void animationFinished(char const*) = win 0x38c930, imac 0x40a620;

    cocos2d::CCNode* m_mainLayer;
    bool m_wasTeleported;
    bool m_fixGravityBug;
    bool m_reverseSync;
    double m_yVelocityBeforeSlope;
    double m_dashX;
    double m_dashY;
    double m_dashAngle;
    double m_dashStartTime;
    DashRingObject* m_dashRing;
    double m_slopeStartTime;
    bool m_justPlacedStreak;
    GameObject* m_maybeLastGroundObject;
    cocos2d::CCDictionary* m_collisionLogTop;
    cocos2d::CCDictionary* m_collisionLogBottom;
    cocos2d::CCDictionary* m_collisionLogLeft;
    cocos2d::CCDictionary* m_collisionLogRight;
    int m_lastCollisionBottom;
    int m_lastCollisionTop;
    int m_lastCollisionLeft;
    int m_lastCollisionRight;
    int m_unk50C;
    int m_unk510;
    GameObject* m_currentSlope2;
    GameObject* m_preLastGroundObject;
    float m_slopeAngle;
    bool m_slopeSlidingMaybeRotated;
    bool m_quickCheckpointMode;
    GameObject* m_collidedObject;
    GameObject* m_lastGroundObject;
    GameObject* m_collidingWithLeft;
    GameObject* m_collidingWithRight;
    int m_maybeSavedPlayerFrame;
    double m_scaleXRelated2;
    double m_groundYVelocity;
    double m_yVelocityRelated;
    double m_scaleXRelated3;
    double m_scaleXRelated4;
    double m_scaleXRelated5;
    bool m_isCollidingWithSlope;
    cocos2d::CCSprite* m_dashFireSprite;
    bool m_isBallRotating;
    bool m_unk669;
    GameObject* m_currentSlope3;
    GameObject* m_currentSlope;
    double unk_584;
    int m_collidingWithSlopeId;
    bool m_slopeFlipGravityRelated;
    cocos2d::CCArray* m_particleSystems;
    float m_slopeAngleRadians;
    gd::unordered_map<int, GJPointDouble> m_rotateObjectsRelated;
    gd::unordered_map<int, GameObject*> m_maybeRotatedObjectsMap;
    float m_rotationSpeed;
    float m_rotateSpeed;
    bool m_isRotating;
    bool m_isBallRotating2;
    bool m_hasGlow;
    bool m_isHidden;
    GhostType m_ghostType;
    GhostTrailEffect* m_ghostTrail;
    cocos2d::CCSprite* m_iconSprite;
    cocos2d::CCSprite* m_iconSpriteSecondary;
    cocos2d::CCSprite* m_iconSpriteWhitener;
    cocos2d::CCSprite* m_iconGlow;
    cocos2d::CCSprite* m_vehicleSprite;
    cocos2d::CCSprite* m_vehicleSpriteSecondary;
    cocos2d::CCSprite* m_birdVehicle;
    cocos2d::CCSprite* m_vehicleSpriteWhitener;
    cocos2d::CCSprite* m_vehicleGlow;
    PlayerFireBoostSprite* m_swingFireMiddle;
    PlayerFireBoostSprite* m_swingFireBottom;
    PlayerFireBoostSprite* m_swingFireTop;
    cocos2d::CCSprite* m_dashSpritesContainer;
    cocos2d::CCMotionStreak* m_regularTrail;
    cocos2d::CCMotionStreak* m_shipStreak;
    HardStreak* m_waveTrail;
    double m_speedMultiplier;
    double m_yStart;
    double m_gravity;
    float m_trailingParticleLife;
    float m_unk648;
    double m_gameModeChangedTime;
    bool m_padRingRelated;
    bool m_maybeReducedEffects;
    bool m_maybeIsFalling;
    bool m_shouldTryPlacingCheckpoint;
    bool m_playEffects;
    bool m_maybeCanRunIntoBlocks;
    bool m_hasGroundParticles;
    bool m_hasShipParticles;
    bool m_isOnGround3;
    bool m_checkpointTimeout;
    double m_lastCheckpointTime;
    double m_lastJumpTime;
    double m_lastFlipTime;
    double m_flashTime;
    float m_flashRelated;
    float m_flashRelated1;
    cocos2d::ccColor3B m_colorRelated2;
    cocos2d::ccColor3B m_flashRelated3;
    double m_lastSpiderFlipTime;
    bool m_unkBool5;
    bool m_maybeIsVehicleGlowing;
    bool m_gv0096;
    bool m_gv0100;
    double m_accelerationOrSpeed;
    double m_snapDistance;
    bool m_ringJumpRelated;
    gd::unordered_set<int> m_ringRelatedSet;
    GameObject* m_objectSnappedTo;
    CheckpointObject* m_pendingCheckpoint;
    int m_onFlyCheckpointTries;
    GJRobotSprite* m_robotSprite;
    GJSpiderSprite* m_spiderSprite;
    bool m_maybeSpriteRelated;
    cocos2d::CCParticleSystemQuad* m_playerGroundParticles;
    cocos2d::CCParticleSystemQuad* m_trailingParticles;
    cocos2d::CCParticleSystemQuad* m_shipClickParticles;
    cocos2d::CCParticleSystemQuad* m_vehicleGroundParticles;
    cocos2d::CCParticleSystemQuad* m_ufoClickParticles;
    cocos2d::CCParticleSystemQuad* m_robotBurstParticles;
    cocos2d::CCParticleSystemQuad* m_dashParticles;
    cocos2d::CCParticleSystemQuad* m_swingBurstParticles1;
    cocos2d::CCParticleSystemQuad* m_swingBurstParticles2;
    bool m_useLandParticles0;
    cocos2d::CCParticleSystemQuad* m_landParticles0;
    cocos2d::CCParticleSystemQuad* m_landParticles1;
    float m_landParticlesAngle;
    float m_landParticleRelatedY;
    int m_playerStreak;
    float m_streakRelated1;
    bool m_streakRelated2;
    bool m_streakRelated3;
    ShipStreak m_shipStreakType;
    double m_slopeRotation;
    double m_currentSlopeYVelocity;
    double m_unk3d0;
    double m_blackOrbRelated;
    bool m_unk3e0;
    bool m_unk3e1;
    bool m_isAccelerating;
    bool m_isCurrentSlopeTop;
    double m_collidedTopMinY;
    double m_collidedBottomMaxY;
    double m_collidedLeftMaxX;
    double m_collidedRightMinX;
    bool m_streakRelated4;
    bool m_canPlaceCheckpoint;
    cocos2d::ccColor3B m_colorRelated;
    cocos2d::ccColor3B m_secondColorRelated;
    bool m_hasCustomGlowColor;
    cocos2d::ccColor3B m_glowColor;
    bool m_maybeIsColliding;
    bool m_jumpBuffered;
    bool m_stateRingJump;
    bool m_wasJumpBuffered;
    bool m_wasRobotJump;
    unsigned char m_stateJumpBuffered;
    bool m_stateRingJump2;
    bool m_touchedRing;
    bool m_touchedCustomRing;
    bool m_touchedGravityPortal;
    bool m_maybeTouchedBreakableBlock;
    geode::SeedValueRSV m_jumpRelatedAC2;
    bool m_touchedPad;
    double m_yVelocity;
    double m_fallSpeed;
    bool m_isOnSlope;
    bool m_wasOnSlope;
    float m_slopeVelocity;
    bool m_maybeUpsideDownSlope;
    bool m_isShip;
    bool m_isBird;
    bool m_isBall;
    bool m_isDart;
    bool m_isRobot;
    bool m_isSpider;
    bool m_isUpsideDown;
    bool m_isDead;
    bool m_isOnGround;
    bool m_isGoingLeft;
    bool m_isSideways;
    bool m_isSwing;
    int m_reverseRelated;
    double m_maybeReverseSpeed;
    double m_maybeReverseAcceleration;
    float m_xVelocityRelated2;
    bool m_isDashing;
    int m_unk9e8;
    int m_groundObjectMaterial;
    float m_vehicleSize;
    float m_playerSpeed;
    cocos2d::CCPoint m_shipRotation;
    cocos2d::CCPoint m_lastPortalPos;
    float m_unkUnused3;
    bool m_isOnGround2;
    double m_lastLandTime;
    float m_platformerVelocityRelated;
    bool m_maybeIsBoosted;
    double m_scaleXRelatedTime;
    bool m_decreaseBoostSlide;
    bool m_unkA29;
    bool m_isLocked;
    bool m_controlsDisabled;
    cocos2d::CCPoint m_lastGroundedPos;
    cocos2d::CCArray* m_touchingRings;
    gd::unordered_set<int> m_touchedRings;
    GameObject* m_lastActivatedPortal;
    bool m_hasEverJumped;
    bool m_ringOrStreakRelated;
    cocos2d::ccColor3B m_playerColor1;
    cocos2d::ccColor3B m_playerColor2;
    cocos2d::CCPoint m_position;
    bool m_isSecondPlayer;
    bool m_unkA99;
    double m_totalTime;
    bool m_isBeingSpawnedByDualPortal;
    float m_unkAAC;
    float m_unkAngle1;
    float m_yVelocityRelated3;
    bool m_gamevar0060;
    bool m_swapColors;
    bool m_gamevar0062;
    int m_followRelated;
    gd::vector<float> m_playerFollowFloats;
    float m_unk838;
    int m_stateOnGround;
    unsigned char m_stateUnk;
    unsigned char m_stateNoStickX;
    unsigned char m_stateNoStickY;
    unsigned char m_stateUnk2;
    int m_stateBoostX;
    int m_stateBoostY;
    int m_maybeStateForce2;
    int m_stateScale;
    double m_platformerXVelocity;
    bool m_holdingRight;
    bool m_holdingLeft;
    bool m_leftPressedFirst;
    double m_scaleXRelated;
    bool m_maybeHasStopped;
    float m_xVelocityRelated;
    bool m_maybeGoingCorrectSlopeDirection;
    bool m_isSliding;
    double m_maybeSlopeForce;
    bool m_isOnIce;
    double m_physDeltaRelated;
    bool m_isOnGround4;
    int m_maybeSlidingTime;
    double m_maybeSlidingStartTime;
    double m_changedDirectionsTime;
    double m_slopeEndTime;
    bool m_isMoving;
    bool m_platformerMovingLeft;
    bool m_platformerMovingRight;
    bool m_isSlidingRight;
    double m_maybeChangedDirectionAngle;
    double m_unkUnused2;
    bool m_isPlatformer;
    int m_stateNoAutoJump;
    int m_stateDartSlide;
    int m_stateHitHead;
    int m_stateFlipGravity;
    float m_gravityMod;
    int m_stateForce;
    cocos2d::CCPoint m_stateForceVector;
    bool m_affectedByForces;
    gd::map<int, bool> m_jumpPadRelated;
    float m_somethingPlayerSpeedTime;
    float m_playerSpeedAC;
    bool m_fixRobotJump;
    gd::map<int, bool> m_holdingButtons;
    bool m_inputsLocked;
    gd::string m_currentRobotAnimation;
    bool m_gv0123;
    int m_iconRequestID;
    cocos2d::CCSpriteBatchNode* m_robotBatchNode;
    cocos2d::CCSpriteBatchNode* m_spiderBatchNode;
    cocos2d::CCArray* m_unk958;
    PlayerFireBoostSprite* m_robotFire;
    int m_unkUnused;
    GJBaseGameLayer* m_gameLayer;
    cocos2d::CCLayer* m_parentLayer;
    GJActionManager* m_actionManager;
    bool m_isOutOfBounds;
    float m_fallStartY;
    bool m_disablePlayerSqueeze;
    bool m_robotHasRun3;
    bool m_robotHasRun2;
    bool m_item20;
    bool m_ignoreDamage;
    bool m_enable22Changes;
}

[[link(android)]]
class PlayLayer : GJBaseGameLayer, CCCircleWaveDelegate, CurrencyRewardDelegate, DialogDelegate {
    virtual ~PlayLayer() = win 0x38e740, imac 0xab280;
    PlayLayer() = imac 0xbf5d0;

    static PlayLayer* create(GJGameLevel* level, bool useReplay, bool dontCreateObjects) = imac 0xab6a0;
    static PlayLayer* get() {
    	return GameManager::get()->m_playLayer;
    }

    void addCircle(CCCircleWave* cw) {
    	m_circleWaveArray->addObject(cw);
    }
    void addObject(GameObject*) = win 0x396cd0;
    void addToGroupOld(GameObject*);
    void applyCustomEnterEffect(GameObject*, bool) = win 0x3998c0;

    void applyEnterEffect(GameObject*, int, bool) = win 0x39a5b0;
    bool canPauseGame() {
    	return !m_hasCompletedLevel && !m_levelEndAnimationStarted;
    }
    TodoReturn checkpointWithID(int);
    TodoReturn colorObject(int, cocos2d::ccColor3B);
    TodoReturn commitJumps();
    TodoReturn compareStateSnapshot();
    CheckpointObject* createCheckpoint() = win 0x39df70;
    void createObjectsFromSetupFinished() = win 0x396830, imac 0xb6d90;
    void delayedFullReset();
    void delayedResetLevel() = win 0x3a1c00, imac 0xbaef0;
    void fullReset() = win 0x3a1b00;
    float getCurrentPercent() = win 0x39c890, imac 0xb9bf0;
    int getCurrentPercentInt() { // i love this
    	return static_cast<int>(this->getCurrentPercent());
    }
    TodoReturn getEndPosition();
    TodoReturn getLastCheckpoint();
    TodoReturn getRelativeMod(cocos2d::CCPoint, float, float, float);
    TodoReturn getRelativeModNew(cocos2d::CCPoint, float, float, bool, bool);
    double getTempMilliTime() = win 0x3cef0;
    TodoReturn gravityEffectFinished();
    void incrementJumps() = imac 0xbeb00;
    bool init(GJGameLevel* level, bool useReplay, bool dontCreateObjects) = win 0x38ea90;
    bool isGameplayActive();
    void levelComplete() = win 0x390a50, imac 0xb3950;
    TodoReturn loadActiveSaveObjects(gd::vector<SavedActiveObjectState>&, gd::vector<SavedSpecialObjectState>&);
    void loadDefaultColors();
    TodoReturn loadDynamicSaveObjects(gd::vector<SavedObjectStateRef>&) = imac 0xbdf90;
    void loadFromCheckpoint(CheckpointObject*);
    TodoReturn loadLastCheckpoint();
    CheckpointObject * markCheckpoint() = win 0x3a0500, imac 0xbb2d0;
    void onQuit() = win 0x3a3bd0;
    TodoReturn optimizeColorGroups() = win 0x397b30;
    TodoReturn optimizeOpacityGroups() = win 0x397dc0;
    void pauseGame(bool) = win 0x3a3010, imac 0xbeb90;
    void playEndAnimationToPos(cocos2d::CCPoint) = win 0x3948c0, imac 0xb6300;
    void playPlatformerEndAnimationToPos(cocos2d::CCPoint, bool) = win 0x395250;
    TodoReturn playReplay(gd::string);
    void prepareCreateObjectsFromSetup(gd::string&) = win 0x395da0;
    void prepareMusic(bool) = imac 0xb33e0;
    void processCreateObjectsFromSetup() = win 0x396050;
    TodoReturn processLoadedMoveActions();
    TodoReturn queueCheckpoint();
    void removeAllObjects() = imac 0xb36d0;
    void removeCheckpoint(bool) = win 0x3a0e10;
    void removeFromGroupOld(GameObject*);
    void resetLevel() = win 0x3a1db0, imac 0xb2880;
    void resetLevelFromStart() = win 0x3a1c10;
    void resume() = win 0x3a35e0;
    void resumeAndRestart(bool) = imac 0xbecd0;
    TodoReturn saveActiveSaveObjects(gd::vector<SavedActiveObjectState>&, gd::vector<SavedSpecialObjectState>&);
    TodoReturn saveDynamicSaveObjects(gd::vector<SavedObjectStateRef>&);
    TodoReturn scanActiveSaveObjects();
    TodoReturn scanDynamicSaveObjects() = win 0x3a0fa0, imac 0xae520;
    static cocos2d::CCScene* scene(GJGameLevel* level, bool useReplay, bool dontCreateObjects) = win 0x38e9e0, imac 0xab5f0;
    TodoReturn screenFlipObject(GameObject*);
    void setDamageVerifiedIdx(int);
    void setupHasCompleted() = win 0x38f7e0;
    TodoReturn shouldBlend(int);
    void showCompleteEffect() = win 0x391df0, imac 0xb4570;
    void showCompleteText() = win 0x3917c0, imac 0xb49f0;
    void showEndLayer();
    void showHint() = win 0x39d6e0, imac 0xbad20;
    void showNewBest(bool, int, int, bool, bool, bool) = win 0x392410;
    void showRetryLayer();
    void showTwoPlayerGuide();
    void spawnCircle();
    TodoReturn spawnFirework();
    void startGame() = win 0x3909f0;
    void startGameDelayed() = imac 0xb38e0;
    void startMusic() = win 0x3a3a80, imac 0xb37f0;
    TodoReturn startRecording();
    TodoReturn startRecordingDelayed();
    TodoReturn stopRecording();
    void storeCheckpoint(CheckpointObject*) = win 0x3a0430;
    TodoReturn takeStateSnapshot();
    TodoReturn toggleBGEffectVisibility(bool);
    TodoReturn toggleGhostEffect(int);
    //void toggleDebugDraw(bool) = ios 0x118288;
    void togglePracticeMode(bool practiceMode) = win 0x3a2d40, imac 0xbe5a0;
    TodoReturn tryStartRecord();
    void updateAttempts() = win 0x3a2a90, imac 0xbe7b0;
    void updateEffectPositions();
    void updateInfoLabel() = win 0x39b9b0, imac 0xaf6c0;
    TodoReturn updateInvisibleBlock(GameObject*, float, float, float, float, cocos2d::ccColor3B const&);
    void updateProgressbar() = win 0x39b310;
    void updateScreenRotation(int, bool, bool, float, int, float, int, int);
    void updateTimeWarp(EffectGameObject*, float) = win 0x394860;
    void updateTestModeLabel() = win 0x390960, imac 0xb3610;

    virtual void onEnterTransitionDidFinish() = win 0x3a3fb0, imac 0xbf010;
    virtual void onExit() = win 0x3a3fe0;
    virtual void postUpdate(float) = win 0x39d880, imac 0xbb060;
    virtual TodoReturn checkForEnd() = win 0x39dc50, imac 0xbb390;
    virtual TodoReturn testTime();
    virtual void updateVerifyDamage() = imac 0xbb480;
    virtual void updateAttemptTime(float) = win 0x39df10, imac 0xbb570;
    virtual void updateVisibility(float) = win 0x398300;
    virtual TodoReturn opacityForObject(GameObject*);
    virtual void updateColor(cocos2d::ccColor3B& color, float fadeTime, int colorID, bool blending, float opacity, cocos2d::ccHSVValue& copyHSV, int colorIDToCopy, bool copyOpacity, EffectGameObject* callerObject, int unk1, int unk2) = win 0x39aee0, imac 0xb97c0;
    virtual TodoReturn activateEndTrigger(int, bool, bool);
    virtual void activatePlatformerEndTrigger(EndTriggerGameObject*, gd::vector<int> const&) = win 0x395140, imac 0xb67c0;
    virtual void toggleGlitter(bool) = win 0x39c7f0;
    virtual void destroyPlayer(PlayerObject*, GameObject*) = imac 0xba360;
    virtual TodoReturn toggleGroundVisibility(bool) = win 0x39c640;
    virtual void toggleMGVisibility(bool) = win 0x39c6c0, imac 0xba1e0;
    virtual void toggleHideAttempts(bool) = win 0x39c700, imac 0xba200;
    virtual float timeForPos(cocos2d::CCPoint, int, int, bool, int) = win 0x39c510, imac 0xba090;
    virtual float posForTime(float) = win 0x39c5a0, imac 0xba110;
    virtual void resetSPTriggered() = win 0x39c600;
    virtual void updateTimeWarp(float) = imac 0xb61e0;
    virtual void playGravityEffect(bool) = win 0x39afa0, imac 0xb9830;
    virtual TodoReturn manualUpdateObjectColors(GameObject*) = win 0x399240;
    virtual void checkpointActivated(CheckpointGameObject*) = win 0x39df50, imac 0xbb5e0;
    virtual TodoReturn flipArt(bool) = win 0x39b980, imac 0xba010;
    virtual void updateTimeLabel(int, int, bool) = win 0x39b4b0, imac 0xb9c60;
    virtual TodoReturn checkSnapshot();
    virtual void toggleProgressbar() = win 0x39b6b0;
    virtual TodoReturn toggleInfoLabel() = win 0x39c490;
    virtual void removeAllCheckpoints() = win 0x3a0f50;
    virtual TodoReturn toggleMusicInPractice();
    virtual void currencyWillExit(CurrencyRewardLayer*) = win 0x39d6a0;
    virtual void circleWaveWillBeRemoved(CCCircleWave*) = win 0x39d860;
    virtual void dialogClosed(DialogLayer*) = win 0x39d6c0;

    PAD = win 0x30, android32 0x24, android64 0x2c, mac 0x30, ios 0x30;
    cocos2d::CCArray* m_coinArray;
    PAD = win 0x6e, android32 0x3e, android64 0x6e, mac 0x6e, ios 0x6e;
    bool m_isIgnoreDamageEnabled;
    cocos2d::CCLabelBMFont* m_statusLabel;
    int m_unk3778;
    PAD = win 0x18, android32 0x18, android64 0x18, mac 0x18, ios 0x18;
    float m_unkSomeFloat;
    CheckpointObject* m_currentCheckpoint;
    cocos2d::CCArray* m_checkpointArray;
    cocos2d::CCArray* m_unk37a8;
    int m_unk37b0;
    int m_unk37b4;
    int m_unk37b8;
    cocos2d::CCArray* m_unk37c0;
    int m_unk37c8;
    int m_unk37cc;
    cocos2d::CCArray* m_circleWaveArray;
    cocos2d::CCArray* m_unk37d8;
    int m_unk37e0;
    int m_unk37e4;
    float m_unk37e8;
    cocos2d::CCLabelBMFont* m_attemptLabel;
    cocos2d::CCLabelBMFont* m_percentageLabel;
    bool m_0126;
    cocos2d::CCSprite* m_progressBar;
    cocos2d::CCSprite* m_progressFill;
    // everything after this comment is probably wrong
    PAD = win 0x6e, android32 0x40, android64 0x66, mac 0x56, ios 0x56;
    int m_jumps;
    bool m_hasJumped;
    int m_uncommittedJumps;
    bool m_showLeaderboardPercentage;
    bool m_hasCompletedLevel;
    bool m_inResetDelay;
    int m_lastAttemptPercent;
    bool m_endLayerStars;
    PAD = win 0x3a, android32 0x29, android64 0x3a, mac 0x3a, ios 0x3a;
    double m_attemptTime;
    PAD = win 0x1f, android32 0x27, android64 0x1f, mac 0x1f, ios 0x1f;
    bool m_isPaused;
    bool m_disableGravityEffect;
    cocos2d::CCLabelBMFont* m_infoLabel;
    cocos2d::CCPoint m_pUnk38e8;
    cocos2d::CCPoint m_pUnk38f0;
    cocos2d::CCDictionary* m_colorKeyDict;
    gd::vector<int> m_keyColors;
    gd::vector<int> m_keyOpacities;
    gd::vector<int> m_keyPulses;
    int m_nextColorKey;
    bool m_tryPlaceCheckpoint;
    CheckpointGameObject* m_activatedCheckpoint;
    bool m_bUnk3958;
    cocos2d::CCPoint m_endPosition;
    EndTriggerGameObject* m_platformerEndTrigger;
}

[[link(android)]]
class PointNode : cocos2d::CCObject {
    // virtual ~PointNode();

    static PointNode* create(cocos2d::CCPoint);

    bool init(cocos2d::CCPoint p0) {
    	m_point = p0;

    	return true;
    }

    cocos2d::CCPoint m_point;
}

[[link(android)]]
class PriceLabel : cocos2d::CCNode {
    // virtual ~PriceLabel();

    static PriceLabel* create(int);

    bool init(int);
    void setColor(cocos2d::ccColor3B);
    void setOpacity(float);
    void setPrice(int);
}

[[link(android)]]
class ProfilePage : FLAlertLayer, FLAlertLayerProtocol, LevelCommentDelegate, CommentUploadDelegate, UserInfoDelegate, UploadActionDelegate, UploadPopupDelegate, LeaderboardManagerDelegate {
    // virtual ~ProfilePage();
    // ProfilePage() = ios 0x1a9c90;

    static ProfilePage* create(int accountID, bool ownProfile) = win 0x3a7840, imac 0x7a2490;

    void blockUser();
    bool init(int accountID, bool ownProfile) = win 0x3a7a20;
    bool isCorrect(char const* key);
    bool isOnWatchlist(int);
    void loadPage(int) = win 0x3aec50;
    void loadPageFromUserInfo(GJUserScore*) = win 0x3a9060;
    void onBlockUser(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender) = win 0x3addf0;
    void onComment(cocos2d::CCObject* sender) = win 0x3aca70;
    void onCommentHistory(cocos2d::CCObject* sender) = win 0x3ac9e0, imac 0x7a6c40;
    void onCopyName(cocos2d::CCObject* sender) = win 0x3ac0b0;
    void onFollow(cocos2d::CCObject* sender) = win 0x3ad270;
    void onFriend(cocos2d::CCObject* sender) = win 0x3acc30, imac 0x7a7700;
    void onFriends(cocos2d::CCObject* sender) = win 0x3ae900;
    void onMessages(cocos2d::CCObject* sender) = win 0x3ae8d0;
    void onMyLevels(cocos2d::CCObject* sender) = win 0x3ac6d0, imac 0x7a7e20;
    void onMyLists(cocos2d::CCObject* sender) = win 0x3ac880, imac 0x7a8000;
    void onNextPage(cocos2d::CCObject* sender) = win 0x3af350;
    void onPrevPage(cocos2d::CCObject* sender) = win 0x3af360;
    void onRequests(cocos2d::CCObject* sender) = win 0x3ae930;
    void onSendMessage(cocos2d::CCObject* sender);
    void onSettings(cocos2d::CCObject* sender) = win 0x3ae720;
    void onStatInfo(cocos2d::CCObject* sender) = win 0x3abee0;
    void onTwitch(cocos2d::CCObject* sender) = win 0x3ae580;
    void onTwitter(cocos2d::CCObject* sender) = win 0x3ae3f0;
    void onUpdate(cocos2d::CCObject* sender);
    void onYouTube(cocos2d::CCObject* sender) = win 0x3ae260;
    void setupComments();
    void setupCommentsBrowser(cocos2d::CCArray*) = win 0x3aef40;
    void showNoAccountError() = win 0x3ade80;
    TodoReturn toggleMainPageVisibility(bool);
    void toggleShip(cocos2d::CCObject* sender) = win 0x3abe30, imac 0x7a66b0;
    TodoReturn updateLevelsLabel();
    void updatePageArrows() = win 0x3af2e0;

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void show();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x3ad840, imac 0x7a8fb0;
    virtual void updateUserScoreFinished() = win 0x3adfc0;
    virtual void updateUserScoreFailed();
    virtual void getUserInfoFinished(GJUserScore*) = win 0x3ae960, imac 0x7a9a80;
    virtual void getUserInfoFailed(int) = win 0x3aea50;
    virtual void userInfoChanged(GJUserScore*) = win 0x3aeaa0, imac 0x7a9f30;
    virtual void loadCommentsFinished(cocos2d::CCArray*, char const*) = win 0x3af090;
    virtual void loadCommentsFailed(char const*) = win 0x3af110;
    virtual void setupPageInfo(gd::string, char const*) = win 0x3af170;
    virtual void commentUploadFinished(int);
    virtual void commentUploadFailed(int, CommentError) = win 0x3af3c0;
    virtual void commentDeleteFailed(int, int) = win 0x3af4e0, imac 0x7aa9d0;
    virtual void onClosePopup(UploadActionPopup*) = win 0x3adb30;
    virtual void uploadActionFinished(int, int) = win 0x3adb80;
    virtual void uploadActionFailed(int, int) = win 0x3add40;

    GJUserScore* m_score;
    int m_accountID;
    bool m_ownProfile;
    gd::string m_profileKey;
    cocos2d::CCLabelBMFont* m_somethingWentWrong;
    cocos2d::CCLabelBMFont* m_usernameLabel;
    GJCommentListLayer* m_list;
    CCMenuItemSpriteExtra* m_rightArrow;
    CCMenuItemSpriteExtra* m_leftArrow;
    CCMenuItemSpriteExtra* m_followBtn;
    void* m_unk;
    cocos2d::CCArray* m_buttons;
    cocos2d::CCArray* m_arrayWithUsernameLabel;
    int m_itemCount;
    int m_pageStartIdx;
    int m_pageEndIdx;
    int m_page;
    LoadingCircle* m_circle;
    void* m_popupDelegate;
    CCMenuItemSpriteExtra* m_refreshBtn;
}

[[link(android)]]
class PromoInterstitial : FLAlertLayer {
    // virtual ~PromoInterstitial();

    static PromoInterstitial* create(bool);

    bool init(bool);
    void onClick(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    TodoReturn setup();

    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void keyBackClicked();
    virtual void show();
}

[[link(android)]]
class PulseEffectAction {
    bool isFinished();
    TodoReturn step(float);
    TodoReturn valueForDelta(float, float, float, float);

    PAD = win 0x48;
}

[[link(android)]]
class PurchaseItemPopup : FLAlertLayer {
    // virtual ~PurchaseItemPopup();
    // PurchaseItemPopup();

    static PurchaseItemPopup* create(GJStoreItem*);

    bool init(GJStoreItem*) = win 0x2a74a0;
    void onClose(cocos2d::CCObject* sender);
    void onPurchase(cocos2d::CCObject* sender);

    virtual void keyBackClicked();

    GJStoreItem* m_storeItem;
    GJPurchaseDelegate* m_delegate;
}

[[link(android)]]
class RandTriggerGameObject : ChanceTriggerGameObject {
    // virtual ~RandTriggerGameObject();

    static RandTriggerGameObject* create();

    int getRandomGroupID();
    int getTotalChance();

    virtual bool init();
    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = imac 0x1b16e0;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = imac 0x1b1940;
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class RateDemonLayer : FLAlertLayer, UploadPopupDelegate, UploadActionDelegate {
    // virtual ~RateDemonLayer();
    RateDemonLayer() {
    	m_uploadFinished = false;
    	m_submitButton = nullptr;
    	m_demons = nullptr;
    	m_unkPtr = nullptr;
    	m_levelID = 0;
    	m_demonRate = 0;
    	m_moderator = false;
    	m_popup = nullptr;
    	m_delegate = nullptr;
    }

    static RateDemonLayer* create(int levelID) {
    	auto ret = new RateDemonLayer();
    	if (ret->init(levelID)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(int);
    void onClose(cocos2d::CCObject* sender);
    void onRate(cocos2d::CCObject* sender) = win 0x3b1d00, imac 0x271cb0;
    void selectRating(cocos2d::CCObject*) = win 0x3b1b80;

    virtual void keyBackClicked();
    virtual void uploadActionFinished(int, int) = win 0x3b1ea0, imac 0x271de0;
    virtual void uploadActionFailed(int, int) = win 0x3b1f30, imac 0x271ed0;
    virtual void onClosePopup(UploadActionPopup*);

    bool m_uploadFinished;
    CCMenuItemSpriteExtra* m_submitButton;
    cocos2d::CCArray* m_demons;
    void* m_unkPtr;
    int m_levelID;
    int m_demonRate;
    bool m_moderator;
    UploadActionPopup* m_popup;
    RateLevelDelegate* m_delegate;
}

[[link(android)]]
class RateLevelDelegate {
    virtual void rateLevelClosed() {}
}

[[link(android)]]
class RateLevelLayer : FLAlertLayer {
    // virtual ~RateLevelLayer();
    	RateLevelLayer() {
    	m_submitButton = nullptr;
    	m_difficulties = nullptr;
    	m_levelID = 0;
    	m_levelRate = 0;
    	m_delegate = nullptr;
    }

    static RateLevelLayer* create(int levelID) {
    	auto ret = new RateLevelLayer();
    	if (ret->init(levelID)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(int);
    void onClose(cocos2d::CCObject* sender);
    void onRate(cocos2d::CCObject* sender) = win 0x3b2840, imac 0x550ce0;
    void selectRating(cocos2d::CCObject* sender) = win 0x3b26f0, imac 0x550bb0;

    virtual void keyBackClicked();

    CCMenuItemSpriteExtra* m_submitButton;
    cocos2d::CCArray* m_difficulties;
    int m_levelID;
    int m_levelRate;
    RateLevelDelegate* m_delegate;
}

[[link(android)]]
class RateStarsLayer : FLAlertLayer, UploadPopupDelegate, UploadActionDelegate {
    // virtual ~RateStarsLayer();
    RateStarsLayer();

    static RateStarsLayer* create(int, bool, bool) = win 0x3b2a60, imac 0x279060;

    CCMenuItemSpriteExtra* getStarsButton(int, cocos2d::SEL_MenuHandler, cocos2d::CCMenu*, float) = win 0x3b3290;
    bool init(int, bool, bool) = win 0x3b2bb0;
    void onClose(cocos2d::CCObject* sender);
    void onFeature(cocos2d::CCObject* sender) = win 0x3b3260, imac 0x279e90;
    void onRate(cocos2d::CCObject* sender) = win 0x3b35c0, imac 0x279f10;
    void onToggleCoins(cocos2d::CCObject* sender);
    void selectRating(cocos2d::CCObject*) = win 0x3b33d0;

    virtual void keyBackClicked();
    virtual void uploadActionFinished(int, int) = win 0x3b37b0, imac 0x27a050;
    virtual void uploadActionFailed(int, int) = win 0x3b3830, imac 0x27a140;
    virtual void onClosePopup(UploadActionPopup*);

    bool m_uploadFinished;
    bool m_moderator;
    CCMenuItemSpriteExtra* m_submitButton;
    cocos2d::CCArray* m_buttons;
    int m_levelID;
    int m_starsRate;
    bool m_coinsToggled;
    cocos2d::CCSprite* m_coinSprite;
    UploadActionPopup* m_popup;
    GJDifficultySprite* m_difficultySprite;
    int m_featureState;
    RateLevelDelegate* m_delegate;
}

[[link(android)]]
class RetryLevelLayer : GJDropDownLayer, RewardedVideoDelegate {
    // virtual ~RetryLevelLayer();

    static RetryLevelLayer* create() = win 0x3957e0;

    const char* getEndText();
    void onEveryplay(cocos2d::CCObject* sender);
    void onMenu(cocos2d::CCObject* sender) = win 0x3b4940;
    void onReplay(cocos2d::CCObject* sender);
    void onRewardedVideo(cocos2d::CCObject* sender);
    TodoReturn setupLastProgress() = win 0x3b4280;

    virtual void keyBackClicked() = win 0x3b4a60, imac 0x4e5830;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x3b48f0, imac 0x4e5760;
    virtual void customSetup() = win 0x3b3b20;
    virtual void showLayer(bool);
    virtual void enterAnimFinished();
    virtual void rewardedVideoFinished();
    virtual bool shouldOffsetRewardCurrency();
    virtual void keyUp(cocos2d::enumKeyCodes) {}
}

[[link(android)]]
class RewardedVideoDelegate {
    virtual void rewardedVideoFinished();
    virtual bool shouldOffsetRewardCurrency();
}

[[link(android)]]
class RewardsPage : FLAlertLayer, FLAlertLayerProtocol, GJRewardDelegate {
    // virtual ~RewardsPage();
    	RewardsPage() {
    	m_leftLabel = nullptr;
    	m_rightLabel = nullptr;
    	m_leftChest = nullptr;
    	m_rightChest = nullptr;
    	m_leftOpen = false;
    	m_rightOpen = false;
    	m_openLayer = nullptr;
    }

    static RewardsPage* create() {
    	auto ret = new RewardsPage();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    static char const* getRewardFrame(int type, int state) {
    	return cocos2d::CCString::createWithFormat("chest_%02d_%02d_001.png", type, state)->getCString();
    }
    void onClose(cocos2d::CCObject* sender);
    void onFreeStuff(cocos2d::CCObject* sender);
    void onReward(cocos2d::CCObject* sender) = win 0x3b5e00, imac 0x208dd0;
    void tryGetRewards();
    void unlockLayerClosed(RewardUnlockLayer* layer) {
    	if (m_openLayer == layer) m_openLayer = nullptr;
    }
    callback void updateTimers(float);

    virtual bool init() = win 0x3b4f40;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void show();
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) {}
    virtual void rewardsStatusFinished(int) = win 0x3b5f40, imac 0x209370;
    virtual void rewardsStatusFailed();

    cocos2d::CCLabelBMFont* m_leftLabel;
    cocos2d::CCLabelBMFont* m_rightLabel;
    CCMenuItemSpriteExtra* m_leftChest;
    CCMenuItemSpriteExtra* m_rightChest;
    bool m_leftOpen;
    bool m_rightOpen;
    RewardUnlockLayer* m_openLayer;
}

[[link(android)]]
class RewardUnlockLayer : FLAlertLayer, CurrencyRewardDelegate {
    // virtual ~RewardUnlockLayer();

    static RewardUnlockLayer* create(int, RewardsPage*) = win 0x3b6770, imac 0x209200;

    void connectionTimeout() = win 0x3b7670, imac 0x20ad30;
    bool init(int, RewardsPage*);
    void labelEnterFinishedO(cocos2d::CCObject*) {}
    void onClose(cocos2d::CCObject* sender) = win 0x3ba040, imac 0x20acd0;
    void playDropSound() = win 0x3b76d0;
    void playLabelEffect(int, int, cocos2d::CCSprite*, cocos2d::CCPoint, float) = imac 0x20cec0;
    void playRewardEffect();
    bool readyToCollect(GJRewardItem* item) {
    	return item ? m_chestType == (int)item->m_rewardType : false;
    }
    void showCloseButton() = imac 0x20d590;
    bool showCollectReward(GJRewardItem*) = win 0x3b75b0, imac 0x209530;
    void step2() = win 0x3b7770;
    void step3() = win 0x3b7870, imac 0x20cea0;

    virtual void keyBackClicked() {}
    virtual void currencyWillExit(CurrencyRewardLayer*) = win 0x3ba030;

    cocos2d::CCArray* m_backgroundObjects;
    RewardsPage* m_rewardsPage;
    GJChestSprite* m_chestSprite;
    int m_chestType;
    bool m_rewardCollected;
    bool m_animationPlayed;
    GJRewardItem* m_rewardItem;
    cocos2d::CCLabelBMFont* m_wrongLabel;
    CCMenuItemSpriteExtra* m_closeBtn;
    CCMenuItemSpriteExtra* m_rewardBtn;
    float m_unkFloat;
}

[[link(android)]]
class RingObject : EffectGameObject {
    // virtual ~RingObject();

    static RingObject* create(char const*) = win 0x4893f0;

    bool init(char const*);
    TodoReturn spawnCircle();

    virtual void setScale(float);
    virtual void setRotation(float);
    virtual void resetObject();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
    virtual void setRScale(float);
    virtual void triggerActivated(float);
    virtual bool shouldDrawEditorHitbox() = imac 0x1a2e90;
    virtual TodoReturn powerOnObject(int);

    bool m_claimTouch;
    // property 504
    bool m_isSpawnOnly;
}

[[link(android)]]
class RotateGameplayGameObject : EffectGameObject {
    // virtual ~RotateGameplayGameObject();

    static RotateGameplayGameObject* create();

    TodoReturn updateGameplayRotation();

    virtual bool init();
    virtual void updateStartValues();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class ScrollingLayer : cocos2d::CCLayerColor {
    // virtual ~ScrollingLayer();
    // ScrollingLayer() = ios 0x1c396c;

    static ScrollingLayer* create(cocos2d::CCSize, cocos2d::CCPoint, float) = imac 0x33fbc0;

    TodoReturn getViewRect();
    bool init(cocos2d::CCSize, cocos2d::CCPoint, float);
    void setStartOffset(cocos2d::CCPoint) = imac 0x709b50;

    virtual void draw() = imac 0x709970;
    virtual void visit() = imac 0x709a40;
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x70ff0, imac 0x709b90;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x710e0, imac 0x709d30;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
}

[[link(android)]]
class SearchButton : cocos2d::CCSprite {
    // virtual ~SearchButton();

    static SearchButton* create(char const*, char const*, float, char const*) = win 0x2fdaf0, imac 0x613200;

    bool init(char const*, char const*, float, char const*) = win 0x2fdbc0, imac 0x6153c0;

    cocos2d::CCLabelBMFont* m_label;
    cocos2d::CCSprite* m_icon;
}

[[link(android)]]
class SearchSFXPopup : SetTextPopup {
    // virtual ~SearchSFXPopup();

    static SearchSFXPopup* create(gd::string);

    bool init(gd::string);
    void onSearchFolders(cocos2d::CCObject* sender);
}

[[link(android)]]
class SecretLayer : cocos2d::CCLayer, TextInputDelegate, FLAlertLayerProtocol {
    // virtual ~SecretLayer();

    static SecretLayer* create();

    TodoReturn getBasicMessage();
    TodoReturn getMessage();
    TodoReturn getThreadMessage();
    TodoReturn nodeWithTag(int);
    void onBack(cocos2d::CCObject* sender) = win 0x3ca910;
    void onSubmit(cocos2d::CCObject* sender) = win 0x3c6840;
    TodoReturn playCoinEffect();
    static cocos2d::CCScene* scene();
    TodoReturn selectAThread();
    TodoReturn updateMessageLabel(gd::string);
    void updateSearchLabel(char const*);

    virtual bool init() = win 0x3c5500;
    virtual void keyBackClicked();
    virtual void textInputOpened(CCTextInputNode*);
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*);
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) {}
}

[[link(android)]]
class SecretLayer2 : cocos2d::CCLayer, TextInputDelegate, FLAlertLayerProtocol, DialogDelegate {
    // virtual ~SecretLayer2();

    static SecretLayer2* create();

    gd::string getBasicMessage() = win 0x3d0680;
    gd::string getErrorMessage() = win 0x3d11e0;
    gd::string getMessage();
    gd::string getThreadMessage() = win 0x3cff90;
    TodoReturn nodeWithTag(int);
    void onBack(cocos2d::CCObject* sender);
    void onDoor(cocos2d::CCObject* sender) = win 0x3cd3a0;
    void onSecretLevel(cocos2d::CCObject* sender) = win 0x3cd0f0;
    void onSubmit(cocos2d::CCObject* sender) = win 0x3cdd00;
    void playCoinEffect();
    static cocos2d::CCScene* scene() = win 0x3cabf0;
    void selectAThread();
    void showCompletedLevel() = win 0x3cc3a0;
    void showSecretLevel() = win 0x3cc230;
    void updateMessageLabel(gd::string);
    void updateSearchLabel(char const*);

    virtual bool init() = win 0x3cad70;
    virtual void onExit();
    virtual void keyBackClicked();
    virtual void textInputOpened(CCTextInputNode*);
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*);
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) {}
    virtual void dialogClosed(DialogLayer*) = win 0x3cd050;
}

[[link(android)]]
class SecretLayer3 : cocos2d::CCLayer, DialogDelegate {
    // virtual ~SecretLayer3();
    	SecretLayer3() {
    	m_lockInput = false;
    	m_locksArray = nullptr;
    	m_demonEyes = nullptr;
    	m_demonBody = nullptr;
    	m_secretChest = nullptr;
    }

    static SecretLayer3* create() {
    	auto ret = new SecretLayer3();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    TodoReturn animateEyes();
    TodoReturn firstInteractionStep1();
    TodoReturn firstInteractionStep2();
    TodoReturn firstInteractionStep3();
    TodoReturn firstInteractionStep4();
    void onBack(cocos2d::CCObject* sender);
    void onChest01(cocos2d::CCObject* sender);
    void onChest02(cocos2d::CCObject* sender);
    void onClick(cocos2d::CCObject* sender) = win 0x3d4e90;
    TodoReturn revealStep1();
    TodoReturn revealStep2();
    TodoReturn revealStep3();
    TodoReturn revealStep4();
    TodoReturn revealStep5();
    static cocos2d::CCScene* scene();
    void showUnlockDialog();

    virtual bool init() = win 0x3d2920, imac 0x48f9d0;
    virtual void onExit();
    virtual void keyBackClicked();
    virtual void dialogClosed(DialogLayer*) = win 0x3d7c20, imac 0x494510;

    DungeonBarsSprite* m_dungeonBars;
    bool m_lockInput;
    cocos2d::CCArray* m_locksArray;
    cocos2d::CCSprite* m_demonEyes;
    cocos2d::CCSprite* m_demonBody;
    CCMenuItemSpriteExtra* m_secretChest;
}

[[link(android)]]
class SecretLayer4 : cocos2d::CCLayer, TextInputDelegate, FLAlertLayerProtocol, DialogDelegate {
    // virtual ~SecretLayer4();

    static SecretLayer4* create();

    TodoReturn getBasicMessage();
    TodoReturn getErrorMessage();
    TodoReturn getMessage();
    TodoReturn getThreadMessage();
    TodoReturn nodeWithTag(int);
    void onBack(cocos2d::CCObject* sender);
    void onChest01(cocos2d::CCObject* sender);
    void onSubmit(cocos2d::CCObject* sender);
    TodoReturn playCoinEffect();
    static cocos2d::CCScene* scene();
    TodoReturn selectAThread();
    void showDialog(int);
    void showFirstDialog();
    TodoReturn updateMessageLabel(gd::string);
    void updateSearchLabel(char const*);

    virtual bool init() = win 0x3d85b0;
    virtual void onExit();
    virtual void keyBackClicked();
    virtual void textInputOpened(CCTextInputNode*);
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*);
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) {}
    virtual void dialogClosed(DialogLayer*) {}
}

[[link(android)]]
class SecretNumberLayer : cocos2d::CCLayer {
    // virtual ~SecretNumberLayer();

    static SecretNumberLayer* create();

    TodoReturn playNumberEffect(int);

    virtual bool init();
}

[[link(android)]]
class SecretRewardsLayer : cocos2d::CCLayer, DialogDelegate, BoomScrollLayerDelegate {
    // virtual ~SecretRewardsLayer();
    SecretRewardsLayer() {
    	m_mainLayer = nullptr;
    	m_secondaryLayer = nullptr;
    	m_chestCounter = nullptr;
    	m_chestCounters = nullptr;
    	m_backSprite = nullptr;
    	m_unkSize4_2 = 0;
    	m_secondaryScrollLayer = nullptr;
    	m_scratchDialogIndex = 0;
    	m_potborDialogIndex = 0;
    	m_diamondDialogIndex = 0;
    	m_mechanicDialogIndex = 0;
    	m_inMainLayer = false;
    	m_rewardType = GJRewardType::Unknown;
    	m_lockedDialogIndex = 0;
    }

    static SecretRewardsLayer* create(bool fromShop) {
    	auto ret = new SecretRewardsLayer();
    	if (ret->init(fromShop)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static cocos2d::CCScene* scene(bool fromShop) = win 0x3bafc0;

    void createSecondaryLayer(int) = win 0x3bdd70;
    cocos2d::CCArray* generateChestItems(int) = win 0x3be1c0;
    cocos2d::ccColor3B getPageColor(int page) {
    	if (page == 1) return cocos2d::ccc3(50, 50, 50);
    	else if (page == 2) return cocos2d::ccc3(70, 0, 120);
    	else return cocos2d::ccc3(70, 0, 75);
    }
    void goToPage(int page) {
    	if (m_inMainLayer) m_mainScrollLayer->moveToPage(page);
    	else m_secondaryScrollLayer->moveToPage(page);
    }
    bool init(bool) = win 0x3bb120;
    void moveToMainLayer(cocos2d::CCObject*);
    void moveToSecondaryLayer(int);
    void onBack(cocos2d::CCObject* sender) = win 0x3c06b0;
    void onChestType(cocos2d::CCObject* sender) = win 0x3bdae0, imac 0x61aba0;
    void onSelectItem(cocos2d::CCObject* sender);
    void onShop(cocos2d::CCObject* sender) = win 0x3bf160, imac 0x61b270;
    void onSpecialItem(cocos2d::CCObject* sender);
    void onSwitchPage(cocos2d::CCObject* sender) = win 0x3bd770;
    void showDialog01() = win 0x3c08e0, imac 0x61d750;
    void showDialog03() = imac 0x61f470;
    void showDialogDiamond();
    void showDialogMechanic() = win 0x3c34f0, imac 0x620a20;
    void showLockedChest();
    void showShop(int shop) {
    	if (cocos2d::CCDirector::sharedDirector()->replaceScene(cocos2d::CCTransitionMoveInT::create(0.5f, GJShopLayer::scene((ShopType)shop)))) this->setKeypadEnabled(false);
    }
    void switchToOpenedState(CCMenuItemSpriteExtra*) = win 0x3bf980, imac 0x61abe0;
    void updateBackButton() = win 0x3bdc30;
    void updateUnlockedLabel();

    virtual void onExit();
    virtual void keyBackClicked();
    virtual void dialogClosed(DialogLayer*) = win 0x3bf370, imac 0x622d70;
    virtual void scrollLayerMoved(cocos2d::CCPoint) = win 0x3bd890;

    cocos2d::CCLayer* m_mainLayer;
    cocos2d::CCLayer* m_secondaryLayer;
    cocos2d::CCLabelBMFont* m_chestLabel;
    cocos2d::CCLabelBMFont* m_chestCounter;
    cocos2d::CCDictionary* m_chestCounters;
    cocos2d::CCLabelBMFont* m_keysLabel;
    void* m_unknown;
    CCMenuItemSpriteExtra* m_leftButton;
    CCMenuItemSpriteExtra* m_rightButton;
    cocos2d::CCSprite* m_backSprite;
    int m_unkSize4_1;
    int m_unkSize4_2;
    BoomScrollLayer* m_mainScrollLayer;
    BoomScrollLayer* m_secondaryScrollLayer;
    cocos2d::CCSprite* m_backgroundSprite;
    int m_scratchDialogIndex;
    int m_potborDialogIndex;
    int m_diamondDialogIndex;
    int m_mechanicDialogIndex;
    bool m_inMainLayer;
    GJRewardType m_rewardType;
    int m_lockedDialogIndex;
}

[[link(android)]]
class SelectArtDelegate {
    virtual void selectArtClosed(SelectArtLayer*);
}

[[link(android)]]
class SelectArtLayer : FLAlertLayer {
    // virtual ~SelectArtLayer();

    static SelectArtLayer* create(SelectArtType, int) = win 0x30d420, imac 0x25cad0;

    bool init(SelectArtType, int) = win 0x30d530;
    void onClose(cocos2d::CCObject* sender);
    void onSelectCustom(cocos2d::CCObject* sender) = win 0x30e240, imac 0x25de50;
    void selectArt(cocos2d::CCObject* sender) = win 0x30e180, imac 0x25dd30;
    void updateSelectedCustom(int idx) {
    	if (m_lineSprites) {
    		m_line = idx;
    		this->onSelectCustom(nullptr);
    	}
    }

    virtual void keyBackClicked();

    cocos2d::CCArray* m_artSprites;
    cocos2d::CCArray* m_lineSprites;
    int m_art;
    int m_line;
    SelectArtType m_type;
    SelectArtDelegate* m_delegate;
}

[[link(android)]]
class SelectEventLayer : SetupTriggerPopup {
    // virtual ~SelectEventLayer();

    static SelectEventLayer* create(SetupEventLinkPopup*, gd::set<int>&);

    TodoReturn addToggle(int, gd::string);
    bool init(SetupEventLinkPopup*, gd::set<int>&);
    TodoReturn nextPosition();
    void onInfo(cocos2d::CCObject* sender);

    virtual void keyBackClicked();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x562730;
}

[[link(android)]]
class SelectFontLayer : FLAlertLayer {
    // virtual ~SelectFontLayer();
    SelectFontLayer() {
    	m_font = -1;
    	m_editorLayer = nullptr;
    	m_fontLabel = nullptr;
    }

    static SelectFontLayer* create(LevelEditorLayer* editorLayer) {
    	auto ret = new SelectFontLayer();
    	if (ret->init(editorLayer)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(LevelEditorLayer*) = win 0x286ac0, imac 0x287820;
    void onChangeFont(cocos2d::CCObject* sender) = win 0x2872e0, imac 0x287e30;
    void onClose(cocos2d::CCObject* sender);
    void updateFontLabel() = win 0x2870e0, imac 0x287ed0;

    virtual void keyBackClicked();

    int m_font;
    LevelEditorLayer* m_editorLayer;
    cocos2d::CCLabelBMFont* m_fontLabel;
}

[[link(android)]]
class SelectListIconDelegate {
    virtual void iconSelectClosed(SelectListIconLayer*) {}
}

[[link(android)]]
class SelectListIconLayer : FLAlertLayer {
    // virtual ~SelectListIconLayer();
    SelectListIconLayer() {}

    static SelectListIconLayer* create(int difficulty) {
    	auto ret = new SelectListIconLayer();
    	if (ret->init(difficulty)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(int) = win 0x2f45b0;
    void onClose(cocos2d::CCObject* sender);
    void onSelect(cocos2d::CCObject* sender) = win 0x2f4da0;

    virtual void keyBackClicked();

    cocos2d::CCArray* m_difficulties;
    int m_currentDifficulty;
    SelectListIconDelegate* m_delegate;
}

[[link(android)]]
class SelectPremadeDelegate {
    virtual void selectPremadeClosed(SelectPremadeLayer*, int);
}

[[link(android)]]
class SelectPremadeLayer : FLAlertLayer {
    // virtual ~SelectPremadeLayer();

    static SelectPremadeLayer* create();

    void onClose(cocos2d::CCObject* sender);
    void onSelectPremade(cocos2d::CCObject* sender);

    virtual bool init() = imac 0x2f5800;
    virtual void keyBackClicked();
}

[[link(android)]]
class SelectSettingDelegate {
    virtual void selectSettingClosed(SelectSettingLayer*);
}

[[link(android)]]
class SelectSettingLayer : FLAlertLayer {
    // virtual ~SelectSettingLayer();

    static SelectSettingLayer* create(SelectSettingType, int) = win 0x30e3a0, imac 0x25c2f0;

    static gd::string frameForItem(SelectSettingType, int) = win 0x30ec00, imac 0x25e8d0;
    static gd::string frameForValue(SelectSettingType type, int value) {
    	return frameForItem(type, valueToIdx(type, value));
    }
    gd::string getSelectedFrame() {
    	return frameForValue(m_type, m_settingID);
    }
    int getSelectedValue() {
    	return idxToValue(m_type, m_settingID);
    }
    static int idxToValue(SelectSettingType type, int idx) {
    	if (type != SelectSettingType::StartingSpeed) return idx;

    	switch (idx) {
    		case 0: return 1;
    		case 1: return 0;
    		case 2: case 3: case 4: return idx;
    		default: return 0;
    	}
    }
    bool init(SelectSettingType, int) = win 0x30e4b0, imac 0x486510;
    void onClose(cocos2d::CCObject* sender);
    void onSelect(cocos2d::CCObject* sender) = win 0x30f0a0, imac 0x25eab0;
    static int valueToIdx(SelectSettingType type, int value) {
    	if (type != SelectSettingType::StartingSpeed) return value;

    	switch (value) {
    		case 0: return 1;
    		case 1: return 0;
    		case 2: case 3: case 4: return value;
    		default: return 1;
    	}
    }

    virtual void keyBackClicked();

    cocos2d::CCArray* m_settingSprites;
    int m_settingID;
    SelectSettingType m_type;
    SelectSettingDelegate* m_delegate;
}

[[link(android)]]
class SelectSFXSortDelegate {
    virtual void sortSelectClosed(SelectSFXSortLayer*);
}

[[link(android)]]
class SelectSFXSortLayer : FLAlertLayer {
    // virtual ~SelectSFXSortLayer();
    	SelectSFXSortLayer() {
    	m_sortType = AudioSortType::NameAscending;
    	m_delegate = nullptr;
    }

    static SelectSFXSortLayer* create(AudioSortType sortType) {
    	auto ret = new SelectSFXSortLayer();
    	if (ret->init(sortType)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(AudioSortType);
    void onClose(cocos2d::CCObject* sender);
    void onSelect(cocos2d::CCObject* sender) = win 0x469050, imac 0x42cb40;

    virtual void keyBackClicked();

    AudioSortType m_sortType;
    SelectSFXSortDelegate* m_delegate;
}

[[link(android)]]
class SequenceTriggerGameObject : ChanceTriggerGameObject {
    // virtual ~SequenceTriggerGameObject();

    static SequenceTriggerGameObject* create();

    void addCount(int, int);
    void addTarget(int, int);
    void deleteTarget(int);
    int reorderTarget(int, bool);
    TodoReturn updateSequenceTotalCount();

    virtual bool init();
    virtual void resetObject();
    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = imac 0x1b2cb0;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class SetColorIDPopup : SetIDPopup, GJSpecialColorSelectDelegate {
    // virtual ~SetColorIDPopup();

    static SetColorIDPopup* create(int);

    bool init(int);
    void onSelectSpecialColor(cocos2d::CCObject* sender);

    virtual void colorSelectClosed(GJSpecialColorSelect*, int) = win 0x294bd0, imac 0x2991c0;
}

[[link(android)]]
class SetFolderPopup : SetIDPopup, SetTextPopupDelegate {
    // virtual ~SetFolderPopup();

    static SetFolderPopup* create(int value, bool isCreated, gd::string title) = win 0x294d70;

    bool init(int value, bool isCreated, gd::string title) = win 0x294eb0;
    void onSetFolderName(cocos2d::CCObject* sender) = win 0x295270, imac 0x29a0e0;

    virtual void valueChanged() = win 0x295130;
    virtual void setTextPopupClosed(SetTextPopup*, gd::string) = win 0x295470;

    bool m_isCreated;
    cocos2d::CCLabelBMFont* m_titleLabel;
}

[[link(android)]]
class SetGroupIDLayer : FLAlertLayer, TextInputDelegate {
    // virtual ~SetGroupIDLayer();
    //SetGroupIDLayer() = ios 0x48054;

    static SetGroupIDLayer* create(GameObject*, cocos2d::CCArray*) = imac 0x2fdc60;

    TodoReturn addGroupID(int);
    void callRemoveFromGroup(float);
    TodoReturn createTextInput(cocos2d::CCPoint, int, int, gd::string, float, int);
    TodoReturn determineStartValues();
    bool init(GameObject* obj, cocos2d::CCArray* objs) = win 0x3e10e0, imac 0x2fde30;
    void onAddGroup(cocos2d::CCObject* sender) = win 0x3e5130;
    void onAddGroupParent(cocos2d::CCObject* sender) = win 0x3e52a0;
    void onAnim(cocos2d::CCObject* sender);
    void onArrow(int tag, int increment) = win 0x3e3860;
    void onArrowLeft(cocos2d::CCObject* sender) = win 0x3e3800;
    void onArrowRight(cocos2d::CCObject* sender) = win 0x3e3830;
    void onClose(cocos2d::CCObject* sender) = win 0x3e5de0;
    void onCopy(cocos2d::CCObject* sender);
    void onExtra(cocos2d::CCObject* sender) = win 0x3e3f50;
    void onExtra2(cocos2d::CCObject* sender);
    void onNextFreeEditorLayer1(cocos2d::CCObject* sender);
    void onNextFreeEditorLayer2(cocos2d::CCObject* sender);
    void onNextFreeOrderChannel(cocos2d::CCObject* sender);
    void onNextGroupID1(cocos2d::CCObject* sender);
    void onPaste(cocos2d::CCObject* sender);
    void onRemoveFromGroup(cocos2d::CCObject* sender);
    void onSmoothEase(cocos2d::CCObject* sender);
    void onToggleGuide(cocos2d::CCObject* sender);
    void onToggleSelectedOrder(cocos2d::CCObject* sender);
    void onZLayer(cocos2d::CCObject* sender);
    void onZLayerShift(cocos2d::CCObject* sender);
    TodoReturn removeGroupID(int);
    void updateEditorLabel();
    void updateEditorLabel2();
    void updateEditorLayerID();
    void updateEditorLayerID2();
    void updateEditorOrder();
    void updateEditorOrderLabel();
    TodoReturn updateGroupIDButtons();
    void updateGroupIDLabel();
    void updateOrderChannel();
    void updateOrderChannelLabel();
    TodoReturn updateZLayerButtons();
    void updateZOrder() = win 0x3e5710;
    void updateZOrderLabel() = win 0x3e58c0;

    virtual void keyBackClicked() = win 0x3e6160;
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x3e4280, imac 0x302720;

    GameObject* m_targetObject;
    cocos2d::CCArray* m_targetObjects;
    cocos2d::CCArray* m_array0;
    cocos2d::CCArray* m_groupIDObjects;
    CCTextInputNode* m_editorLayerInput;
    CCTextInputNode* m_editorLayer2Input;
    CCTextInputNode* m_zOrderInput;
    CCTextInputNode* m_groupIDInput;
    CCTextInputNode* m_orderInput;
    CCTextInputNode* m_channelInput;
    bool m_showChannelOrder;
    int m_channelValue;
    bool m_channelUpdated;
    int m_groupIDValue;
    int m_editorLayerValue;
    int m_editorLayer2Value;
    int m_zOrderValue;
    ZLayer m_zLayerValue;
    int m_orderValue;
    bool m_channelOrderEdited;
    bool m_editorLayerEdited;
    bool m_removeGroupsLock;
    int m_groupToRemove;
    bool m_addedGroup;
    bool m_unkBool0;
    bool m_hasTargetObjects;
}

[[link(android)]]
class SetIDPopup : FLAlertLayer, TextInputDelegate {
    // virtual ~SetIDPopup();
    // SetIDPopup();

    static SetIDPopup* create(int current, int begin, int end, gd::string title, gd::string button, bool, int, float, bool, bool) = win 0x293a90;

    bool init(int current, int begin, int end, gd::string title, gd::string button, bool, int, float, bool, bool) = win 0x293bc0, imac 0x297ba0;
    void onCancel(cocos2d::CCObject* sender) = win 0x294830, imac 0x298530;
    void onClose(cocos2d::CCObject* sender) = win 0x2948d0;
    void onItemIDArrow(cocos2d::CCObject* sender) = win 0x294580, imac 0x2984e0;
    void onResetValue(cocos2d::CCObject* sender) = win 0x2945d0, imac 0x2984c0;
    void updateTextInputLabel() = win 0x2946f0, imac 0x2985d0;

    virtual void keyBackClicked();
    virtual void show();
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x2945f0, imac 0x298750;
    virtual void valueChanged() {}

    CCTextInputNode* m_inputNode;
    int m_value;
    bool m_unkBool;
    bool m_cancelled;
    int m_minimum;
    int m_maximum;
    int m_default;
    SetIDPopupDelegate* m_delegate;
}

[[link(android)]]
class SetIDPopupDelegate {
    virtual void setIDPopupClosed(SetIDPopup*, int) {}
}

[[link(android)]]
class SetItemIDLayer : SetupTriggerPopup {
    // virtual ~SetItemIDLayer();

    static SetItemIDLayer* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    TodoReturn updateEditorLabel();

    virtual void onClose(cocos2d::CCObject* sender) = win 0x3e9d50;
    virtual void valueDidChange(int, float) = win 0x3e9c60, imac 0x9c000;
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = win 0x3e9ac0, imac 0x9bee0;
}

[[link(android)]]
class SetLevelOrderPopup : SetIDPopup {
    // virtual ~SetLevelOrderPopup();

    static SetLevelOrderPopup* create(int, int, int);

    bool init(int, int, int);
    void onOrderButton(cocos2d::CCObject* sender);
}

[[link(android)]]
class SetTargetIDLayer : SetupTriggerPopup {
    // virtual ~SetTargetIDLayer();

    static SetTargetIDLayer* create(EffectGameObject*, cocos2d::CCArray*, gd::string, gd::string, int, int, int);

    bool init(EffectGameObject*, cocos2d::CCArray*, gd::string, gd::string, int, int, int);

    virtual void determineStartValues();
    virtual void valueDidChange(int, float) = imac 0x2a6670;
}

[[link(android)]]
class SetTextPopup : FLAlertLayer, TextInputDelegate {
    // virtual ~SetTextPopup();

    static SetTextPopup* create(gd::string value, gd::string placeholder, int maxLength, gd::string title, gd::string okBtnText, bool showResetBtn, float) = win 0x2956b0;

    bool init(gd::string, gd::string, int, gd::string, gd::string, bool, float) = win 0x295820;
    void onCancel(cocos2d::CCObject* sender) = win 0x296250;
    void onClose(cocos2d::CCObject* sender) = win 0x2962e0;
    void onResetValue(cocos2d::CCObject* sender) = win 0x296100;
    void updateTextInputLabel() {
    	m_disableDelegate = true;
    	m_input->setString(m_value);
    	m_disableDelegate = false;
    }

    virtual void keyBackClicked();
    virtual void show() = win 0x8ba30;
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x296160, imac 0x29b670;

    CCTextInputNode* m_input;
    bool m_disableDelegate;
    gd::string m_value;
    SetTextPopupDelegate* m_delegate;
}

[[link(android)]]
class SetTextPopupDelegate {
    virtual void setTextPopupClosed(SetTextPopup*, gd::string) {}
}

[[link(android)]]
class SetupAdvFollowEditPhysicsPopup : SetupTriggerPopup {
    // virtual ~SetupAdvFollowEditPhysicsPopup();

    static SetupAdvFollowEditPhysicsPopup* create(AdvancedFollowEditObject*, cocos2d::CCArray*);

    bool init(AdvancedFollowEditObject*, cocos2d::CCArray*);

    virtual void valueDidChange(int, float) = imac 0x2f6e70;
}

[[link(android)]]
class SetupAdvFollowPopup : SetupTriggerPopup, SelectPremadeDelegate {
    // virtual ~SetupAdvFollowPopup();

    static SetupAdvFollowPopup* create(AdvancedFollowTriggerObject*, cocos2d::CCArray*);

    bool init(AdvancedFollowTriggerObject*, cocos2d::CCArray*);
    void onMode(cocos2d::CCObject* sender);
    void onPremade(cocos2d::CCObject* sender);
    void updateMode(int);

    virtual void onClose(cocos2d::CCObject* sender);
    virtual void updateDefaultTriggerValues();
    virtual void valueDidChange(int, float) = imac 0x2f4e30;
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x2f50b0;
    virtual void selectPremadeClosed(SelectPremadeLayer*, int) = win 0x3edeb0, imac 0x2f52e0;
}

[[link(android)]]
class SetupAdvFollowRetargetPopup : SetupTriggerPopup {
    // virtual ~SetupAdvFollowRetargetPopup();

    static SetupAdvFollowRetargetPopup* create(AdvancedFollowEditObject*, cocos2d::CCArray*);

    bool init(AdvancedFollowEditObject*, cocos2d::CCArray*);

    virtual void updateDefaultTriggerValues();
    virtual void valueDidChange(int, float) = imac 0x2f7870;
}

[[link(android)]]
class SetupAnimationPopup : SetupTriggerPopup {
    // virtual ~SetupAnimationPopup();

    static SetupAnimationPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onAnimationIDArrow(cocos2d::CCObject* sender);
    void onTargetIDArrow(cocos2d::CCObject* sender);
    TodoReturn updateAnimationID();
    TodoReturn updateAnimationTextInputLabel();
    TodoReturn updateTargetID();
    TodoReturn updateTextInputLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*) = win 0x3f1ee0, imac 0x3c2060;
}

[[link(android)]]
class SetupAnimSettingsPopup : SetupTriggerPopup {
    // virtual ~SetupAnimSettingsPopup();

    static SetupAnimSettingsPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    TodoReturn updateAnimSettings();

    virtual void onClose(cocos2d::CCObject* sender) = imac 0x9aa40;
}

[[link(android)]]
class SetupAreaAnimTriggerPopup : SetupAreaTintTriggerPopup {
    // virtual ~SetupAreaAnimTriggerPopup();

    static SetupAreaAnimTriggerPopup* create(EnterEffectObject*, cocos2d::CCArray*, int);

    TodoReturn createValueControlAdvancedAnim(int, gd::string, cocos2d::CCPoint, float, bool, InputValueType, int, bool, float min, float max, int, int, GJInputStyle);
    bool init(EnterEffectObject*, cocos2d::CCArray*, int);
    void onDeactivateAnimValue(cocos2d::CCObject* sender);
    TodoReturn updateTargetIDLabel();

    virtual void updateDefaultTriggerValues();
    virtual void valueDidChange(int, float) = imac 0x4c82f0;
}

[[link(android)]]
class SetupAreaFadeTriggerPopup : SetupAreaMoveTriggerPopup {
    // virtual ~SetupAreaFadeTriggerPopup();

    static SetupAreaFadeTriggerPopup* create(EnterEffectObject*, cocos2d::CCArray*);

    bool init(EnterEffectObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupAreaMoveTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupAreaMoveTriggerPopup();
    // SetupAreaMoveTriggerPopup();

    static SetupAreaMoveTriggerPopup* create(EnterEffectObject*, cocos2d::CCArray*);

    TodoReturn addAreaDefaultControls(int);
    TodoReturn getModeValues(int, int&, bool&, bool&);
    bool init(EnterEffectObject*, cocos2d::CCArray*);
    void onMode(cocos2d::CCObject* sender);
    void onNextFreeEffectID(cocos2d::CCObject* sender);
    void onSpecialTarget(cocos2d::CCObject* sender);
    TodoReturn updateEnterTargetIDState();

    virtual void updateInputValue(int, float&) = win 0x3f6270;
    virtual void updateDefaultTriggerValues() = win 0x3f5ba0;
    virtual TodoReturn updateInputNode(int, float) = win 0x3f6240;
    virtual void valueDidChange(int, float) = win 0x3f60c0, imac 0x4c0a70;
    virtual TodoReturn triggerValueFromSliderValue(int, float) = win 0x3f61e0;
    virtual TodoReturn triggerSliderValueFromValue(int, float) = win 0x3f6210;
}

[[link(android)]]
class SetupAreaRotateTriggerPopup : SetupAreaMoveTriggerPopup {
    // virtual ~SetupAreaRotateTriggerPopup();

    static SetupAreaRotateTriggerPopup* create(EnterEffectObject*, cocos2d::CCArray*);

    bool init(EnterEffectObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupAreaTintTriggerPopup : SetupAreaMoveTriggerPopup, HSVWidgetDelegate {
    // virtual ~SetupAreaTintTriggerPopup();

    static SetupAreaTintTriggerPopup* create(EnterEffectObject*, cocos2d::CCArray*);

    bool init(EnterEffectObject*, cocos2d::CCArray*);
    void onHSV(cocos2d::CCObject* sender);
    TodoReturn updateHSVButton();

    virtual void determineStartValues() = win 0x3f86c0;
    virtual void onClose(cocos2d::CCObject* sender) = win 0x3f89d0, imac 0x4c4f50;
    virtual void valueDidChange(int, float) = win 0x3f8500, imac 0x4c4b60;
    virtual void hsvPopupClosed(HSVWidgetPopup*, cocos2d::ccHSVValue) = win 0x3f88e0;
}

[[link(android)]]
class SetupAreaTransformTriggerPopup : SetupAreaMoveTriggerPopup {
    // virtual ~SetupAreaTransformTriggerPopup();

    static SetupAreaTransformTriggerPopup* create(EnterEffectObject*, cocos2d::CCArray*);

    bool init(EnterEffectObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupAreaTriggerPopup : SetupAreaMoveTriggerPopup {
    // virtual ~SetupAreaTriggerPopup();

    static SetupAreaTriggerPopup* create(EnterEffectObject*, cocos2d::CCArray*);

    bool init(EnterEffectObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupArtSwitchPopup : SetupTriggerPopup, SelectArtDelegate {
    // virtual ~SetupArtSwitchPopup();

    static SetupArtSwitchPopup* create(ArtTriggerGameObject*, cocos2d::CCArray*, int);

    bool init(ArtTriggerGameObject*, cocos2d::CCArray*, int);
    void onArt(cocos2d::CCObject* sender);

    virtual void selectArtClosed(SelectArtLayer*) = win 0x459d50, imac 0x56e210;
}

[[link(android)]]
class SetupAudioLineGuidePopup : SetupTriggerPopup, SelectSettingDelegate {
    // virtual ~SetupAudioLineGuidePopup();

    static SetupAudioLineGuidePopup* create(AudioLineGuideGameObject*, cocos2d::CCArray*);

    bool init(AudioLineGuideGameObject*, cocos2d::CCArray*);
    void onSpeed(cocos2d::CCObject* sender);

    virtual void selectSettingClosed(SelectSettingLayer*) = win 0x458020, imac 0x56c710;
}

[[link(android)]]
class SetupAudioTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupAudioTriggerPopup();

    TodoReturn addProxVolControls(int);
    TodoReturn addTimeControls(int, float);
    void onProxMode(cocos2d::CCObject* sender);
    TodoReturn updateSpecialGroup();

    virtual void valueDidChange(int, float) = win 0x42e210, imac 0x4a3b70;
}

[[link(android)]]
class SetupBGSpeedTrigger : SetupTriggerPopup {
    // virtual ~SetupBGSpeedTrigger();

    static SetupBGSpeedTrigger* create(EffectGameObject*, cocos2d::CCArray*, int);

    bool init(EffectGameObject*, cocos2d::CCArray*, int);
}

[[link(android)]]
class SetupCameraEdgePopup : SetupTriggerPopup {
    // virtual ~SetupCameraEdgePopup();

    static SetupCameraEdgePopup* create(CameraTriggerGameObject*, cocos2d::CCArray*);

    bool init(CameraTriggerGameObject*, cocos2d::CCArray*);
    void onCameraEdge(cocos2d::CCObject* sender);
    void onTargetIDArrow(cocos2d::CCObject* sender);
    void onUnlockEdge(cocos2d::CCObject* sender);
    TodoReturn updateTargetID();
    TodoReturn updateTextInputLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*);
}

[[link(android)]]
class SetupCameraGuidePopup : SetupTriggerPopup {
    // virtual ~SetupCameraGuidePopup();

    static SetupCameraGuidePopup* create(CameraTriggerGameObject*, cocos2d::CCArray*);

    bool init(CameraTriggerGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupCameraModePopup : SetupTriggerPopup {
    // virtual ~SetupCameraModePopup();

    static SetupCameraModePopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onEditCameraSettings(cocos2d::CCObject* sender);
    void onUnboundMode(cocos2d::CCObject* sender);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn updateCameraEasing();
    TodoReturn updateCameraEasingLabel();
    TodoReturn updateCameraPadding();
    TodoReturn updateCameraPaddingLabel();
    TodoReturn updateItemVisibility();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
}

[[link(android)]]
class SetupCameraOffsetTrigger : SetupTriggerPopup {
    // virtual ~SetupCameraOffsetTrigger();

    static SetupCameraOffsetTrigger* create(CameraTriggerGameObject*, cocos2d::CCArray*);

    bool init(CameraTriggerGameObject*, cocos2d::CCArray*);
    void onEasing(cocos2d::CCObject* sender);
    void onEasingRate(cocos2d::CCObject* sender);
    void onTargetMode(cocos2d::CCObject* sender);
    TodoReturn posFromSliderValue(float);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn sliderValueFromPos(int);
    TodoReturn sliderXChanged(cocos2d::CCObject*);
    TodoReturn sliderYChanged(cocos2d::CCObject*);
    TodoReturn toggleEasingRateVisibility();
    TodoReturn updateDuration();
    TodoReturn updateDurLabel(bool);
    TodoReturn updateEasingLabel();
    TodoReturn updateEasingRateLabel();
    TodoReturn updateMoveCommandEasing();
    TodoReturn updateMoveCommandEasingRate();
    TodoReturn updateMoveCommandPosX();
    TodoReturn updateMoveCommandPosY();
    TodoReturn updateValueXLabel();
    TodoReturn updateValueYLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*) = win 0x3ff570, imac 0x64cc80;
    virtual TodoReturn valuePopupClosed(ConfigureValuePopup*, float) = win 0x3fec70;
}

[[link(android)]]
class SetupCameraRotatePopup : SetupTriggerPopup {
    // virtual ~SetupCameraRotatePopup();

    static SetupCameraRotatePopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onEasing(cocos2d::CCObject* sender);
    void onEasingRate(cocos2d::CCObject* sender);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn sliderDegreesChanged(cocos2d::CCObject*);
    TodoReturn toggleEasingRateVisibility();
    TodoReturn updateCommandDegrees();
    TodoReturn updateDegreesLabel();
    TodoReturn updateDuration();
    TodoReturn updateDurLabel(bool);
    TodoReturn updateEasingLabel();
    TodoReturn updateEasingRateLabel();
    TodoReturn updateMoveCommandEasing();
    TodoReturn updateMoveCommandEasingRate();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*);
    virtual TodoReturn valuePopupClosed(ConfigureValuePopup*, float);
}

[[link(android)]]
class SetupCameraRotatePopup2 : SetupTriggerPopup {
    // virtual ~SetupCameraRotatePopup2();

    static SetupCameraRotatePopup2* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupCheckpointPopup : SetupTriggerPopup {
    // virtual ~SetupCheckpointPopup();

    static SetupCheckpointPopup* create(CheckpointGameObject*, cocos2d::CCArray*);

    bool init(CheckpointGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupCoinLayer : SetupTriggerPopup {
    // virtual ~SetupCoinLayer();

    static SetupCoinLayer* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupCollisionStateTriggerPopup : SetupInstantCollisionTriggerPopup {
    // virtual ~SetupCollisionStateTriggerPopup();

    static SetupCollisionStateTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupCollisionTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupCollisionTriggerPopup();

    static SetupCollisionTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onActivateOnExit(cocos2d::CCObject* sender);
    void onEnableGroup(cocos2d::CCObject* sender);
    void onItemID2Arrow(cocos2d::CCObject* sender);
    void onItemIDArrow(cocos2d::CCObject* sender);
    void onTargetIDArrow(cocos2d::CCObject* sender);
    void onTargetP1(cocos2d::CCObject* sender);
    void onTargetP2(cocos2d::CCObject* sender);
    void onTargetPP(cocos2d::CCObject* sender);
    TodoReturn updateItemID();
    TodoReturn updateItemID2();
    TodoReturn updateItemID2InputLabel();
    TodoReturn updateItemIDInputLabel();
    TodoReturn updateTargetID();
    TodoReturn updateTargetIDInputLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*) = win 0x401940, imac 0x383000;
}

[[link(android)]]
class SetupCountTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupCountTriggerPopup();

    static SetupCountTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onEnableGroup(cocos2d::CCObject* sender);
    void onItemIDArrow(cocos2d::CCObject* sender);
    void onMultiActivate(cocos2d::CCObject* sender);
    void onTargetCountArrow(cocos2d::CCObject* sender);
    void onTargetIDArrow(cocos2d::CCObject* sender);
    TodoReturn updateCountTextInputLabel();
    TodoReturn updateItemID();
    TodoReturn updateItemIDInputLabel();
    TodoReturn updateTargetCount();
    TodoReturn updateTargetID();
    TodoReturn updateTargetIDInputLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*);
}

[[link(android)]]
class SetupDashRingPopup : SetupTriggerPopup {
    // virtual ~SetupDashRingPopup();

    static SetupDashRingPopup* create(DashRingObject*, cocos2d::CCArray*);

    bool init(DashRingObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupEndPopup : SetupTriggerPopup {
    // virtual ~SetupEndPopup();

    static SetupEndPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onLockY(cocos2d::CCObject* sender);
    void onMultiActivate(cocos2d::CCObject* sender);
    void onReversed(cocos2d::CCObject* sender);
    void onTargetIDArrow(cocos2d::CCObject* sender);
    TodoReturn updateTargetID();
    TodoReturn updateTextInputLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*);
}

[[link(android)]]
class SetupEnterEffectPopup : SetupTriggerPopup, HSVWidgetDelegate {
    // virtual ~SetupEnterEffectPopup();

    static SetupEnterEffectPopup* create(EnterEffectObject*, cocos2d::CCArray*, int);

    bool init(EnterEffectObject*, cocos2d::CCArray*, int);
    void onEnterType(cocos2d::CCObject* sender);
    void onHSV(cocos2d::CCObject* sender);
    void onNextFreeEnterChannel(cocos2d::CCObject* sender);
    void onNextFreeEnterEffectID(cocos2d::CCObject* sender);
    TodoReturn updateHSVButton();

    virtual void determineStartValues() = win 0x408400;
    virtual void onClose(cocos2d::CCObject* sender) = win 0x4089e0, imac 0x3e1050;
    virtual void updateInputValue(int, float&);
    virtual TodoReturn updateInputNode(int, float);
    virtual void valueDidChange(int, float) = win 0x4085d0, imac 0x3e0e00;
    virtual TodoReturn triggerValueFromSliderValue(int, float);
    virtual TodoReturn triggerSliderValueFromValue(int, float);
    virtual void hsvPopupClosed(HSVWidgetPopup*, cocos2d::ccHSVValue) = win 0x4088f0;
}

[[link(android)]]
class SetupEnterTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupEnterTriggerPopup();

    static SetupEnterTriggerPopup* create(EnterEffectObject*, cocos2d::CCArray*);

    bool init(EnterEffectObject*, cocos2d::CCArray*);
    void onEnterType(cocos2d::CCObject* sender);

    virtual void determineStartValues();
}

[[link(android)]]
class SetupEventLinkPopup : SetupTriggerPopup {
    // virtual ~SetupEventLinkPopup();

    static SetupEventLinkPopup* create(EventLinkTrigger*, cocos2d::CCArray*);

    bool init(EventLinkTrigger*, cocos2d::CCArray*);
    void onSelectEvent(cocos2d::CCObject* sender);
    TodoReturn updateEventIDs(gd::set<int>&);
}

[[link(android)]]
class SetupForceBlockPopup : SetupTriggerPopup {
    // virtual ~SetupForceBlockPopup();

    static SetupForceBlockPopup* create(ForceBlockGameObject*, cocos2d::CCArray*);

    bool init(ForceBlockGameObject*, cocos2d::CCArray*);

    virtual void valueDidChange(int, float) = imac 0x56d900;
}

[[link(android)]]
class SetupGameplayOffsetPopup : SetupTriggerPopup {
    // virtual ~SetupGameplayOffsetPopup();

    static SetupGameplayOffsetPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onDefaultValues(cocos2d::CCObject* sender);

    virtual void updateInputValue(int, float&) = imac 0x782550;
    virtual TodoReturn updateInputNode(int, float);
    virtual TodoReturn triggerValueFromSliderValue(int, float);
    virtual TodoReturn triggerSliderValueFromValue(int, float);
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender);
}

[[link(android)]]
class SetupGradientPopup : SetupTriggerPopup {
    // virtual ~SetupGradientPopup();

    static SetupGradientPopup* create(GradientTriggerObject*, cocos2d::CCArray*);

    bool init(GradientTriggerObject*, cocos2d::CCArray*);
    void onBlending(cocos2d::CCObject* sender);
    void onZLayer(cocos2d::CCObject* sender);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn updateBlending();
    TodoReturn updateBlendingLabel();
    TodoReturn updateGradientLabels(bool);
    TodoReturn updateZLayerButtons();

    virtual void determineStartValues() = win 0x409cf0;
    virtual void onPlusButton(cocos2d::CCObject* sender) = win 0x409e00, imac 0x5dadb0;
    virtual TodoReturn updateToggleItem(int, bool) = win 0x409e80;
    virtual void valueDidChange(int, float) = win 0x40a290, imac 0x5dafc0;
}

[[link(android)]]
class SetupGravityModPopup : FLAlertLayer, TextInputDelegate {
    // virtual ~SetupGravityModPopup();

    static SetupGravityModPopup* create(EffectGameObject*, cocos2d::CCArray*, bool);

    TodoReturn determineStartValues();
    bool init(EffectGameObject*, cocos2d::CCArray*, bool);
    void onClose(cocos2d::CCObject* sender);
    void onItemIDArrow(cocos2d::CCObject* sender);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn updateItemID();
    TodoReturn updateTextInputLabel();
    TodoReturn updateValue();
    TodoReturn updateValueLabel();

    virtual void keyBackClicked();
    virtual void show();
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = imac 0x3c5d30;
}

[[link(android)]]
class SetupGravityTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupGravityTriggerPopup();

    static SetupGravityTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);

    virtual void valueDidChange(int, float) = imac 0x4b1640;
}

[[link(android)]]
class SetupInstantCollisionTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupInstantCollisionTriggerPopup();

    static SetupInstantCollisionTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    TodoReturn updateSpecialNodes();

    virtual void updateDefaultTriggerValues() = win 0x402a40;
    virtual void valueDidChange(int, float) = win 0x402810, imac 0x383cc0;
}

[[link(android)]]
class SetupInstantCountPopup : SetupTriggerPopup {
    // virtual ~SetupInstantCountPopup();

    static SetupInstantCountPopup* create(CountTriggerGameObject*, cocos2d::CCArray*) = win 0x40a3a0;

    bool init(CountTriggerGameObject*, cocos2d::CCArray*) = win 0x40a4e0;
    void onCountType(cocos2d::CCObject* sender);
    void onEnableGroup(cocos2d::CCObject* sender);
    void onTargetCountArrow(cocos2d::CCObject* sender);
    void onTargetID2Arrow(cocos2d::CCObject* sender);
    void onTargetIDArrow(cocos2d::CCObject* sender) = win 0x404440;
    TodoReturn updateCountTextInputLabel();
    void updateItemID();
    TodoReturn updateItemIDInputLabel();
    TodoReturn updateTargetCount();
    TodoReturn updateTargetID();
    TodoReturn updateTargetIDInputLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*);

    CCTextInputNode* m_unk3a8;
    CCTextInputNode* m_unk3b0;
    CCTextInputNode* m_unk3b8;
    int m_itemID;
    int m_targetID;
    int m_targetCount;
    int m_unk3cc;
    int m_mode;
}

[[link(android)]]
class SetupInteractObjectPopup : SetupTriggerPopup {
    // virtual ~SetupInteractObjectPopup();

    static SetupInteractObjectPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    TodoReturn updateItems();

    virtual void onClose(cocos2d::CCObject* sender);
    virtual void onPlusButton(cocos2d::CCObject* sender);
    virtual void valueDidChange(int, float) = imac 0x4f7ec0;
}

[[link(android)]]
class SetupItemCompareTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupItemCompareTriggerPopup();

    static SetupItemCompareTriggerPopup* create(ItemTriggerGameObject*, cocos2d::CCArray*);

    bool init(ItemTriggerGameObject*, cocos2d::CCArray*);
    void onOpButton(cocos2d::CCObject* sender);
    TodoReturn updateFormulaLabel();
    TodoReturn updateOpButton(CCMenuItemSpriteExtra*, int, int);

    virtual void valueDidChange(int, float) = imac 0x56af40;
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x56ade0;
}

[[link(android)]]
class SetupItemEditTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupItemEditTriggerPopup();

    static SetupItemEditTriggerPopup* create(ItemTriggerGameObject*, cocos2d::CCArray*);

    bool init(ItemTriggerGameObject*, cocos2d::CCArray*) = win 0x452470;
    void onOpButton(cocos2d::CCObject* sender);
    TodoReturn updateFormulaLabel() = win 0x453d30;
    TodoReturn updateOpButton(CCMenuItemSpriteExtra*, int, int);

    virtual void valueDidChange(int, float) = imac 0x568bf0;
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x568a10;
}

[[link(android)]]
class SetupKeyframeAnimPopup : SetupTriggerPopup {
    // virtual ~SetupKeyframeAnimPopup();

    static SetupKeyframeAnimPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupKeyframePopup : SetupTriggerPopup {
    // virtual ~SetupKeyframePopup();

    static SetupKeyframePopup* create(KeyframeGameObject*, cocos2d::CCArray*, LevelEditorLayer*);

    bool init(KeyframeGameObject*, cocos2d::CCArray*, LevelEditorLayer*);
    void onTimeMode(cocos2d::CCObject* sender);
    TodoReturn refreshPreviewArt();
    TodoReturn updateTimeModeButtons();

    virtual void onClose(cocos2d::CCObject* sender) = imac 0x1ef8a0;
    virtual void onCustomButton(cocos2d::CCObject* sender);
    virtual void valueDidChange(int, float) = imac 0x1ef220;
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x1ef450;
}

[[link(android)]]
class SetupMGTrigger : SetupTriggerPopup {
    // virtual ~SetupMGTrigger();

    static SetupMGTrigger* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onEasing(cocos2d::CCObject* sender);
    void onEasingRate(cocos2d::CCObject* sender);
    TodoReturn posFromSliderValue(float);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn sliderValueFromPos(int);
    TodoReturn sliderYChanged(cocos2d::CCObject*);
    TodoReturn toggleEasingRateVisibility();
    TodoReturn updateDuration();
    TodoReturn updateDurLabel(bool);
    TodoReturn updateEasingLabel();
    TodoReturn updateEasingRateLabel();
    TodoReturn updateMoveCommandEasing();
    TodoReturn updateMoveCommandEasingRate();
    TodoReturn updateMoveCommandPosY();
    TodoReturn updateValueYLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*) = win 0x4106b0, imac 0x4f3710;
    virtual TodoReturn valuePopupClosed(ConfigureValuePopup*, float);
}

[[link(android)]]
class SetupMoveCommandPopup : SetupTriggerPopup {
    // virtual ~SetupMoveCommandPopup();

    static SetupMoveCommandPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*) = win 0x278ef0;
    TodoReturn updateControlVisibility();

    virtual void updateInputValue(int, float&) = imac 0x5f0780;
    virtual TodoReturn updateInputNode(int, float);
    virtual void valueDidChange(int, float) = imac 0x5f07c0;
    virtual TodoReturn triggerValueFromSliderValue(int, float);
    virtual TodoReturn triggerSliderValueFromValue(int, float);
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x5f09c0;
}

[[link(android)]]
class SetupObjectControlPopup : SetupTriggerPopup {
    // virtual ~SetupObjectControlPopup();

    static SetupObjectControlPopup* create(ObjectControlGameObject*, cocos2d::CCArray*);

    bool init(ObjectControlGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupObjectOptions2Popup : SetupTriggerPopup {
    // virtual ~SetupObjectOptions2Popup();

    static SetupObjectOptions2Popup* create(GameObject*, cocos2d::CCArray*);

    bool init(GameObject*, cocos2d::CCArray*);

    virtual void onPlusButton(cocos2d::CCObject* sender);
}

[[link(android)]]
class SetupObjectOptionsPopup : FLAlertLayer, TextInputDelegate {
    // virtual ~SetupObjectOptionsPopup();

    static SetupObjectOptionsPopup* create(GameObject*, cocos2d::CCArray*, SetGroupIDLayer*);

    bool init(GameObject*, cocos2d::CCArray*, SetGroupIDLayer*);
    void onAlwaysHide(cocos2d::CCObject* sender);
    void onApplyScaleStick(cocos2d::CCObject* sender);
    void onCenterEffect(cocos2d::CCObject* sender);
    void onDisableGlow(cocos2d::CCObject* sender);
    void onDisableObject(cocos2d::CCObject* sender);
    void onDontBoost(cocos2d::CCObject* sender);
    void onDontBoostX(cocos2d::CCObject* sender);
    void onDontEnter(cocos2d::CCObject* sender);
    void onDontFade(cocos2d::CCObject* sender);
    void onExtendedCollision(cocos2d::CCObject* sender);
    void onExtraSticky(cocos2d::CCObject* sender);
    void onGripSlope(cocos2d::CCObject* sender);
    void onHideEffects(cocos2d::CCObject* sender);
    void onHighDetail(cocos2d::CCObject* sender);
    void onIceBlock(cocos2d::CCObject* sender);
    void onNoAudioScale(cocos2d::CCObject* sender);
    void onNonStickX(cocos2d::CCObject* sender);
    void onNonStickY(cocos2d::CCObject* sender);
    void onNoParticle(cocos2d::CCObject* sender);
    void onPassable(cocos2d::CCObject* sender);
    void onReverse(cocos2d::CCObject* sender);
    void onSinglePlayerTouch(cocos2d::CCObject* sender);
    void onToggleAreaParent(cocos2d::CCObject* sender);
    void onToggleGroupParent(cocos2d::CCObject* sender);

    virtual void keyBackClicked();
    virtual void show();
    virtual void determineStartValues() = win 0x3e7b50, imac 0x305fa0;
    virtual void onClose(cocos2d::CCObject* sender);
}

[[link(android)]]
class SetupObjectTogglePopup : SetupTriggerPopup {
    // virtual ~SetupObjectTogglePopup();

    static SetupObjectTogglePopup* create(EffectGameObject*, cocos2d::CCArray*, bool);

    bool init(EffectGameObject*, cocos2d::CCArray*, bool);

    virtual void onClose(cocos2d::CCObject* sender);
    virtual void valueDidChange(int, float);
}

[[link(android)]]
class SetupOpacityPopup : SetupTriggerPopup {
    // virtual ~SetupOpacityPopup();

    static SetupOpacityPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onTargetIDArrow(cocos2d::CCObject* sender);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn updateDuration();
    TodoReturn updateDurLabel(bool);
    void updateOpacity();
    void updateOpacityLabel();
    TodoReturn updateTargetID();
    TodoReturn updateTextInputLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x4138d0, imac 0x58420;
}

[[link(android)]]
class SetupOptionsTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupOptionsTriggerPopup();

    static SetupOptionsTriggerPopup* create(GameOptionsTrigger*, cocos2d::CCArray*);

    TodoReturn addOption(int, gd::string);
    bool init(GameOptionsTrigger*, cocos2d::CCArray*);

    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = win 0x41e5a0, imac 0x5ce9a0;
}

[[link(android)]]
class SetupPersistentItemTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupPersistentItemTriggerPopup();

    static SetupPersistentItemTriggerPopup* create(ItemTriggerGameObject*, cocos2d::CCArray*);

    bool init(ItemTriggerGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupPickupTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupPickupTriggerPopup();

    static SetupPickupTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*) = win 0x41e670;

    bool init(EffectGameObject*, cocos2d::CCArray*) = win 0x41e780;
    void updateState() = win 0x41eea0;

    virtual void onPlusButton(cocos2d::CCObject* sender) = win 0x40c490;
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = win 0x41ef10, imac 0x591f0;
}

[[link(android)]]
class SetupPlatformerEndPopup : SetupTriggerPopup {
    // virtual ~SetupPlatformerEndPopup();

    static SetupPlatformerEndPopup* create(EndTriggerGameObject*, cocos2d::CCArray*);

    bool init(EndTriggerGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupPlayerControlPopup : SetupTriggerPopup {
    // virtual ~SetupPlayerControlPopup();

    static SetupPlayerControlPopup* create(PlayerControlGameObject*, cocos2d::CCArray*);

    bool init(PlayerControlGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupPortalPopup : FLAlertLayer, TextInputDelegate {
    // virtual ~SetupPortalPopup();

    static SetupPortalPopup* create(EffectGameObject*, cocos2d::CCArray*);

    TodoReturn determineStartValues();
    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onClose(cocos2d::CCObject* sender);
    void onEditCameraSettings(cocos2d::CCObject* sender);
    void onUnboundMode(cocos2d::CCObject* sender);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn updateCameraEasing();
    TodoReturn updateCameraEasingLabel();
    TodoReturn updateCameraPadding();
    TodoReturn updateCameraPaddingLabel();
    TodoReturn updateItemVisibility();

    virtual void keyBackClicked();
}

[[link(android)]]
class SetupPulsePopup : SetupTriggerPopup, cocos2d::extension::ColorPickerDelegate, GJSpecialColorSelectDelegate {
    // virtual ~SetupPulsePopup();

    static SetupPulsePopup* create(EffectGameObject*, cocos2d::CCArray*);

    TodoReturn getColorValue();
    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onCopy(cocos2d::CCObject* sender);
    void onExclusive(cocos2d::CCObject* sender);
    void onGroupMainOnly(cocos2d::CCObject* sender);
    void onGroupSecondaryOnly(cocos2d::CCObject* sender);
    void onHSVLegacyMode(cocos2d::CCObject* sender);
    void onPaste(cocos2d::CCObject* sender);
    void onSelectPulseMode(cocos2d::CCObject* sender);
    void onSelectSpecialColor(cocos2d::CCObject* sender);
    void onSelectSpecialTargetID(cocos2d::CCObject* sender);
    void onSelectTargetMode(cocos2d::CCObject* sender);
    void onUpdateCopyColor(cocos2d::CCObject* sender);
    void onUpdateCustomColor(cocos2d::CCObject* sender);
    TodoReturn selectColor(cocos2d::ccColor3B);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn updateColorLabels();
    TodoReturn updateColorValue();
    TodoReturn updateCopyColor();
    TodoReturn updateCopyColorTextInputLabel();
    TodoReturn updateFadeInLabel(bool);
    TodoReturn updateFadeInTime();
    TodoReturn updateFadeOutLabel(bool);
    TodoReturn updateFadeOutTime();
    TodoReturn updateGroupMainOnly();
    TodoReturn updateGroupSecondaryOnly();
    TodoReturn updateHoldLabel(bool);
    TodoReturn updateHoldTime();
    TodoReturn updateHSVValue();
    TodoReturn updatePulseMode();
    TodoReturn updatePulseTargetType();
    TodoReturn updateTargetID();
    TodoReturn updateTextInputLabel();

    virtual void show();
    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender) = imac 0x39bab0;
    virtual void textChanged(CCTextInputNode*) = win 0x423fd0;
    virtual void colorValueChanged(cocos2d::ccColor3B) = win 0x423d10, imac 0x39bc90;
    virtual void textInputOpened(CCTextInputNode*) {}
    virtual void colorSelectClosed(GJSpecialColorSelect*, int) = win 0x4235a0;
}

[[link(android)]]
class SetupRandAdvTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupRandAdvTriggerPopup();

    static SetupRandAdvTriggerPopup* create(RandTriggerGameObject*, cocos2d::CCArray*);

    void addChance(int, int);
    void addChanceToObject(RandTriggerGameObject*, int, int);
    void callRemoveFromGroup(float);
    bool init(RandTriggerGameObject*, cocos2d::CCArray*);
    void onAddChance(cocos2d::CCObject* sender);
    void onRemoveFromGroup(cocos2d::CCObject* sender);
    void removeGroupID(int);
    void removeGroupIDFromObject(RandTriggerGameObject*, int);
    void updateGroupIDButtons();

    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*) {}
}

[[link(android)]]
class SetupRandTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupRandTriggerPopup();

    static SetupRandTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onTargetID2Arrow(cocos2d::CCObject* sender);
    void onTargetIDArrow(cocos2d::CCObject* sender);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn updateChance();
    TodoReturn updateChanceLabel(bool);
    TodoReturn updateTargetID();
    TodoReturn updateTargetID2();
    TodoReturn updateTextInputLabel();
    TodoReturn updateTextInputLabel2();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*) = win 0x428760, imac 0x5cda20;
}

[[link(android)]]
class SetupResetTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupResetTriggerPopup();

    static SetupResetTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupReverbPopup : SetupTriggerPopup {
    // virtual ~SetupReverbPopup();

    static SetupReverbPopup* create(SFXTriggerGameObject*, cocos2d::CCArray*);

    bool init(SFXTriggerGameObject*, cocos2d::CCArray*);
    void onPlay(cocos2d::CCObject* sender);
    void onReverb(cocos2d::CCObject* sender);
    TodoReturn updateReverbLabel();

    virtual void onClose(cocos2d::CCObject* sender);
}

[[link(android)]]
class SetupRotateCommandPopup : SetupTriggerPopup {
    // virtual ~SetupRotateCommandPopup();

    static SetupRotateCommandPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*) = win 0x2a05b0;
    void onInfiniteDuration(cocos2d::CCObject* sender);
    void updateControlVisibility() = win 0x2a1a10;

    virtual TodoReturn updateInputNode(int, float);
    virtual void valueDidChange(int, float) = imac 0x66f0;
    virtual TodoReturn triggerValueFromSliderValue(int, float);
    virtual TodoReturn triggerSliderValueFromValue(int, float);
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender);
}

[[link(android)]]
class SetupRotateGameplayPopup : SetupTriggerPopup {
    // virtual ~SetupRotateGameplayPopup();

    static SetupRotateGameplayPopup* create(RotateGameplayGameObject*, cocos2d::CCArray*);

    bool init(RotateGameplayGameObject*, cocos2d::CCArray*);

    virtual void onPlusButton(cocos2d::CCObject* sender);
    virtual void valueDidChange(int, float) = imac 0x781960;
}

[[link(android)]]
class SetupRotatePopup : SetupTriggerPopup {
    // virtual ~SetupRotatePopup();

    static SetupRotatePopup* create(EnhancedGameObject*, cocos2d::CCArray*);

    bool init(EnhancedGameObject*, cocos2d::CCArray*);

    virtual void onClose(cocos2d::CCObject* sender);
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x584860;
}

[[link(android)]]
class SetupSequenceTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupSequenceTriggerPopup();

    static SetupSequenceTriggerPopup* create(SequenceTriggerGameObject*);

    bool init(SequenceTriggerGameObject*);
    void onAddChance(cocos2d::CCObject* sender);
    void onChangeOrder(cocos2d::CCObject* sender);
    void onDeleteSelected(cocos2d::CCObject* sender);
    void onSelect(cocos2d::CCObject* sender);
    void updateGroupIDButtons();

    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x4cabe0;
}

[[link(android)]]
class SetupSFXEditPopup : SetupAudioTriggerPopup {
    // virtual ~SetupSFXEditPopup();

    static SetupSFXEditPopup* create(SFXTriggerGameObject*, cocos2d::CCArray*, bool);

    bool init(SFXTriggerGameObject*, cocos2d::CCArray*, bool);
}

[[link(android)]]
class SetupSFXPopup : SetupAudioTriggerPopup, CustomSFXDelegate, SFXBrowserDelegate {
    // virtual ~SetupSFXPopup();

    static SetupSFXPopup* create(SFXTriggerGameObject*, cocos2d::CCArray*) = win 0x42ec90;

    TodoReturn createSFXWidget();
    bool init(SFXTriggerGameObject*, cocos2d::CCArray*) = imac 0x5799a0;
    void onBrowseSFX(cocos2d::CCObject* sender);
    TodoReturn updateLength();

    virtual void pageChanged() = imac 0x4a6380;
    virtual void onClose(cocos2d::CCObject* sender) = win 0x4300b0;
    virtual void onPlusButton(cocos2d::CCObject* sender) = imac 0x4a68a0;
    virtual void valueDidChange(int, float) = imac 0x4a6780;
    virtual void sfxObjectSelected(SFXInfoObject*) {}
    virtual TodoReturn getActiveSFXID();
    virtual TodoReturn overridePlaySFX(SFXInfoObject*) = win 0x4307b0;
    virtual void sfxBrowserClosed(SFXBrowser*) = win 0x430ed0, imac 0x4a6940;
}

[[link(android)]]
class SetupShaderEffectPopup : SetupTriggerPopup {
    // virtual ~SetupShaderEffectPopup();

    static SetupShaderEffectPopup* create(EffectGameObject*, cocos2d::CCArray*, int);

    bool init(EffectGameObject*, cocos2d::CCArray*, int);
    void onResetColors(cocos2d::CCObject* sender);
    void onZLayer(cocos2d::CCObject* sender);
    TodoReturn setupBulge();
    TodoReturn setupChromatic();
    TodoReturn setupChromaticGlitch();
    TodoReturn setupColorChange();
    TodoReturn setupGlitch();
    TodoReturn setupGrayscale();
    TodoReturn setupHueShift();
    TodoReturn setupInvertColor();
    TodoReturn setupLensCircle();
    TodoReturn setupMotionBlur();
    TodoReturn setupPinch();
    TodoReturn setupPixelate();
    TodoReturn setupRadialBlur();
    TodoReturn setupSepia();
    TodoReturn setupShaderTrigger();
    TodoReturn setupShockLine();
    TodoReturn setupShockWave();
    TodoReturn setupSplitScreen();
    TodoReturn updateZLayerButtons();
    TodoReturn zLayerToString(int);

    virtual void toggleGroup(int, bool);
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void updateDefaultTriggerValues();
    virtual void valueDidChange(int, float) = imac 0x2bc7d0;
}

[[link(android)]]
class SetupShakePopup : SetupTriggerPopup {
    // virtual ~SetupShakePopup();

    static SetupShakePopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn updateDuration();
    TodoReturn updateDurLabel(bool);
    TodoReturn updateInterval();
    TodoReturn updateIntervalLabel(bool);
    TodoReturn updateShake();
    TodoReturn updateShakeLabel(bool);

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*) = win 0x43dbe0;
}

[[link(android)]]
class SetupSmartBlockLayer : FLAlertLayer, TextInputDelegate, SelectArtDelegate {
    // virtual ~SetupSmartBlockLayer();

    static SetupSmartBlockLayer* create(SmartGameObject*, cocos2d::CCArray*);

    TodoReturn determineStartValues();
    bool init(SmartGameObject*, cocos2d::CCArray*);
    void onAllowFlipping(cocos2d::CCObject* sender);
    void onAllowRotation(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    void onCreate(cocos2d::CCObject* sender);
    void onCreateAll(cocos2d::CCObject* sender);
    void onCreateTemplate(cocos2d::CCObject* sender);
    void onDontDelete(cocos2d::CCObject* sender);
    void onIgnoreCorners(cocos2d::CCObject* sender);
    void onNearbyReference(cocos2d::CCObject* sender);
    void onPasteTemplate(cocos2d::CCObject* sender);
    void onReferenceOnly(cocos2d::CCObject* sender);
    void onSelectPremade(cocos2d::CCObject* sender);
    void onSelectTemplate(cocos2d::CCObject* sender);

    virtual void keyBackClicked() = win 0x440550;
    virtual void show();
    virtual void selectArtClosed(SelectArtLayer*) = win 0x440510, imac 0x4d3a20;
}

[[link(android)]]
class SetupSmartTemplateLayer : FLAlertLayer, TextInputDelegate, FLAlertLayerProtocol {
    // virtual ~SetupSmartTemplateLayer();

    static SetupSmartTemplateLayer* create(GJSmartTemplate*) = win 0x440560;

    bool init(GJSmartTemplate*) = win 0x440670, imac 0x4d3f90;
    void onBack(cocos2d::CCObject* sender) = imac 0x4d4880;
    void onClick(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);

    virtual void keyBackClicked() = win 0x4417c0;
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x441220, imac 0x4d4bf0;
    virtual void textInputOpened(CCTextInputNode*) = win 0x441560, imac 0x4d4e10;
    virtual void textInputClosed(CCTextInputNode*) = win 0x441300;
    virtual void textChanged(CCTextInputNode*);
}

[[link(android)]]
class SetupSongTriggerPopup : SetupAudioTriggerPopup, MusicDownloadDelegate, SongPlaybackDelegate {
    // virtual ~SetupSongTriggerPopup();

    static SetupSongTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onResetSongTime(cocos2d::CCObject* sender);
    void onSavePlaybackPos(cocos2d::CCObject* sender);
    TodoReturn updateApplyPrepare(bool);
    TodoReturn updateLength();
    TodoReturn updateSongTimeSlider();

    virtual void pageChanged() = imac 0x2c07b0;
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void valueDidChange(int, float) = imac 0x2c06b0;
    virtual TodoReturn onPlayback(SongInfoObject*) = win 0x37f900;
}

[[link(android)]]
class SetupSpawnParticlePopup : SetupTriggerPopup {
    // virtual ~SetupSpawnParticlePopup();

    static SetupSpawnParticlePopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupSpawnPopup : SetupTriggerPopup {
    // virtual ~SetupSpawnPopup();

    static SetupSpawnPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onAddRemap(cocos2d::CCObject* sender);
    void onDeleteRemap(cocos2d::CCObject* sender);
    void onSelectRemap(cocos2d::CCObject* sender);
    TodoReturn queueUpdateButtons();
    TodoReturn updateRemapButtons(float);

    virtual void onClose(cocos2d::CCObject* sender);
}

[[link(android)]]
class SetupStaticCameraPopup : SetupTriggerPopup {
    // virtual ~SetupStaticCameraPopup();

    static SetupStaticCameraPopup* create(CameraTriggerGameObject*, cocos2d::CCArray*);

    bool init(CameraTriggerGameObject*, cocos2d::CCArray*);
    TodoReturn updateState();

    virtual void valueDidChange(int, float) = imac 0x388160;
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender);
}

[[link(android)]]
class SetupStopTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupStopTriggerPopup();

    static SetupStopTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);

    virtual void onClose(cocos2d::CCObject* sender) = imac 0x56eba0;
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x56eb30;
}

[[link(android)]]
class SetupTeleportPopup : SetupTriggerPopup {
    // virtual ~SetupTeleportPopup();

    static SetupTeleportPopup* create(TeleportPortalObject*, cocos2d::CCArray*, int, bool);

    bool init(TeleportPortalObject*, cocos2d::CCArray*, int, bool);
    void onTeleportGravity(cocos2d::CCObject* sender);
    TodoReturn updateTeleportGravityState(int);

    virtual void determineStartValues();
    virtual void updateDefaultTriggerValues();
    virtual void valueDidChange(int, float) = imac 0x346470;
}

[[link(android)]]
class SetupTimerControlTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupTimerControlTriggerPopup();

    static SetupTimerControlTriggerPopup* create(TimerTriggerGameObject*, cocos2d::CCArray*);

    bool init(TimerTriggerGameObject*, cocos2d::CCArray*);

    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x38e6d0;
}

[[link(android)]]
class SetupTimerEventTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupTimerEventTriggerPopup();

    static SetupTimerEventTriggerPopup* create(TimerTriggerGameObject*, cocos2d::CCArray*);

    bool init(TimerTriggerGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupTimerTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupTimerTriggerPopup();

    static SetupTimerTriggerPopup* create(TimerTriggerGameObject*, cocos2d::CCArray*);

    bool init(TimerTriggerGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupTimeWarpPopup : SetupTriggerPopup {
    // virtual ~SetupTimeWarpPopup();

    static SetupTimeWarpPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    TodoReturn sliderChanged(cocos2d::CCObject*);
    TodoReturn updateTimeWarp();
    TodoReturn updateTimeWarpLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
}

[[link(android)]]
class SetupTouchTogglePopup : SetupTriggerPopup {
    // virtual ~SetupTouchTogglePopup();

    static SetupTouchTogglePopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);
    void onControlMode(cocos2d::CCObject* sender);
    void onDualTouchMode(cocos2d::CCObject* sender);
    void onHoldMode(cocos2d::CCObject* sender);
    void onTargetIDArrow(cocos2d::CCObject* sender);
    void onTouchMode(cocos2d::CCObject* sender);
    TodoReturn updateTargetID();
    TodoReturn updateTextInputLabel();

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void textChanged(CCTextInputNode*) = win 0x44c5e0, imac 0x2a5cd0;
}

[[link(android)]]
class SetupTransformPopup : SetupTriggerPopup {
    // virtual ~SetupTransformPopup();

    static SetupTransformPopup* create(TransformTriggerGameObject*, cocos2d::CCArray*);

    bool init(TransformTriggerGameObject*, cocos2d::CCArray*);
}

[[link(android)]]
class SetupTriggerPopup : FLAlertLayer, TextInputDelegate, ConfigureValuePopupDelegate, SliderDelegate {
    // virtual ~SetupTriggerPopup();
    // SetupTriggerPopup();

    static SetupTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*, float, float, int);
    static SetupTriggerPopup* create(float, float);

    void addCloseButton(gd::string) = win 0x45c410;
    void addHelpButton(gd::string, gd::string, float) = win 0x45c520;
    void addInfoLabel(gd::string, float, cocos2d::CCPoint, int, int) = win 0x45ed10;
    void addObjectsToGroup(cocos2d::CCArray*, int);
    void addObjectsToPage(cocos2d::CCArray*, int);
    void addObjectToGroup(cocos2d::CCObject*, int);
    void addObjectToPage(cocos2d::CCObject*, int) = win 0x45c280;
    void addTitle(gd::string) = win 0x45c310;
    void closeInputNodes();
    void createCustomButton(int, gd::string, gd::string, cocos2d::CCPoint, float, float, bool, int, int) = win 0x45ef90;
    void createCustomEasingControls(gd::string, cocos2d::CCPoint, float, int, int, int, int) = win 0x464b40;
    void createCustomToggleValueControl(int, bool, bool, gd::string, cocos2d::CCPoint, bool, int, int) = win 0x45ea90;
    void createEasingControls(cocos2d::CCPoint, float, int, int) = win 0x463c20;
    void createMultiTriggerItems(cocos2d::CCPoint, cocos2d::CCPoint, cocos2d::CCPoint) = win 0x45cbd0;
    void createMultiTriggerItemsCorner() = win 0x45c8c0;
    void createMultiTriggerItemsDefault() = win 0x45c7b0;
    void createMultiTriggerItemsDefaultHorizontal() = win 0x45cac0;
    void createMultiTriggerItemsDefaultVertical() = win 0x45c9c0;
    void createPageButtons(float, int) = win 0x45bb00;
    void createPlusButton(int, cocos2d::CCPoint, float, gd::string, int, int) = win 0x45edf0;
    CCMenuItemToggler* createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCPoint) = win 0x45c680;
    void createToggleValueControl(int, gd::string, cocos2d::CCPoint, bool, int, int, float) = win 0x45e780;
    void createToggleValueControlAdvanced(int, gd::string, cocos2d::CCPoint, bool, int, int, float, float, float, cocos2d::CCPoint);
    void createValueControl(int, gd::string, cocos2d::CCPoint, float, float, float) = win 0x45d9c0;
    void createValueControlAdvanced(int, gd::string, cocos2d::CCPoint, float, bool, InputValueType, int, bool, float, float, int, int, GJInputStyle, int, bool) = win 0x45dab0;
    void createValueControlWArrows(int, gd::string, cocos2d::CCPoint, float);
    cocos2d::CCArray* getGroupContainer(int);
    float getMaxSliderValue(int);
    float getMinSliderValue(int);
    cocos2d::CCArray* getObjects();
    cocos2d::CCArray* getPageContainer(int);
    float getTriggerValue(int, GameObject*);
    float getTruncatedValue(float, int) = win 0x45f5d0;
    float getTruncatedValueByTag(int, float);
    void goToPage(int, bool) = win 0x45be90;
    void hideAll();
    bool init(EffectGameObject*, cocos2d::CCArray*, float, float, int) = win 0x45b780, imac 0x222820;
    void onCustomEaseArrow(int, bool) = win 0x465410;
    void onCustomEaseArrowDown(cocos2d::CCObject* sender) = win 0x4653e0;
    void onCustomEaseArrowUp(cocos2d::CCObject* sender) = win 0x4653b0;
    void onCustomEaseRate(cocos2d::CCObject* sender) = win 0x4652a0;
    void onDisableValue(cocos2d::CCObject* sender) = win 0x45e670;
    void onEase(cocos2d::CCObject* sender) = win 0x464940;
    void onEaseRate(cocos2d::CCObject* sender) = win 0x4649b0;
    void onMultiTrigger(cocos2d::CCObject* sender);
    void onPage(cocos2d::CCObject* sender) = win 0x45bdb0;
    void onSpawnedByTrigger(cocos2d::CCObject* sender) = win 0x45d150;
    void onToggleTriggerValue(cocos2d::CCObject* sender) = win 0x45f540;
    void onTouchTriggered(cocos2d::CCObject* sender) = win 0x45d060;
    void postSetup() {
    	this->updateDefaultTriggerValues();
    	m_disableTextDelegate = false;
    }
    void preSetup() {
    	m_disableTextDelegate = true;
    	this->determineStartValues();
    }
    void refreshGroupVisibility();
    void removeObjectFromGroup(cocos2d::CCObject*, int);
    void removeObjectFromPage(cocos2d::CCObject*, int);
    void resetDisabledValues();
    void setMaxSliderValue(float, int);
    void setMinSliderValue(float, int);
    bool shouldLimitValue(int);
    void toggleBG(bool);
    void toggleCustomEaseRateVisibility(int, int) = win 0x465790;
    void toggleDisableButtons(bool) = win 0x45e6a0;
    void toggleEaseRateVisibility();
    void toggleLimitValue(int, bool);
    void togglePageArrows(bool);
    void triggerArrowChanged(int, bool) = win 0x45d920;
    void triggerArrowLeft(cocos2d::CCObject*) = win 0x45d8c0;
    void triggerArrowRight(cocos2d::CCObject*) = win 0x45d8f0;
    void triggerSliderChanged(cocos2d::CCObject*) = win 0x45d800;
    void updateCustomEaseLabel(int, int) = win 0x4654b0;
    void updateCustomEaseRateLabel(int, float) = win 0x465680;
    void updateCustomToggleTrigger(int, bool);
    void updateEaseLabel();
    void updateEaseRateLabel();
    void updateEditorLabel();
    void updateInputNodeLabel(int, gd::string) = win 0x463a60;
    void updateLabel(int, gd::string);
    void updateMultiTriggerBtn() = win 0x45d240;
    void updateSlider(int, float);
    void updateSlider(int);
    void updateSpawnedByTrigger() = win 0x45d1a0;
    void updateTouchTriggered() = win 0x45d0b0;
    void updateValue(int, float) = win 0x4639d0;
    void updateValueControls(int, float) = win 0x45f640;
    void valueChanged(int, float) = win 0x45fc10;

    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x93d98;
    virtual void keyBackClicked();
    virtual void show();
    virtual void pageChanged() {}
    virtual void toggleGroup(int group, bool visible) = win 0x45c190, imac 0x223340;
    virtual void determineStartValues() = win 0x45cee0, imac 0x224520;
    virtual void onClose(cocos2d::CCObject* sender) = win 0x45d520;
    virtual void textInputClosed(CCTextInputNode*);
    virtual void textChanged(CCTextInputNode*) = win 0x45d360;
    virtual void textInputShouldOffset(CCTextInputNode*, float);
    virtual void textInputReturn(CCTextInputNode*);
    virtual void updateInputValue(int, float&) {}
    virtual void sliderBegan(Slider*) = win 0x45d660, imac 0x226d40;
    virtual void sliderEnded(Slider*) = win 0x45d730, imac 0x226e20;
    virtual void onPlusButton(cocos2d::CCObject* sender) {}
    virtual void onCustomButton(cocos2d::CCObject* sender) {}
    virtual void updateDefaultTriggerValues() = win 0x45f1f0, imac 0x229210;
    virtual TodoReturn updateInputNode(int, float) = win 0x45f6e0;
    virtual TodoReturn updateToggleItem(int, bool) = win 0x45fa80, imac 0x22bcd0;
    virtual void valueDidChange(int, float) {}
    virtual float getValue(int) = win 0x45faf0, imac 0x22bd90;
    virtual TodoReturn triggerValueFromSliderValue(int, float) = win 0x463ae0;
    virtual TodoReturn triggerSliderValueFromValue(int, float) = win 0x463b70;
    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) {}
    virtual TodoReturn valuePopupClosed(ConfigureValuePopup*, float) = win 0x464a80, imac 0x22cde0;

    EffectGameObject* m_gameObject;
    cocos2d::CCArray* m_gameObjects;
    bool m_touchTriggered;
    bool m_spawnTriggered;
    CCMenuItemToggler* m_touchToggle;
    CCMenuItemToggler* m_spawnToggle;
    cocos2d::CCArray* m_multiTriggerContainer;
    bool m_multiTriggered;
    float m_width;
    float m_height;
    bool m_disableTextDelegate;
    cocos2d::CCDictionary* m_valueToggles;
    cocos2d::CCDictionary* m_inputNodes;
    cocos2d::CCDictionary* m_valueControls;
    cocos2d::CCDictionary* m_customValueToggles;
    cocos2d::CCDictionary* m_disableButtons;
    cocos2d::CCLabelBMFont* m_easingLabel;
    cocos2d::CCLabelBMFont* m_easingRateLabel;
    CCMenuItemSpriteExtra* m_easingRateButton;
    int m_easingIndex;
    float m_easingRate;
    cocos2d::CCDictionary* m_inputLabels;
    cocos2d::CCDictionary* m_triggerValues;
    cocos2d::CCDictionary* m_minSliderValues;
    cocos2d::CCDictionary* m_maxSliderValues;
    gd::map<int, bool> m_shouldLimitValues;
    bool m_disableSliderDelegate;
    bool m_unk349;
    cocos2d::CCArray* m_pageContainers;
    int m_page;
    float m_easingControlScale;
    cocos2d::CCArray* m_groupContainers;
    cocos2d::CCDictionary* m_customEasingTags;
    cocos2d::CCDictionary* m_customEasingLabels;
    cocos2d::CCDictionary* m_customEasingButtons;
    cocos2d::CCDictionary* m_customEasingScales;
    cocos2d::CCDictionary* m_disabledEasingButtons;
    CCMenuItemSpriteExtra* m_prevButton;
    CCMenuItemSpriteExtra* m_nextButton;
    bool m_hideAll;
}

[[link(android)]]
class SetupZoomTriggerPopup : SetupTriggerPopup {
    // virtual ~SetupZoomTriggerPopup();

    static SetupZoomTriggerPopup* create(EffectGameObject*, cocos2d::CCArray*);

    bool init(EffectGameObject*, cocos2d::CCArray*);

    virtual void determineStartValues();
    virtual void onClose(cocos2d::CCObject* sender);
}

[[link(android)]]
class SFXBrowser : FLAlertLayer, MusicDownloadDelegate, TableViewCellDelegate, SetTextPopupDelegate, SelectSFXSortDelegate {
    // virtual ~SFXBrowser();
    SFXBrowser() {
    	m_searchResult = nullptr;
    	m_sfxObjects = nullptr;
    	m_listLayer = nullptr;
    	m_nameLabel = nullptr;
    	m_pathLabel = nullptr;
    	m_infoLabel = nullptr;
    	m_pageLabel = nullptr;
    	m_searchLabel = nullptr;
    	m_prevButton = nullptr;
    	m_refreshButton = nullptr;
    	m_clearSearchButton = nullptr;
    	m_circleSprite = nullptr;
    	m_libraryVersion = 0;
    	m_cellAmount = 0;
    	m_gettingURL = false;
    	m_selectedCell = false;
    	m_snapToSelected = false;
    	m_compactMode = false;
    	m_sortType = AudioSortType::NameAscending;
    	m_delegate = nullptr;
    	#ifdef GEODE_IS_DESKTOP
    	m_autoUpdating = false;
    	#endif
    }

    static SFXBrowser* create(int id) {
    	auto ret = new SFXBrowser();
    	if (ret->init(id)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(int) = win 0x466030, imac 0x429ad0;
    void onClearSearch(cocos2d::CCObject* sender) = imac 0x42ade0;
    void onClose(cocos2d::CCObject* sender);
    void onCredits(cocos2d::CCObject* sender);
    void onExitFolder(cocos2d::CCObject* sender) = win 0x4684e0, imac 0x42a9f0;
    void onPage(cocos2d::CCObject* sender) = win 0x468240;
    void onSearch(cocos2d::CCObject* sender) = win 0x467f10;
    void onSorting(cocos2d::CCObject* sender) = win 0x467c60, imac 0x42abc0;
    void onToggleCompactMode(cocos2d::CCObject* sender) = win 0x467e00, imac 0x42ac10;
    void onUpdateLibrary(cocos2d::CCObject* sender);
    void setupList(SFXSearchResult*) = win 0x4673c0, imac 0x42afe0;
    void trySetupSFXBrowser();
    void updatePageLabel() = win 0x468310;

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void musicActionFinished(GJMusicAction);
    virtual void musicActionFailed(GJMusicAction) = win 0x467280;
    virtual void sortSelectClosed(SelectSFXSortLayer*) = win 0x467da0, imac 0x42bdf0;
    virtual void setTextPopupClosed(SetTextPopup*, gd::string) = imac 0x42c060;
    virtual bool cellPerformedAction(TableViewCell*, int, CellAction, cocos2d::CCNode*) = win 0x468120, imac 0x42c120;
    virtual int getSelectedCellIdx();
    virtual bool shouldSnapToSelected();

    SFXSearchResult* m_searchResult;
    cocos2d::CCArray* m_sfxObjects;
    GJCommentListLayer* m_listLayer;
    cocos2d::CCLabelBMFont* m_nameLabel;
    cocos2d::CCLabelBMFont* m_pathLabel;
    cocos2d::CCLabelBMFont* m_infoLabel;
    cocos2d::CCLabelBMFont* m_pageLabel;
    cocos2d::CCLabelBMFont* m_searchLabel;
    CCMenuItemSpriteExtra* m_prevButton;
    CCMenuItemSpriteExtra* m_nextButton;
    CCMenuItemSpriteExtra* m_backButton;
    CCMenuItemSpriteExtra* m_refreshButton;
    CCMenuItemSpriteExtra* m_clearSearchButton;
    LoadingCircleSprite* m_circleSprite;
    int m_sfxID;
    int m_libraryVersion;
    int m_cellAmount;
    bool m_gettingURL;
    bool m_selectedCell;
    bool m_snapToSelected;
    bool m_compactMode;
    AudioSortType m_sortType;
    SFXBrowserDelegate* m_delegate;
    win, mac {
    	bool m_autoUpdating;
    }
}

[[link(android)]]
class SFXBrowserDelegate {
    virtual void sfxBrowserClosed(SFXBrowser*);
}

[[link(android)]]
class SFXFolderObject : SFXInfoObject {
    // virtual ~SFXFolderObject();
    	SFXFolderObject() {
    	m_sfxObjects = nullptr;
    }

    static SFXFolderObject* create(int p0, gd::string p1, int p2) {
    	auto ret = new SFXFolderObject();
    	if (ret->init(p0, p1, p2)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(int p0, gd::string p1, int p2) {
    	if (!SFXInfoObject::init(p0, p1, p2, 0, 0)) return false;
    	m_sfxObjects = cocos2d::CCArray::create();
    	m_sfxObjects->retain();
    	return true;
    }

    cocos2d::CCArray* m_sfxObjects;
}

[[link(android)]]
class SFXInfoObject : cocos2d::CCObject {
    // virtual ~SFXInfoObject();
    	SFXInfoObject() {
    	m_sfxID = 0;
    	m_folderID = 0;
    	m_size = 0;
    	m_duration = 0;
    	m_folder = false;
    	m_unk049 = false;
    	m_name = "";
    }

    static SFXInfoObject* create(int id, gd::string name, int folderID, int size, int duration) {
    	auto ret = new SFXInfoObject();
    	if (ret->init(id, name, folderID, size, duration)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    gd::string getLowerCaseName() {
    	gd::string name = m_name;
    	for (int i = 0; i < name.size(); i++) {
    		name[i] = tolower(name[i]);
    	}
    	return name;
    }
    bool init(int id, gd::string name, int folderID, int size, int duration) {
    	m_sfxID = id;
    	m_name = name;
    	m_folderID = folderID;
    	m_size = size;
    	m_duration = duration;
    	m_folder = false;
    	return true;
    }

    int m_sfxID;
    int m_folderID;
    int m_size;
    int m_duration;
    bool m_folder;
    bool m_unk049;
    gd::string m_name;
}

[[link(android)]]
class SFXSearchResult : MusicSearchResult {
    // virtual ~SFXSearchResult();

    static SFXSearchResult* create(int) = win 0x331dc0, imac 0x581c80;

    SFXFolderObject* getActiveFolder() {
    	return m_folderObject;
    }
    int getSelectedPage(int, int) = win 0x3323a0, imac 0x61b4c0;
    bool init(int folderID) {
    	if (!MusicSearchResult::init((GJSongType)-1)) return false;
    	m_folderID = folderID;
    	m_audioType = 1;
    	return true;
    }
    void setActiveFolder(SFXFolderObject* folder) {
    	CC_SAFE_RELEASE(m_folderObject);
    	CC_SAFE_RETAIN(folder);
    	m_folderObject = folder;
    }

    virtual void updateObjects(AudioSortType) = win 0x331e40;

    int m_folderID;
    SFXFolderObject* m_folderObject;
}

[[link(android)]]
class SFXTriggerGameObject : EffectGameObject {
    // virtual ~SFXTriggerGameObject();
    // SFXTriggerGameObject();

    static SFXTriggerGameObject* create(char const*);

    TodoReturn getSFXRefID();
    TodoReturn getUniqueSFXID();
    bool init(char const*);

    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class ShaderGameObject : EffectGameObject {
    // virtual ~ShaderGameObject();

    static ShaderGameObject* create(char const*);

    bool init(char const*);

    virtual void customSetup();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android), depends(GJShaderState)]]
class ShaderLayer : cocos2d::CCLayer {
    // virtual ~ShaderLayer();

    static ShaderLayer* create();

    TodoReturn objectPosToShaderPos(cocos2d::CCPoint);
    void performCalculations() = win 0x46fa50, imac 0x3bdfc0;
    TodoReturn preBulgeShader();
    TodoReturn preChromaticGlitchShader();
    TodoReturn preChromaticShader() = imac 0x3bbae0;
    TodoReturn preColorChangeShader() = imac 0x3bdac0;
    TodoReturn preCommonShader() = imac 0x3b8800;
    TodoReturn preGlitchShader() = imac 0x3bb530;
    TodoReturn preGrayscaleShader() = imac 0x3bd5a0;
    TodoReturn preHueShiftShader();
    TodoReturn preInvertColorShader();
    TodoReturn preLensCircleShader() = imac 0x3bc8e0;
    TodoReturn preMotionBlurShader();
    cocos2d::CCPoint prepareTargetContainer();
    TodoReturn prePinchShader();
    void prePixelateShader();
    TodoReturn preRadialBlurShader() = imac 0x3bcbb0;
    TodoReturn preSepiaShader();
    TodoReturn preShockLineShader() = imac 0x3bb010;
    TodoReturn preShockWaveShader() = imac 0x3ba950;
    TodoReturn preSplitScreenShader();
    bool resetAllShaders() = win 0x470f70;
    TodoReturn resetTargetContainer();
    TodoReturn setupBulgeShader();
    TodoReturn setupChromaticGlitchUniforms();
    TodoReturn setupChromaticUniforms();
    TodoReturn setupColorChangeShader();
    TodoReturn setupCommonUniforms();
    TodoReturn setupGlitchUniforms();
    TodoReturn setupGrayscaleShader();
    TodoReturn setupHueShiftShader();
    TodoReturn setupInvertColorShader();
    TodoReturn setupLensCircleShader();
    TodoReturn setupMotionBlurShader();
    TodoReturn setupPinchShader();
    TodoReturn setupRadialBlurShader();
    TodoReturn setupSepiaShader();
    void setupShader(bool) = win 0x469740, imac 0x3b6e30;
    TodoReturn setupShockLineUniforms();
    TodoReturn setupShockWaveUniforms();
    TodoReturn setupSplitScreenShader();
    void toggleAntiAlias(bool) = win 0x46a370;
    bool triggerBulge(float, float, float, float, float, int, int, float, bool);
    TodoReturn triggerChromaticGlitch(bool, float, float, float, float, float, float, float, int, float, bool, bool);
    TodoReturn triggerChromaticX(float, float, int, float, bool) = imac 0x3bba80;
    TodoReturn triggerChromaticY(float, float, int, float, bool);
    bool triggerColorChange(float, float, float, float, float, float, float, int, float);
    bool triggerGlitch(float, float, float, float, float, float, float, bool);
    bool triggerGrayscale(float, float, bool, int, int, float);
    bool triggerHueShift(float, float, int, float);
    bool triggerInvertColor(float, float, float, float, float, bool, bool, bool, int, float);
    bool triggerLensCircle(float, float, float, float, int, int, float, float, int, float, bool);
    bool triggerMotionBlurX(float, float, float, float, int, float, bool, int, int, float, bool, bool);
    bool triggerMotionBlurY(float, float, float, float, int, float, bool, int, int, float, bool, bool);
    bool triggerPinchX(float, float, float, float, float, bool, int, int, float, bool) = imac 0x3bd350;
    bool triggerPinchY(float, float, float, float, float, bool, int, int, float, bool);
    bool triggerPixelateX(float, float, bool, bool, int, float, bool) = imac 0x3bc130;
    bool triggerPixelateY(float, float, bool, bool, int, float, bool);
    bool triggerRadialBlur(float, float, float, float, int, float, float, bool, int, int, float, bool);
    bool triggerSepia(float, float, int, float);
    bool triggerShockLine(float, float, bool, bool, bool, bool, float, float, float, float, float, float, int, bool, bool, bool, float, bool, float, int, float) = imac 0x3badb0;
    bool triggerShockWave(float, float, float, float, float, float, float, bool, float, float, float, int, bool, bool, bool, float, float, bool, float, int, float) = imac 0x3ba0b0;
    bool triggerSplitScreenCols(float, float, int, float) = imac 0x3bdcb0;
    bool triggerSplitScreenRows(float, float, int, float);
    TodoReturn tweenValue(float, float, int, float, int, float);
    TodoReturn tweenValueAuto(float, int, float, int, float) = imac 0x3ba330;
    void updateEffectOffsets(cocos2d::CCPoint);
    void updateMotionBlurSpeedX(float, float);
    void updateMotionBlurSpeedY(float, float);
    TodoReturn updateShockLineCenter(cocos2d::CCPoint) = imac 0x3bafd0;
    TodoReturn updateShockWaveCenter(cocos2d::CCPoint) = imac 0x3ba910;
    bool updateZLayer(int, int, bool) = imac 0x3b7710;

    virtual bool init();
    virtual void update(float) = win 0x469630;
    virtual void visit();

    GJShaderState m_state;
    bool m_unk3c0;
    cocos2d::CCGLProgram* m_shader;
    cocos2d::CCRenderTexture* m_renderTexture;
    cocos2d::CCSprite* m_sprite;
    bool m_antiAlias;
    bool m_configuredAntiAlias;
    void* m_unk3d4;
    GJBaseGameLayer* m_gameLayer;
    cocos2d::CCPoint m_savedCameraPosition;
    float m_savedCameraRotation;
    float m_shockWaveTimeMult;
    cocos2d::CCSize m_textureContentSize;
    cocos2d::CCSize m_targetTextureSize;
    // how much bigger is the texture compared to visibleSize
    cocos2d::CCSize m_targetTextureSizeExtra;
    int m_textureScaleUniform;
    int m_textureScaleInvUniform;
    int m_shaderPositionUniform;
    int m_blurRefColorUniform;
    int m_blurUseRefUniform;
    int m_blurIntensityUniform;
    int m_blurOnlyEmptyUniform;
    int m_shockWaveTimeUniform;
    int m_shockWaveTime1Uniform;
    int m_shockWaveTime2Uniform;
    int m_shockWaveTime3Uniform;
    int m_shockWaveTime4Uniform;
    int m_shockWaveStrengthUniform;
    int m_shockWaveWavesUniform;
    int m_shockWaveCenterUniform;
    int m_shockWaveInvertUniform;
    int m_shockWaveMinSizeUniform;
    int m_shockWaveMaxSizeUniform;
    int m_shockWaveMaxDistValUniform;
    float m_shockWaveTime1;
    float m_shockWaveTime2;
    float m_shockWaveTime3;
    float m_shockWaveTime4;
    float m_shockWaveMaxDistVal;
    float m_shockWaveMinSize;
    float m_shockWaveMaxSize;
    bool m_shockWaveUnk46c;
    int m_shockLineTimeUniform;
    int m_shockLineTime1Uniform;
    int m_shockLineTime2Uniform;
    int m_shockLineTime3Uniform;
    int m_shockLineTime4Uniform;
    int m_shockLineAxisUniform;
    int m_shockLineDirectionUniform;
    int m_shockLineDualUniform;
    int m_shockLineWavesUniform;
    int m_shockLineStrengthUniform;
    int m_shockLineCenterUniform;
    int m_shockLineMaxDistValUniform;
    float m_shockLineTime1;
    float m_shockLineTime2;
    float m_shockLineTime3;
    float m_shockLineTime4;
    float m_shockLineMaxDistVal;
    int m_unk4b4;
    int m_unk4b8;
    int m_unk4bc;
    int m_glitchBotUniform;
    int m_glitchTopUniform;
    int m_glitchXOffsetUniform;
    int m_glitchColOffsetUniform;
    int m_glitchRndUniform;
    int m_chromaticXOffUniform;
    int m_chromaticYOffUniform;
    int m_cGRGBOffsetUniform;
    int m_cGYOffsetUniform;
    int m_cGTimeUniform;
    int m_cGStrengthUniform;
    int m_cGHeightUniform;
    int m_cGLineThickUniform;
    int m_cGLineStrengthUniform;
    int m_lensCircleOriginUniform;
    int m_lensCircleStartUniform;
    int m_lensCircleEndUniform;
    int m_lensCircleStrengthUniform;
    int m_lensCircleTintUniform;
    int m_lensCircleAdditiveUniform;
    int m_radialBlurCenterUniform;
    int m_radialBlurValueUniform;
    int m_blurFadeUniform;
    int m_motionBlurValueUniform;
    int m_motionBlurMultUniform;
    int m_motionBlurDualUniform;
    int m_bulgeValueUniform;
    int m_bulgeValue2Uniform;
    int m_bulgeOriginUniform;
    int m_bulgeRadiusUniform;
    int m_pinchValueUniform;
    int m_pinchCenterPosUniform;
    int m_pinchCalcUniform;
    int m_pinchRadiusUniform;
    int m_grayscaleValueUniform;
    int m_grayscaleTintUniform;
    int m_grayscaleUseLumUniform;
    int m_sepiaValueUniform;
    int m_invertColorValueUniform;
    int m_hueShiftCosAUniform;
    int m_hueShiftSinAUniform;
    int m_colorChangeCUniform;
    int m_colorChangeBUniform;
    int m_rowmodUniform;
    int m_colmodUniform;
    int m_rowmodCalcUniform;
    int m_colmodCalcUniform;
    int m_splitXStartUniform;
    int m_splitXRangeUniform;
    int m_splitXRangeMultUniform;
    int m_splitYStartUniform;
    int m_splitYRangeUniform;
    int m_splitYRangeMultUniform;
}

[[link(android)]]
class ShardsPage : FLAlertLayer {
    // virtual ~ShardsPage();
    	ShardsPage() {
    	m_pages = nullptr;
    	m_prevButton = nullptr;
    	m_nextButton = nullptr;
    	m_tierSprite = nullptr;
    	m_page = -1;
    }

    static ShardsPage* create() {
    	auto ret = new ShardsPage();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    void FLAlert_Clicked(FLAlertLayer*, bool);
    void goToPage(int) = imac 0x4b3800;
    void onClose(cocos2d::CCObject* sender);
    void onIconInfo(cocos2d::CCObject* sender) = win 0x474490, imac 0x4b3790;
    void onSwitchPage(cocos2d::CCObject* sender);

    virtual bool init() = win 0x4714a0;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void show();

    cocos2d::CCDictionary* m_pages;
    CCMenuItemSpriteExtra* m_prevButton;
    CCMenuItemSpriteExtra* m_nextButton;
    cocos2d::CCSprite* m_tierSprite;
    int m_page;
}

[[link(android)]]
class ShareCommentDelegate {
    virtual void shareCommentClosed(gd::string, ShareCommentLayer*);
}

[[link(android)]]
class ShareCommentLayer : FLAlertLayer, TextInputDelegate, UploadActionDelegate, UploadPopupDelegate {
    // virtual ~ShareCommentLayer();
    ShareCommentLayer();

    static ShareCommentLayer* create(gd::string title, int charLimit, CommentType type, int ID, gd::string desc) = win 0x4747b0;

    bool init(gd::string title, int charLimit, CommentType type, int ID, gd::string desc) = win 0x4749c0, imac 0x5c6ba0;
    void onClear(cocos2d::CCObject* sender) = win 0x475aa0, imac 0x5c7ef0;
    void onClose(cocos2d::CCObject* sender) = win 0x475fb0;
    void onPercent(cocos2d::CCObject* sender) = win 0x475b10, imac 0x5c7d60;
    void onShare(cocos2d::CCObject* sender) = win 0x475c10, imac 0x5c7fe0;
    void updateCharCountLabel() {
    	if (m_charLimit * .9f <= m_descText.size()) {
    		m_charCountLabel->setColor({ 255, 0, 0 });
    		m_charCountLabel->setOpacity(255);
    	} else if (m_charLimit * .7f <= m_descText.size()) {
    		m_charCountLabel->setColor({ 0, 0, 0 });
    		m_charCountLabel->setOpacity(255);
    	} else {
    		m_charCountLabel->setColor({ 0, 0, 0 });
    		m_charCountLabel->setOpacity(125);
    	}
    	m_charCountLabel->setString(cocos2d::CCString::createWithFormat("%i", m_charLimit - m_descText.size())->getCString());
    }
    void updateDescText(gd::string desc) {
    	m_descText = desc;
    	this->updateCharCountLabel();
    }
    void updatePercentLabel() = win 0x475b30, imac 0x5c7e30;

    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x475ff0;
    virtual void textInputOpened(CCTextInputNode* textInput) {}
    virtual void textInputClosed(CCTextInputNode* textInput) = win 0x476040, imac 0x5c84e0;
    virtual void textChanged(CCTextInputNode* textInput) = win 0x476180, imac 0x5c8670;
    virtual void uploadActionFinished(int ID, int unk) = win 0x4763d0, imac 0x5c88e0;
    virtual void uploadActionFailed(int ID, int unk) = win 0x476460;
    virtual void onClosePopup(UploadActionPopup*) = win 0x476510;

    int m_charLimit;
    int m_itemID;
    CommentType m_commentType;
    CCTextInputNode* m_commentInput;
    gd::string m_descText;
    gd::string m_placeholderText;
    cocos2d::CCLabelBMFont* m_charCountLabel;
    cocos2d::CCLabelBMFont* m_percentLabel;
    UploadActionPopup* m_uploadPopup;
    bool m_uploadSuccess;
    bool m_percentEnabled;
    int m_percent;
    ShareCommentDelegate* m_delegate;
}

[[link(android)]]
class ShareLevelLayer : FLAlertLayer {
    // virtual ~ShareLevelLayer();
    	ShareLevelLayer() {
    	m_level = nullptr;
    	m_starsRequested = 0;
    	m_starButtons = nullptr;
    }

    static ShareLevelLayer* create(GJGameLevel* level) {
    	auto ret = new ShareLevelLayer();
    	if (ret->init(level)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    CCMenuItemSpriteExtra* getStarsButton(int btnID, cocos2d::SEL_MenuHandler callback, cocos2d::CCMenu* menu, float scale) {
    	auto btnSpr = ButtonSprite::create(cocos2d::CCString::createWithFormat("%i", btnID)->getCString(), 20, 0, .5f, true, "bigFont.fnt", "GJ_button_01.png", 30.f);
    	auto btn = CCMenuItemSpriteExtra::create(btnSpr, this, callback);
    	btn->setScale(scale);
    	btn->m_baseScale = scale;
    	if (menu) menu->addChild(btn);
    	return btn;
    }
    bool init(GJGameLevel* level) = win 0x476860, imac 0x528a80;
    void onClose(cocos2d::CCObject* sender);
    void onSettings(cocos2d::CCObject* sender) = win 0x477ac0;
    void onShare(cocos2d::CCObject* sender) = win 0x477c10, imac 0x26ec00;
    void selectRating(cocos2d::CCObject*) = win 0x477930;
    void setupStars() = win 0x477520;

    virtual void keyBackClicked() = win 0x478a30;

    GJGameLevel* m_level;
    int m_starsRequested;
    cocos2d::CCArray* m_starButtons;
    cocos2d::CCSprite* m_difficultySprite;
}

[[link(android)]]
class ShareLevelSettingsLayer : FLAlertLayer, NumberInputDelegate {
    // virtual ~ShareLevelSettingsLayer();
    ShareLevelSettingsLayer() {}

    static ShareLevelSettingsLayer* create(GJGameLevel* level) {
    	auto ret = new ShareLevelSettingsLayer();
    	if (ret->init(level)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(GJGameLevel*) = win 0x478a80, imac 0x26ffa0;
    void onClose(cocos2d::CCObject* sender) = win 0x4797c0;
    void onUnlisted(cocos2d::CCObject* sender) = win 0x4794a0, imac 0x270a90;
    void onUnlistedFriendsOnly(cocos2d::CCObject* sender);
    void updateSettingsState();

    virtual void keyBackClicked();

    cocos2d::CCLabelBMFont* m_passwordLabel;
    GJGameLevel* m_level;
    CCMenuItemToggler* m_friendsOnlyToggler;
    cocos2d::CCLabelBMFont* m_friendsOnlyLabel;
}

[[link(android)]]
class ShareListLayer : FLAlertLayer {
    // virtual ~ShareListLayer();
    ShareListLayer() {
    	m_list = nullptr;
    	m_friendsOnlyToggler = nullptr;
    	m_friendsOnlyLabel = nullptr;
    }

    static ShareListLayer* create(GJLevelList* list) {
    	auto ret = new ShareListLayer();
    	if (ret->init(list)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(GJLevelList*) = win 0x2f4ef0;
    void onClose(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender) = win 0x2f6090;
    void onShare(cocos2d::CCObject* sender) = win 0x2f6350;
    void onUnlisted(cocos2d::CCObject* sender) = win 0x2f6200, imac 0x34f390;
    void updateUnlistedF();

    virtual void keyBackClicked();

    GJLevelList* m_list;
    CCMenuItemToggler* m_friendsOnlyToggler;
    cocos2d::CCLabelBMFont* m_friendsOnlyLabel;
}

[[link(android)]]
class SimpleObject : cocos2d::CCObject {
    // virtual ~SimpleObject();

    static SimpleObject* create();

    bool init();
}

[[link(android)]]
class SimplePlayer : cocos2d::CCSprite {
    // virtual ~SimplePlayer();

    static SimplePlayer* create(int) = win 0x2719a0;

    void asyncLoadIcon(int, IconType);
    void createRobotSprite(int frame) {
    	if (m_robotSprite) return;
    	auto robotSprite = GJRobotSprite::create(frame);
    	m_robotSprite = robotSprite;
    	addChild(robotSprite);
    	m_robotSprite->setVisible(false);
    }
    void createSpiderSprite(int) = win 0x272170, imac 0x356f60;
    void disableCustomGlowColor() {
    	m_hasCustomGlowColor = false;
    }
    void enableCustomGlowColor(cocos2d::_ccColor3B const& color) {
    	m_hasCustomGlowColor = true;
    	m_glowColor = color;
    }
    void hideAll() {
    	m_firstLayer->setVisible(false);
    	m_secondLayer->setVisible(false);
    	if (m_birdDome) m_birdDome->setVisible(false);
    	if (m_outlineSprite) m_outlineSprite->setVisible(false);
    	if (m_detailSprite) m_detailSprite->setVisible(false);
    	if (m_robotSprite) m_robotSprite->setVisible(false);
    	if (m_spiderSprite) m_spiderSprite->setVisible(false);
    }
    void hideSecondary() {
    	m_secondLayer->setVisible(false);
    	m_birdDome->setVisible(false);
    	m_detailSprite->setVisible(false);
    	m_outlineSprite->setVisible(false);
    	if (m_robotSprite) {
    		m_robotSprite->hideSecondary();
    		m_robotSprite->m_glowSprite->setVisible(false);
    	}
    	if (m_spiderSprite) {
    		m_spiderSprite->hideSecondary();
    		m_spiderSprite->m_glowSprite->setVisible(false);
    	}
    }
    void iconFinishedLoading(int, IconType);
    bool init(int) = win 0x271a90, imac 0x35c240;
    void setColors(cocos2d::ccColor3B const& color1, cocos2d::ccColor3B const& color2) {
    	m_firstLayer->setColor(color1);
    	m_secondLayer->setColor(color2);
    	updateColors();
    }
    void setFrames(char const*, char const*, char const*, char const*, char const*) = win 0x272b20, imac 0x35ccb0;
    void setSecondColor(cocos2d::_ccColor3B const& color) {
    	m_secondLayer->setColor(color);
    	updateColors();
    }
    void updateColors() = win 0x272230, imac 0x35aa70;
    void updatePlayerFrame(int, IconType) = win 0x2725f0, imac 0x357110;

    virtual void setOpacity(unsigned char) = win 0x272d50;
    virtual void setColor(cocos2d::ccColor3B const&) = win 0x272200;

    inline void setGlowOutline(cocos2d::ccColor3B color) {
    	enableCustomGlowColor(color);
    	m_hasGlowOutline = true;
    	updateColors();
    }

    inline void disableGlowOutline() {
    	disableCustomGlowColor();
    	m_hasGlowOutline = false;
    	updateColors();
    }

    cocos2d::CCSprite* m_firstLayer;
    cocos2d::CCSprite* m_secondLayer;
    cocos2d::CCSprite* m_birdDome;
    cocos2d::CCSprite* m_outlineSprite;
    cocos2d::CCSprite* m_detailSprite;
    GJRobotSprite* m_robotSprite;
    GJSpiderSprite* m_spiderSprite;
    int m_unknown;
    bool m_hasGlowOutline;
    int m_iconRequestID;
    bool m_hasCustomGlowColor;
    cocos2d::ccColor3B m_glowColor;
    bool m_iconLoaded;
}

[[link(android)]]
class SlideInLayer : cocos2d::CCLayerColor {
    // virtual ~SlideInLayer();

    static SlideInLayer* create();

    virtual bool init() = imac 0x27beb0;
    virtual void draw();
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked();
    virtual void customSetup();
    virtual TodoReturn enterLayer();
    virtual TodoReturn exitLayer(cocos2d::CCObject*) = imac 0x27c360;
    virtual void showLayer(bool);
    virtual TodoReturn hideLayer(bool);
    virtual TodoReturn layerVisible();
    virtual void layerHidden();
    virtual void enterAnimFinished();
    virtual void disableUI();
    virtual void enableUI();
}

[[link(android), depends(SliderTouchLogic)]]
class Slider : cocos2d::CCLayer {
    // virtual ~Slider();

    static Slider* create(cocos2d::CCNode* target, cocos2d::SEL_MenuHandler handler, char const* bar, char const* groove, char const* thumb, char const* thumbSel, float scale) = win 0x71720, imac 0x2efc60;
    static Slider* create(cocos2d::CCNode* target, cocos2d::SEL_MenuHandler handler) {
    	return Slider::create(target, handler, 1.f);
    }
    static Slider* create(cocos2d::CCNode* target, cocos2d::SEL_MenuHandler handler, float scale) {
    	return Slider::create(target, handler, "sliderBar.png", "slidergroove.png", "sliderthumb.png", "sliderthumbsel.png", scale);
    }

    void disableSlider();
    void disableTouch();
    void enableSlider();
    bool getLiveDragging() {
    	return m_touchLogic->m_activateThumb;
    }
    SliderThumb* getThumb() {
    	return m_touchLogic->m_thumb;
    }
    float getValue() {
    	return this->getThumb()->getValue();
    }
    void hideGroove(bool visibility) {
    	m_groove->setVisible(!visibility);
    }
    bool init(cocos2d::CCNode*, cocos2d::SEL_MenuHandler, char const*, char const*, char const*, char const*, float) = win 0x71850, imac 0x2efd80;
    void setBarVisibility(bool visibility) {
    	m_sliderBar->setVisible(visibility);
    }
    void setLiveDragging(bool activateThumb) {
    	m_touchLogic->m_activateThumb = activateThumb;
    }
    void setMaxOffset(float offset) {
    	m_touchLogic->setMaxOffset(offset);
    }
    void setRotated(bool rotated) {
    	m_touchLogic->setRotated(rotated);
    	m_groove->setRotation((rotated) ? -90 : 0);
    }
    void setValue(float val) = win 0x71c00, imac 0x2f00c0;
    TodoReturn sliderBegan();
    TodoReturn sliderEnded();
    void updateBar() {
    	float local_8;
    	auto thumb = this->getThumb();
    	if (!thumb->m_vertical) {
    		local_8 = thumb->getPositionX();
    	} else {
    		local_8 = thumb->getPositionY();
    	}

    	float local_c = thumb->getScale() * thumb->m_length * 0.5f + local_8;
    	float fVar6 = m_width;
    	local_c = local_c / (thumb->getScale() * thumb->m_length);
    	if (fVar6 * local_c <= fVar6) {
    		fVar6 = fVar6 * local_c;
    	}

    	this->m_sliderBar->setTextureRect(cocos2d::CCRect(0.0f, 0.0f, fVar6, m_height));
    }

    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*);

    SliderTouchLogic* m_touchLogic;
    cocos2d::CCSprite* m_sliderBar;
    cocos2d::CCSprite* m_groove;
    float m_width;
    float m_height;
    void* m_unknown;
    void* m_unknown2;
}

[[link(android)]]
class SliderDelegate {
    virtual void sliderBegan(Slider*) {}
    virtual void sliderEnded(Slider*) {}
}

[[link(android)]]
class SliderThumb : cocos2d::CCMenuItemImage {
    // virtual ~SliderThumb();

    static SliderThumb* create(cocos2d::CCNode*, cocos2d::SEL_MenuHandler, char const*, char const*);

    float getValue() = win 0x712b0, imac 0x2eed30;
    bool init(cocos2d::CCNode*, cocos2d::SEL_MenuHandler, char const*, char const*);
    void setMaxOffset(float offset) {
    	float value = getValue();
    	m_length = offset;
    	this->setPosition({0, 0});
    	setValue(value);
    }
    void setRotated(bool rotated) {
    	float value = getValue();
    	m_vertical = rotated;
    	this->setPosition({0, 0});
    	setValue(value);
    }
    void setValue(float) = win 0x71340, imac 0x2eedd0;

    float m_length;
    bool m_vertical;
}

[[link(android), depends(SliderThumb)]]
class SliderTouchLogic : cocos2d::CCMenu {
    // virtual ~SliderTouchLogic();

    static SliderTouchLogic* create(cocos2d::CCNode*, cocos2d::SEL_MenuHandler, char const*, char const*, float) = imac 0x2eeff0;

    bool init(cocos2d::CCNode*, cocos2d::SEL_MenuHandler, char const*, char const*, float);
    void setMaxOffset(float offset) {
    	float newOffset = m_thumb->getScale() * offset;
    	m_length = newOffset;
    	m_thumb->setMaxOffset(newOffset);
    }
    void setRotated(bool rotated) {
    	m_rotated = rotated;
    	m_thumb->setRotated(rotated);
    }

    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x714b0;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x715a0, imac 0x2ef6e0;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x71560;
    virtual void registerWithTouchDispatcher();

    float m_unknownUnused;
    float m_length;
    SliderThumb* m_thumb;
    Slider* m_slider;
    bool m_activateThumb;
    cocos2d::CCPoint m_position;
    bool m_rotated;
}

[[link(android)]]
class SmartGameObject : GameObject {
    // virtual ~SmartGameObject();

    static SmartGameObject* create(char const*);

    bool init(char const*);
    TodoReturn updateSmartFrame();

    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = imac 0x19ff80;
    virtual gd::string getSaveString(GJBaseGameLayer*);

    bool m_property157;
    PAD = android32 0x5;
}

[[link(android)]]
class SmartTemplateCell : TableViewCell {
    // virtual ~SmartTemplateCell();
    SmartTemplateCell(char const*, float, float);

    void loadFromObject(GJSmartTemplate*) = win 0xbd8c0;
    void onClick(cocos2d::CCObject* sender);
    void updateBGColor(int) = win 0xbdcb0;

    virtual bool init();
    virtual void draw();
}

[[link(android)]]
class SongCell : TableViewCell {
    // virtual ~SongCell();
    SongCell(char const*, float, float);

    void loadFromObject(SongObject*) = win 0xb3990;
    void onClick(cocos2d::CCObject* sender);
    TodoReturn updateBGColor(int);

    virtual bool init();
    virtual void draw();
}

[[link(android)]]
class SongInfoLayer : FLAlertLayer {
    // virtual ~SongInfoLayer();

    static SongInfoLayer* create(gd::string, gd::string, gd::string, gd::string, gd::string, gd::string, int, gd::string, int);
    static SongInfoLayer* create(int);

    bool init(gd::string, gd::string, gd::string, gd::string, gd::string, gd::string, int, gd::string, int) = win 0x47a2d0;
    void onBPM(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    void onDownload(cocos2d::CCObject* sender);
    void onFB(cocos2d::CCObject* sender);
    void onMenuMusic(cocos2d::CCObject* sender);
    void onNG(cocos2d::CCObject* sender);
    void onPracticeMusic(cocos2d::CCObject* sender);
    void onYT(cocos2d::CCObject* sender);
    void showCustomMusicUnlockInfo();

    virtual void keyBackClicked();

    gd::string m_downloadLink;
    gd::string m_newgroundsLink;
    gd::string m_youtubeLink;
    gd::string m_facebookLink;
    int m_songID;
    int m_musicCustomizerMessageIndex;
}

[[link(android)]]
class SongInfoObject : cocos2d::CCNode {
    // virtual ~SongInfoObject();

    static SongInfoObject* create(cocos2d::CCDictionary*);
    static SongInfoObject* create(int songID, gd::string songName, gd::string artistName, int artistID, float filesize, gd::string youtubeVideo, gd::string youtubeChannel, gd::string url, int nongType, gd::string extraArtistIDs, bool isNew, int newType, int priority) = win 0x32fee0;
    static SongInfoObject* create(int) = win 0x32ed90, imac 0x57e660;

    TodoReturn addTags(gd::string);
    TodoReturn containsTag(int);
    TodoReturn createWithCoder(DS_Dictionary*) = win 0x3304b0;
    TodoReturn getArtistNames(int);
    TodoReturn getTagsString(bool);
    bool init(int songID, gd::string songName, gd::string artistName, int artistID, float filesize, gd::string youtubeVideo, gd::string youtubeChannel, gd::string url, int nongType, gd::string extraArtistIDs, bool isNew, int newType, int priority);

    virtual void encodeWithCoder(DS_Dictionary*);
    virtual bool canEncode();

    int m_songID;
    gd::string m_songName;
    gd::string m_artistName;
    gd::string m_youtubeVideo;
    gd::string m_youtubeChannel;
    gd::string m_songUrl;
    int m_artistID;
    float m_fileSize;
    int m_nongType;
    gd::string m_extraArtists;
    bool m_isUnknownSong;
    int m_priority;
    int m_unkInt;
    int m_BPM;
    bool m_isNew;
    int m_newType;
    gd::string m_extraArtistNames;
    gd::unordered_set<int> m_artistIDs;
    gd::set<int> m_tags;
    gd::string m_longTagsString;
    gd::string m_shortTagsString;
}

[[link(android)]]
class SongObject : cocos2d::CCObject {
    // virtual ~SongObject();

    	SongObject() {
    	m_audioID = 0;
    }

    static SongObject* create(int audioID) {
    	auto ret = new SongObject();
    	if(ret->init(audioID)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool init(int audioID) {
    	m_audioID = audioID;
    	return true;
    }

    int m_audioID;
}

[[link(android)]]
class SongOptionsLayer : FLAlertLayer {
    // virtual ~SongOptionsLayer();

    static SongOptionsLayer* create(CustomSongDelegate*);

    bool init(CustomSongDelegate*);
    void onClose(cocos2d::CCObject* sender);
    void onFadeIn(cocos2d::CCObject* sender);
    void onFadeOut(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender);
    void onPlayback(cocos2d::CCObject* sender);
    void updatePlaybackBtn();

    virtual void keyBackClicked() = imac 0x205320;
}

[[link(android)]]
class SongPlaybackDelegate {
    virtual TodoReturn onPlayback(SongInfoObject*);
}

[[link(android)]]
class SongSelectNode : cocos2d::CCNode, FLAlertLayerProtocol, CustomSongLayerDelegate, CustomSongDelegate {
    // virtual ~SongSelectNode();

    static SongSelectNode* create(int, bool, LevelSettingsObject*, SongSelectType, cocos2d::CCPoint, cocos2d::CCNode*, cocos2d::CCMenu*, bool) = win 0xc5f80, imac 0x206860;

    void audioNext(cocos2d::CCObject* sender) = win 0xc6ab0, imac 0x2072d0;
    void audioPrevious(cocos2d::CCObject* sender) = win 0xc6af0, imac 0x207290;
    bool init(int, bool, LevelSettingsObject*, SongSelectType, cocos2d::CCPoint, cocos2d::CCNode*, cocos2d::CCMenu*, bool) = win 0xc60b0, imac 0x206980;
    void onOpenCustomSong(cocos2d::CCObject* sender);
    void onSongMode(cocos2d::CCObject* sender) = imac 0x207310;
    void onSongMode(int) = win 0xc6b50, imac 0x2073e0;
    void selectSong(int id) {
    	auto songID = id;
    	if (songID > 21) songID = 21;
    	m_songChanged = true;
    	if (songID < 0) songID = 0;
    	m_selectedSongID = songID;
    	this->updateAudioLabel();
    }
    void showCustomSongSelect() = win 0xc6e80, imac 0x207670;
    void updateAudioLabel() = win 0xc69c0, imac 0x2071a0;
    void updateWidgetVisibility() = win 0xc6d70, imac 0x2075e0;

    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0xc6fe0, imac 0x2076b0;
    virtual void customSongLayerClosed() = win 0xc7070, imac 0x207790;
    virtual TodoReturn songIDChanged(int) = win 0xc70a0, imac 0x2077f0;
    virtual TodoReturn getActiveSongID();
    virtual TodoReturn getSongFileName() = win 0xc70c0;
    virtual LevelSettingsObject* getLevelSettings() = win 0xc7180;

    int m_selectedSongID;
    bool m_isCustomSong;
    bool m_songChanged;
    cocos2d::CCLabelBMFont* m_audioLabel;
    cocos2d::CCArray* m_selectSongObjects;
    cocos2d::CCArray* m_normalSongObjects;
    cocos2d::CCArray* m_changeSongObjects;
    CCMenuItemSpriteExtra* m_normalButton;
    CCMenuItemSpriteExtra* m_customButton;
    CCMenuItemSpriteExtra* m_selectButton;
    CCMenuItemSpriteExtra* m_changeButton;
    CustomSongWidget* m_songWidget;
    LevelSettingsObject* m_settingsObject;
}

[[link(android)]]
class SongsLayer : GJDropDownLayer {
    // virtual ~SongsLayer();

    static SongsLayer* create();

    virtual void customSetup() = win 0x47bed0;
}

[[link(android)]]
class SongTriggerGameObject : SFXTriggerGameObject {
    // virtual ~SongTriggerGameObject();

    static SongTriggerGameObject* create(char const*);

    bool init(char const*);

    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class SpawnParticleGameObject : EffectGameObject {
    // virtual ~SpawnParticleGameObject();

    static SpawnParticleGameObject* create();

    virtual bool init();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class SpawnTriggerAction {
    bool isFinished();
    TodoReturn step(float);

    PAD = win 0x28;
    GameObject* m_gameObject;
    gd::vector<int> m_unkVecInt;
}

[[link(android)]]
class SpawnTriggerGameObject : EffectGameObject {
    // virtual ~SpawnTriggerGameObject();

    static SpawnTriggerGameObject* create();

    TodoReturn addRemap(int, int);
    TodoReturn changeRemap(int, int, bool);
    TodoReturn removeRemap(int, int);
    void updateRemapKeys(gd::vector<int> const&) = win 0x4a0420;

    virtual bool init();
    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = win 0x4a0520, imac 0x1c1200;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class SpecialAnimGameObject : EnhancedGameObject {
    // virtual ~SpecialAnimGameObject();

    static SpecialAnimGameObject* create(char const*);

    bool init(char const*);

    virtual void resetObject();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
    virtual void updateMainColor(cocos2d::ccColor3B const&);
    virtual void updateSecondaryColor(cocos2d::ccColor3B const&);
    virtual void updateSyncedAnimation(float, int) = imac 0x24b0d0;
}

[[link(android)]]
class SpriteAnimationManager : cocos2d::CCNode {
    // virtual ~SpriteAnimationManager();

    TodoReturn animationFinished();
    TodoReturn callAnimationFinished();
    TodoReturn createAnimations(gd::string);
    TodoReturn createWithOwner(CCAnimatedSprite*, gd::string);
    TodoReturn doCleanup();
    TodoReturn executeAnimation(gd::string);
    TodoReturn finishAnimation(gd::string);
    TodoReturn getAnimType(gd::string);
    TodoReturn getPrio(gd::string);
    TodoReturn initWithOwner(CCAnimatedSprite*, gd::string);
    TodoReturn loadAnimations(gd::string);
    TodoReturn offsetCurrentAnimation(float) = imac 0x70d4c0;
    void overridePrio() = win 0x74420;
    TodoReturn playSound(gd::string);
    TodoReturn playSoundForAnimation(gd::string);
    TodoReturn queueAnimation(gd::string);
    TodoReturn resetAnimState();
    TodoReturn runAnimation(gd::string);
    TodoReturn runQueuedAnimation();
    void stopAnimations() {
    	this->overridePrio();
    	if (m_sprite->m_paSprite) m_sprite->m_paSprite->stopAllActions();
    	if (m_sprite->m_fbfSprite) m_sprite->m_fbfSprite->stopAllActions();
    }
    TodoReturn storeAnimation(cocos2d::CCAnimate*, cocos2d::CCAnimate*, gd::string, int, spriteMode, cocos2d::CCSpriteFrame*);
    TodoReturn storeSoundForAnimation(cocos2d::CCString*, gd::string, float);
    TodoReturn switchToFirstFrameOfAnimation(gd::string);
    TodoReturn updateAnimationSpeed(float) = imac 0x70c320;

    CCAnimatedSprite* m_sprite;
    cocos2d::CCDictionary* m_animationDict1;
    cocos2d::CCDictionary* m_animationDict2;
    cocos2d::CCDictionary* m_animationDict3;
    gd::string m_queuedAnimation;
    float m_speed;
    cocos2d::CCDictionary* m_animationDict4;
    cocos2d::CCDictionary* m_animationDict5;
    gd::string m_currentAnimation;
    gd::string m_nextAnimation;
}

[[link(android)]]
class SpriteDescription : cocos2d::CCObject {
    // virtual ~SpriteDescription();
    // SpriteDescription();

    TodoReturn createDescription(cocos2d::CCDictionary*);
    TodoReturn createDescription(DS_Dictionary*);
    TodoReturn initDescription(cocos2d::CCDictionary*);
    TodoReturn initDescription(DS_Dictionary*);
}

[[link(android)]]
class SpritePartDelegate {
    virtual TodoReturn displayFrameChanged(cocos2d::CCObject*, gd::string);
}

[[link(android)]]
class StarInfoPopup : FLAlertLayer {
    // virtual ~StarInfoPopup();

    static StarInfoPopup* create(int, int, int, int, int, int, int, int, int, bool) = win 0x3b0ad0, imac 0x7aba30;
    static StarInfoPopup* createFromString(gd::string);
    static StarInfoPopup* createFromStringMoons(gd::string);

    bool init(int, int, int, int, int, int, int, int, int, bool) = win 0x3b0c10, imac 0x7abbc0;
    void onClose(cocos2d::CCObject* sender);

    virtual void keyBackClicked();
}

[[link(android)]]
class StartPosObject : EffectGameObject {
    // virtual ~StartPosObject();

    static StartPosObject* create();

    TodoReturn loadSettingsFromString(gd::string);
    void setSettings(LevelSettingsObject*);

    virtual bool init();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);

    LevelSettingsObject* m_startSettings;
}

[[link(android)]]
class StatsCell : TableViewCell {
    // virtual ~StatsCell();
    StatsCell(char const*, float, float);

    TodoReturn getTitleFromKey(char const*);
    void loadFromObject(StatsObject*) = win 0xb2630, imac 0x234930;
    void updateBGColor(int);

    virtual bool init();
    virtual void draw() = win 0xad710;
}

[[link(android)]]
class StatsLayer : GJDropDownLayer {
    // virtual ~StatsLayer();

    static StatsLayer* create();

    virtual void customSetup();
}

[[link(android)]]
class StatsObject : cocos2d::CCObject {
    // virtual ~StatsObject();

    static StatsObject* create(char const*, int);

    bool init(char const*, int);
}

[[link(android)]]
class SupportLayer : GJDropDownLayer, FLAlertLayerProtocol, UploadActionDelegate, UploadPopupDelegate {
    // virtual ~SupportLayer();

    static SupportLayer* create();

    TodoReturn createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint, cocos2d::CCArray*);
    TodoReturn exitLayer();
    void onCocos2d(cocos2d::CCObject* sender);
    void onEmail(cocos2d::CCObject* sender);
    void onGetReward(cocos2d::CCObject* sender);
    void onLinks(cocos2d::CCObject* sender);
    void onLowDetail(cocos2d::CCObject* sender) = win 0x4b1000;
    void onPrivacy(cocos2d::CCObject* sender);
    void onRequestAccess(cocos2d::CCObject* sender) = win 0x4b0bb0;
    void onRobTop(cocos2d::CCObject* sender);
    void onSFX(cocos2d::CCObject* sender);
    void onTOS(cocos2d::CCObject* sender);
    TodoReturn sendSupportMail();

    virtual void customSetup() = imac 0x384c50;
    virtual void uploadActionFinished(int, int) = win 0x4b0e30, imac 0x386af0;
    virtual void uploadActionFailed(int, int) = win 0x4b0f70, imac 0x386c40;
    virtual void onClosePopup(UploadActionPopup*);
    virtual void FLAlert_Clicked(FLAlertLayer*, bool) = win 0x4b1bf0;
}

[[link(android), depends(CCIndexPath)]]
class TableView : CCScrollLayerExt, CCScrollLayerExtDelegate {
    // virtual ~TableView() = ios 0x30f51c;
    inline TableView(cocos2d::CCRect rect) : CCScrollLayerExt(rect) {
    	m_touchStartPosition2 = cocos2d::CCPointMake(0.f, 0.f);
    	m_unknown2 = cocos2d::CCPointMake(0.f, 0.f);
    	m_touchPosition2 = cocos2d::CCPointMake(0.f, 0.f);
    	m_tableDelegate = nullptr;
    	m_dataSource = nullptr;
    	m_cellDelegate = nullptr;
    	m_unused2 = false;
    	this->setTouchEnabled(true);
    	this->setMouseEnabled(true);
    	m_vScrollbarVisible = false;
    	m_hScrollbarVisible = false;
    	m_disableHorizontal = false;
    	m_unused3 = nullptr;
    	m_delegate = this;
    	m_touchOutOfBoundary = false;
    	m_array2 = cocos2d::CCArray::create();
    	m_array2->retain();
    	m_cellArray = cocos2d::CCArray::create();
    	m_cellArray->retain();
    	m_array3 = cocos2d::CCArray::create();
    	m_array3->retain();
    	m_touchLastY = 0.f;
    	m_cancellingTouches = false;
    	m_idk2 = false;
    }

    static TableView* create(TableViewDelegate* tvd, TableViewDataSource* tvds, TableViewCellDelegate* tvcd, cocos2d::CCRect rect) {
    	auto ret = new TableView(rect);
    	ret->m_tableDelegate = tvd;
    	ret->m_dataSource = tvds;
    	ret->m_cellDelegate = tvcd;
    	ret->setPosition({ 0.f, 0.f });
    	ret->autorelease();
    	return ret;
    }

    void cancelAndStoleTouch(cocos2d::CCTouch*, cocos2d::CCEvent*);
    TodoReturn cellForRowAtIndexPath(CCIndexPath&);
    TodoReturn cellForTouch(cocos2d::CCTouch*);
    TodoReturn checkBoundaryOfCell(cocos2d::CCPoint&, float);
    TodoReturn checkBoundaryOfCell(TableViewCell*);
    TodoReturn checkBoundaryOfContent(float);
    TodoReturn checkFirstCell(TableViewCell*);
    TodoReturn checkLastCell(TableViewCell*);
    TodoReturn claimTouch(cocos2d::CCTouch*);
    void deleteTableViewCell(TableViewCell*) = imac 0x6098d0;
    TodoReturn dequeueReusableCellWithIdentifier(char const*);
    TodoReturn initTableViewCells();
    bool isDuplicateIndexPath(CCIndexPath&);
    bool isDuplicateInVisibleCellArray(CCIndexPath*);
    void reloadData() = win 0x74d00, imac 0x609c00;
    TodoReturn removeIndexPathFromPathAddedArray(CCIndexPath&);
    TodoReturn scrollToIndexPath(CCIndexPath&);
    TodoReturn touchFinish(cocos2d::CCTouch*);

    virtual void onEnter();
    virtual void onExit();
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x75250;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x754e0;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x75400;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x75460, imac 0x60add0;
    virtual void registerWithTouchDispatcher() = win 0x3e5a0;
    virtual void scrollWheel(float, float) = win 0x75a90, imac 0x60af80;
    virtual void scrllViewWillBeginDecelerating(CCScrollLayerExt*) {}
    virtual void scrollViewDidEndDecelerating(CCScrollLayerExt*) {}
    virtual void scrollViewTouchMoving(CCScrollLayerExt*) {}
    virtual void scrollViewDidEndMoving(CCScrollLayerExt*) {}

    bool m_touchOutOfBoundary;
    cocos2d::CCTouch* m_touchStart;
    cocos2d::CCPoint m_touchStartPosition2;
    cocos2d::CCPoint m_unknown2;
    cocos2d::CCPoint m_touchPosition2;
    TableViewCell* m_touchedCell;
    bool m_touchMoved;
    cocos2d::CCArray* m_cellArray;
    cocos2d::CCArray* m_array2;
    cocos2d::CCArray* m_array3;
    TableViewDelegate* m_tableDelegate;
    TableViewDataSource* m_dataSource;
    TableViewCellDelegate* m_cellDelegate;
    bool m_unused2;
    void* m_unused3;
    int m_unused4;
    float m_touchLastY;
    bool m_cancellingTouches;
    bool m_idk2;
}

[[link(android), depends(CCIndexPath)]]
class TableViewCell : cocos2d::CCLayer {
    // virtual ~TableViewCell();
    TableViewCell(char const*, float, float) = win 0x76ad0, imac 0x60f7f0;

    TodoReturn updateVisibility() = imac 0x60fd90;

    void* m_unknown;
    TableView* m_tableView;
    CCIndexPath m_indexPath;
    void* m_unknown2;
    gd::string m_unknownString;
    float m_width;
    float m_height;
    cocos2d::CCLayerColor* m_backgroundLayer;
    cocos2d::CCLayer* m_mainLayer;
    BoomListType m_listType;
}

[[link(android)]]
class TableViewCellDelegate {
    virtual bool cellPerformedAction(TableViewCell*, int, CellAction, cocos2d::CCNode*);
    virtual int getSelectedCellIdx();
    virtual bool shouldSnapToSelected();
    virtual TodoReturn getCellDelegateType();
}

[[link(android)]]
class TableViewDataSource {
    virtual int numberOfRowsInSection(unsigned int, TableView*) { return 0; }
    virtual unsigned int numberOfSectionsInTableView(TableView*) { return 0; }
    virtual void TableViewCommitCellEditingStyleForRowAtIndexPath(TableView*, TableViewCellEditingStyle, CCIndexPath&) {}
    virtual TableViewCell* cellForRowAtIndexPath(CCIndexPath&, TableView*) { return nullptr; }
}

[[link(android)]]
class TableViewDelegate {
    virtual void willTweenToIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual void didEndTweenToIndexPath(CCIndexPath&, TableView*) {}
    virtual void TableViewWillDisplayCellForRowAtIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual void TableViewDidDisplayCellForRowAtIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual void TableViewWillReloadCellForRowAtIndexPath(CCIndexPath&, TableViewCell*, TableView*) {}
    virtual float cellHeightForRowAtIndexPath(CCIndexPath&, TableView*) { return 0; }
    virtual void didSelectRowAtIndexPath(CCIndexPath&, TableView*) {}
}

[[link(android)]]
class TeleportPortalObject : RingObject {
    // virtual ~TeleportPortalObject();

    static TeleportPortalObject* create(char const*, bool) = win 0x4994f0, imac 0x1ac200;

    TodoReturn getTeleportXOff(cocos2d::CCNode*) = win 0x499770, imac 0x1ac4d0;
    bool init(char const*, bool) = win 0x48d020;
    void setPositionOverride(cocos2d::CCPoint);
    void setStartPosOverride(cocos2d::CCPoint);

    virtual void setPosition(cocos2d::CCPoint const&) = imac 0x1ac5a0;
    virtual void setRotation(float);
    virtual void setStartPos(cocos2d::CCPoint);
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*) = imac 0x17ba80;
    virtual void addToGroup(int) = imac 0x1ac6e0;
    virtual void removeFromGroup(int);
    virtual void setRotation2(float);
    virtual void addToGroup2(int);
    virtual void removeFromGroup2(int);

    TeleportPortalObject* m_orangePortal;
    bool m_isYellowPortal;
    float m_teleportYOffset;
    // property 55
    bool m_teleportEase;
    // property 345
    bool m_staticForceEnabled;
    // property 346
    int m_staticForce;
    // property 347
    bool m_redirectForceEnabled;
    // property 350
    float m_redirectForceMod;
    // property 348
    float m_redirectForceMin;
    // property 349
    float m_redirectForceMax;
    // property 351
    bool m_saveOffset;
    // property 352
    bool m_ignoreX;
    // property 353
    bool m_ignoreY;
    // property 354
    int m_gravityMode;
    // property 443
    bool m_property443;
    // property 464
    bool m_property464;
    // property 510
    bool m_property510;
    // property 591
    bool m_property591;

    GJBaseGameLayer* m_gameLayer;
}

[[link(android)]]
class TextAlertPopup : cocos2d::CCNode {
    // virtual ~TextAlertPopup();

    static TextAlertPopup* create(gd::string text, float delay, float scale, int opacity, gd::string font) = win 0x296380;

    bool init(gd::string text, float delay, float scale, int opacity, gd::string font) = win 0x2964b0, imac 0x29b970;
    void setAlertPosition(cocos2d::CCPoint windowOffset, cocos2d::CCPoint pointOffset) {
    	if (!m_label) return;

    	auto winSize = cocos2d::CCDirector::sharedDirector()->getWinSize();
    	this->setPosition({
    		windowOffset.x * winSize.width + m_width / 2 + pointOffset.x,
    		windowOffset.y * winSize.height + m_height / 2 + pointOffset.y
    	});
    }
    void setLabelColor(cocos2d::ccColor3B color) {
    	if (m_label) m_label->setColor(color);
    }

    float m_width;
    float m_height;
    cocos2d::CCLabelBMFont* m_label;
}

[[link(android)]]
class TextArea : cocos2d::CCSprite {
    // virtual ~TextArea();
    // TextArea();

    static TextArea* create(gd::string str, char const* font, float scale, float width, cocos2d::CCPoint anchor, float lineHeight, bool disableColor) = win 0x76e50;

    void colorAllCharactersTo(cocos2d::ccColor3B) = win 0x77600, imac 0x30d800;
    void colorAllLabels(cocos2d::ccColor3B) = imac 0x30d8b0;
    void fadeIn(float, bool);
    void fadeInCharacters(float, float);
    void fadeOut(float);
    void fadeOutAndRemove() = imac 0x30d630;
    void finishFade() = win 0x775a0, imac 0x30d600;
    void hideAll();
    bool init(gd::string str, char const* font, float scale, float width, cocos2d::CCPoint anchor, float lineHeight, bool disableColor);
    void setIgnoreColorCode(bool) = imac 0x30d240;
    void setString(gd::string) = win 0x77090;
    void showAll();
    void stopAllCharacterActions() = win 0x774e0, imac 0x30d330;

    virtual void update(float) = win 0x776b0, imac 0x30d940;
    virtual void draw() {}
    virtual void setOpacity(unsigned char) = win 0x775c0;

    bool m_disableColor;
    MultilineBitmapFont* m_label;
    float m_width;
    int m_unknown;
    gd::string m_fontFile;
    float m_height;
    bool m_unkBool;
    cocos2d::CCPoint m_anchorPoint;
    bool m_allShown;
    float m_scale;
    int m_rectHeight;
    int m_rectWidth;
    float m_maxWidth;
    cocos2d::CCPoint m_unkPoint;
    TextAreaDelegate* m_delegate;
    cocos2d::CCDictionary* m_shakeCharacters;
    float m_shakeElapsed;
}

[[link(android)]]
class TextAreaDelegate {
    virtual TodoReturn fadeInTextFinished(TextArea*);
}

[[link(android)]]
class TextGameObject : GameObject {
    // virtual ~TextGameObject();

    static TextGameObject* create(cocos2d::CCTexture2D*) = win 0x1a4410;

    bool init(cocos2d::CCTexture2D*);
    void updateTextObject(gd::string, bool) = win 0x1a4500, imac 0x5b83b0;

    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = imac 0x29b7f0;
    virtual gd::string getSaveString(GJBaseGameLayer*) = imac 0x5b8750;
    virtual void updateTextKerning(int);
    virtual int getTextKerning();

    gd::string m_text;
    // property 488
    int m_kerning;
}

[[link(android)]]
class TextInputDelegate {
    virtual void textChanged(CCTextInputNode*) {}
    virtual void textInputOpened(CCTextInputNode*) {}
    virtual void textInputClosed(CCTextInputNode*) {}
    virtual void textInputShouldOffset(CCTextInputNode*, float) {}
    virtual void textInputReturn(CCTextInputNode*) {}
    virtual bool allowTextInput(CCTextInputNode*) { return true; }
    virtual void enterPressed(CCTextInputNode*) {}
}

[[link(android)]]
class TextStyleSection : cocos2d::CCObject {
    // virtual ~TextStyleSection();

    static TextStyleSection* create(int, int, TextStyleType) = win 0x6d810, imac 0x475a90;

    static TextStyleSection* createColoredSection(cocos2d::ccColor3B p0, int p1, int p2) {
    	auto ret = TextStyleSection::create(p1, p2, TextStyleType::Colored);
    	ret->m_color = p0;
    	return ret;
    }
    static TextStyleSection* createDelaySection(int p0, float p1) {
    	auto ret = TextStyleSection::create(p0, -1, TextStyleType::Delayed);
    	ret->m_delay = p1;
    	return ret;
    }
    static TextStyleSection* createInstantSection(int p0, int p1, float p2) {
    	auto ret = TextStyleSection::create(p0, p1, TextStyleType::Instant);
    	ret->m_instantTime = p2;
    	return ret;
    }
    static TextStyleSection* createShakeSection(int p0, int p1, int p2, int p3) {
    	auto ret = TextStyleSection::create(p0, p1, TextStyleType::Shake);
    	ret->m_shakeIntensity = p2;
    	ret->m_shakesPerSecond = p3;
    	return ret;
    }
    bool init(int p0, int p1, TextStyleType p2) {
    	m_styleType = p2;
    	m_startIndex = p0;
    	m_endIndex = p1;
    	return true;
    }

    TextStyleType m_styleType;
    int m_startIndex;
    int m_endIndex;
    cocos2d::ccColor3B m_color;
    float m_instantTime;
    float m_delay;
    int m_shakeIntensity;
    int m_shakesPerSecond;
}

[[link(android)]]
class TimerTriggerAction {
    PAD = win 0x20;
    gd::vector<int> m_unkVecInt;
}

[[link(android)]]
class TimerTriggerGameObject : EffectGameObject {
    // virtual ~TimerTriggerGameObject();

    static TimerTriggerGameObject* create(char const*);

    bool init(char const*);

    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = imac 0x1d0b30;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class ToggleTriggerAction {
    PAD = win 0x14;
    gd::vector<int> m_unkVecInt;
}

[[link(android)]]
class TopArtistsLayer : FLAlertLayer, OnlineListDelegate {
    // virtual ~TopArtistsLayer();
    	TopArtistsLayer() {
    	m_topArtists = nullptr;
    	m_listLayer = nullptr;
    	m_loadingCircle = nullptr;
    	m_page = 0;
    }

    static TopArtistsLayer* create() {
    	auto ret = new TopArtistsLayer();
    	if (ret->init()) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }

    bool isCorrect(char const*);
    void loadPage(int) = win 0x4b29f0, imac 0x2fd1b0;
    void onClose(cocos2d::CCObject* sender) = win 0x84620;
    void onNextPage(cocos2d::CCObject* sender) = win 0x4b2e60;
    void onPrevPage(cocos2d::CCObject* sender) = win 0x4b2e70;
    void setupLeaderboard(cocos2d::CCArray*) = win 0x4b26c0;
    void updateLevelsLabel();

    virtual bool init() = win 0x4b1eb0;
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x84650;
    virtual void show();
    virtual void loadListFinished(cocos2d::CCArray*, char const*) = win 0x4b2650, imac 0x2fca90;
    virtual void loadListFailed(char const*);
    virtual void setupPageInfo(gd::string, char const*) = win 0x4b2810, imac 0x2fcb90;

    cocos2d::CCArray* m_topArtists;
    GJCommentListLayer* m_listLayer;
    LoadingCircle* m_loadingCircle;
    CCMenuItemSpriteExtra* m_nextButton;
    CCMenuItemSpriteExtra* m_prevButton;
    void* m_unkPtr;
    cocos2d::CCLabelBMFont* m_pageInfoLabel;
    int m_itemCount;
    int m_pageStartIdx;
    int m_pageEndIdx;
    int m_unkSize4;
    int m_page;
}

[[link(android)]]
class TOSPopup : FLAlertLayer {
    // virtual ~TOSPopup();

    static TOSPopup* create();

    void onClose(cocos2d::CCObject* sender);
    void onPrivacy(cocos2d::CCObject* sender);
    void onTOS(cocos2d::CCObject* sender);

    virtual bool init() = win 0x296810;
    virtual void keyBackClicked() {}
}

[[link(android)]]
class TouchToggleAction {
    PAD = win 0x20;
    gd::vector<int> m_unkVecInt;
}

[[link(android)]]
class TransformTriggerGameObject : EffectGameObject {
    // virtual ~TransformTriggerGameObject();

    static TransformTriggerGameObject* create(char const*);

    bool init(char const*);

    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = imac 0x1c7590;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class TriggerControlGameObject : EffectGameObject {
    // virtual ~TriggerControlGameObject();

    static TriggerControlGameObject* create(char const*);

    bool init(char const*);
    TodoReturn updateTriggerControlFrame();

    virtual void triggerObject(GJBaseGameLayer*, int, gd::vector<int> const*) = imac 0x1dd640;
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&);
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class TriggerEffectDelegate {
    virtual void toggleGroupTriggered(int, bool, gd::vector<int> const&, int, int) {}
    virtual void spawnGroup(int, bool, double, gd::vector<int> const&, int, int) {}
    virtual void spawnObject(GameObject*, double, gd::vector<int> const&) {}
}

[[link(android)]]
class TutorialLayer : FLAlertLayer {
    // virtual ~TutorialLayer();

    static TutorialLayer* create();

    void loadPage(int);
    void onClose(cocos2d::CCObject* sender);
    void onNext(cocos2d::CCObject* sender);
    void removeTutorialTexture();

    virtual bool init() = imac 0x4c8600;
    virtual void keyBackClicked();
}

[[link(android)]]
class TutorialPopup : FLAlertLayer {
    // virtual ~TutorialPopup();

    static TutorialPopup* create(gd::string);

    TodoReturn animateMenu();
    TodoReturn closeTutorial(cocos2d::CCObject*);
    bool init(gd::string);
    TodoReturn registerForCallback(cocos2d::SEL_MenuHandler, cocos2d::CCNode*);

    virtual void keyBackClicked();
    virtual void show();
}

[[link(android)]]
class UIButtonConfig {
    TodoReturn reset() = win 0x1779e0;
    TodoReturn resetOneBtn();

    PAD = win 0x28, android32 0x28, android64 0x28;
}

[[link(android)]]
class UILayer : cocos2d::CCLayerColor {
    // virtual ~UILayer();
    // UILayer() = ios 0x51948;

    static UILayer* create(GJBaseGameLayer*) = imac 0x4b3bf0;

    void disableMenu();
    TodoReturn editorPlaytest(bool);
    void enableEditorMode();
    TodoReturn enableMenu();
    void handleKeypress(cocos2d::enumKeyCodes, bool) = win 0x4b4ac0, imac 0x4b50f0;
    bool init(GJBaseGameLayer*) = win 0x4b3da0;
    bool isJumpButtonPressed(bool) = imac 0x4b5aa0;
    void onCheck(cocos2d::CCObject* sender);
    void onDeleteCheck(cocos2d::CCObject* sender);
    void onPause(cocos2d::CCObject* sender) = win 0x4b5240;
    void processUINodesTouch(GJUITouchEvent, cocos2d::CCTouch*);
    void processUINodeTouch(GJUITouchEvent, int, cocos2d::CCPoint, GJUINode*) = win 0x4b5750;
    TodoReturn refreshDpad();
    void resetAllButtons();
    void resetUINodeState() = win 0x4b4920;
    TodoReturn toggleCheckpointsMenu(bool);
    void toggleMenuVisibility(bool);
    void togglePlatformerMode(bool);
    TodoReturn updateDualMode(bool);
    TodoReturn updateUINodeVisibility(bool);
    TodoReturn doPause();

    virtual void draw() {}
    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x4b5420;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x4b55b0;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x4b55d0, imac 0x4b5dc0;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void registerWithTouchDispatcher();
    virtual void keyBackClicked() = win 0x4b5180;
    virtual void keyDown(cocos2d::enumKeyCodes) = win 0x4b5160, imac 0x4b55d0;
    virtual void keyUp(cocos2d::enumKeyCodes) = win 0x4b5170, imac 0x4b5620;

    // This member is here because rob managed to inhert CCKeyboardDelegate twice
    // in this class, which ended up breaking addresser when trying to hook it.
    // so instead, we removed the second CCKeyboardDelegate from the base class list
    // and put this member here to take the place of its vtable
    void* m_stupidDelegate;

    void* m_pUnknown1;
    cocos2d::CCMenu* m_checkpointMenu;
    CCMenuItemSpriteExtra* m_pauseBtn;
    bool m_bUnknown2;
    bool m_bUnknown3;
    bool m_p1Jumping;
    bool m_p2Jumping;
    bool m_checkpointBtnDown;
    int m_p1TouchId;
    int m_p2TouchId;
    float m_clkTimer;
    bool m_inPlatformer;
    GJBaseGameLayer* m_gameLayer;
    bool m_initialized;
    cocos2d::CCArray* m_uiNodes;
    bool m_dualMode;
    bool m_dpadType;
    bool m_editorMode;
}

[[link(android)]]
class UIObjectSettingsPopup : SetupTriggerPopup {
    // virtual ~UIObjectSettingsPopup();

    static UIObjectSettingsPopup* create(UISettingsGameObject*, cocos2d::CCArray*);

    bool init(UISettingsGameObject*, cocos2d::CCArray*);

    virtual void onCustomToggleTriggerValue(cocos2d::CCObject* sender) = imac 0x565f40;
}

[[link(android)]]
class UIOptionsLayer : SetupTriggerPopup {
    // virtual ~UIOptionsLayer();

    static UIOptionsLayer* create(bool);

    TodoReturn getNode(int);
    bool init(bool);
    void onReset(cocos2d::CCObject* sender);
    void onSaveLoad(cocos2d::CCObject* sender);
    TodoReturn toggleUIGroup(int);

    virtual bool ccTouchBegan(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x29c520, imac 0x2a1000;
    virtual void ccTouchMoved(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x29c670, imac 0x2a11d0;
    virtual void ccTouchEnded(cocos2d::CCTouch*, cocos2d::CCEvent*) = win 0x29c7a0, imac 0x2a1370;
    virtual void ccTouchCancelled(cocos2d::CCTouch*, cocos2d::CCEvent*);
    virtual void registerWithTouchDispatcher();
    virtual void onClose(cocos2d::CCObject* sender);
    virtual void valueDidChange(int, float) = imac 0x2a0a10;
    virtual float getValue(int) = imac 0x2a0d20;
}

[[link(android)]]
class UISaveLoadLayer : SetupTriggerPopup {
    // virtual ~UISaveLoadLayer();

    static UISaveLoadLayer* create(UIOptionsLayer*);

    bool init(UIOptionsLayer*);
    void onLoad(cocos2d::CCObject* sender);
    void onSave(cocos2d::CCObject* sender);
}

[[link(android)]]
class UISettingsGameObject : EffectGameObject {
    // virtual ~UISettingsGameObject();

    static UISettingsGameObject* create();

    virtual bool init();
    virtual void customObjectSetup(gd::vector<gd::string>&, gd::vector<void*>&) = imac 0x1cb9f0;
    virtual gd::string getSaveString(GJBaseGameLayer*);
}

[[link(android)]]
class UndoObject : cocos2d::CCObject {
    virtual ~UndoObject() {
    	if (m_objectCopy) m_objectCopy->release();
    	if (m_objects) m_objects->release();
    }
    	UndoObject() {
    	m_objectCopy = nullptr;
    	m_objects = nullptr;
    	// some of the floats are set to 1.0 but idk which who cares
    }

    static UndoObject* create(GameObject*, UndoCommand);
    static UndoObject* createWithArray(cocos2d::CCArray* arrOfObjects, UndoCommand command) {
    	auto* ret = new UndoObject();
    	if (ret->init(arrOfObjects, command)) {
    		ret->autorelease();
    		return ret;
    	}
    	delete ret;
    	return nullptr;
    }
    static UndoObject* createWithTransformObjects(cocos2d::CCArray*, UndoCommand);

    bool init(cocos2d::CCArray* array, UndoCommand command) {
    	m_command = command;
    	if (array != nullptr) {
    		m_objects = cocos2d::CCArray::create();
    		m_objects->addObjectsFromArray(array);
    		m_objects->retain();
    	}
    	return true;
    }
    bool init(GameObject*, UndoCommand) = win 0x2dae60;
    TodoReturn initWithTransformObjects(cocos2d::CCArray*, UndoCommand);
    void setObjects(cocos2d::CCArray*);

    GameObjectCopy* m_objectCopy;
    UndoCommand m_command;
    cocos2d::CCArray* m_objects;
    bool m_redo;
    GJTransformState m_transformState;
}

[[link(android)]]
class UpdateAccountSettingsPopup : FLAlertLayer, GJAccountSettingsDelegate {
    // virtual ~UpdateAccountSettingsPopup();

    static UpdateAccountSettingsPopup* create(GJAccountSettingsLayer*, int, int, int, gd::string, gd::string, gd::string);

    bool init(GJAccountSettingsLayer*, int, int, int, gd::string, gd::string, gd::string);
    void onClose(cocos2d::CCObject* sender);

    virtual void keyBackClicked() = win 0x28d9f0;
    virtual TodoReturn updateSettingsFinished() = win 0x28d670;
    virtual TodoReturn updateSettingsFailed() = win 0x28d770, imac 0x28fd10;
}

[[link(android)]]
class UploadActionDelegate {
    virtual void uploadActionFinished(int, int) {}
    virtual void uploadActionFailed(int, int) {}
}

[[link(android)]]
class UploadActionPopup : FLAlertLayer {
    // virtual ~UploadActionPopup();

    static UploadActionPopup* create(UploadPopupDelegate* delegate, gd::string str) = win 0x28da00;

    void closePopup() {
    	this->setKeypadEnabled(false);
    	this->removeFromParentAndCleanup(true);
    }
    bool init(UploadPopupDelegate* delegate, gd::string str) = win 0x28db40, imac 0x290100;
    void onClose(cocos2d::CCObject* sender) = win 0x28e1b0;
    void showFailMessage(gd::string message) = win 0x28e0b0;
    void showSuccessMessage(gd::string message) = win 0x28dfa0;

    virtual void keyBackClicked() = win 0x28e200;

    UploadPopupDelegate* m_delegate;
    TextArea* m_textArea;
    LoadingCircle* m_loadingCircle;
    CCMenuItemSpriteExtra* m_closeButton;
    bool m_succeeded;
}

[[link(android)]]
class UploadListPopup : FLAlertLayer, ListUploadDelegate {
    // virtual ~UploadListPopup();

    static UploadListPopup* create(GJLevelList*);

    bool init(GJLevelList*) = win 0x2f65a0;
    void onBack(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    void onReturnToList(cocos2d::CCObject* sender);

    virtual void keyBackClicked() {}
    virtual void show();
    virtual void listUploadFinished(GJLevelList*);
    virtual void listUploadFailed(GJLevelList*, int) = win 0x2f6cb0;
}

[[link(android)]]
class UploadMessageDelegate {
    virtual void uploadMessageFinished(int);
    virtual void uploadMessageFailed(int);
}

[[link(android)]]
class UploadPopup : FLAlertLayer, LevelUploadDelegate {
    // virtual ~UploadPopup();

    static UploadPopup* create(GJGameLevel*);

    bool init(GJGameLevel*);
    void onBack(cocos2d::CCObject* sender);
    void onClose(cocos2d::CCObject* sender);
    void onReturnToLevel(cocos2d::CCObject* sender);

    virtual void keyBackClicked() {}
    virtual void show() = win 0x2f7040;
    virtual void levelUploadFinished(GJGameLevel*);
    virtual void levelUploadFailed(GJGameLevel*) = win 0x478760;
}

[[link(android)]]
class UploadPopupDelegate {
    virtual void onClosePopup(UploadActionPopup*) {}
}

[[link(android)]]
class URLCell : TableViewCell {
    // virtual ~URLCell();
    URLCell(char const*, float, float);

    void loadFromObject(CCURLObject*) = win 0xbf530, imac 0x235420;
    void onURL(cocos2d::CCObject* sender);
    TodoReturn updateBGColor(int);

    virtual bool init();
    virtual void draw();
}

[[link(android)]]
class URLViewLayer : GJDropDownLayer {
    // virtual ~URLViewLayer();

    static URLViewLayer* create(gd::string, cocos2d::CCArray*);

    bool init(gd::string, cocos2d::CCArray*);
}

[[link(android)]]
class UserInfoDelegate {
    virtual void getUserInfoFinished(GJUserScore*);
    virtual void getUserInfoFailed(int);
    virtual void userInfoChanged(GJUserScore*);
}

[[link(android)]]
class UserListDelegate {
    virtual void getUserListFinished(cocos2d::CCArray*, UserListType);
    virtual void getUserListFailed(UserListType, GJErrorCode);
    virtual void userListChanged(cocos2d::CCArray*, UserListType);
    virtual void forceReloadList(UserListType);
}

[[link(android)]]
class VideoOptionsLayer : FLAlertLayer {
    // virtual ~VideoOptionsLayer();

    static VideoOptionsLayer* create();

    CCMenuItemToggler* createToggleButton(gd::string, cocos2d::SEL_MenuHandler, bool, cocos2d::CCMenu*, cocos2d::CCPoint, float, float, bool, cocos2d::CCArray*);
    void onAdvanced(cocos2d::CCObject* sender);
    void onApply(cocos2d::CCObject* sender) = imac 0x7899a0;
    void onClose(cocos2d::CCObject* sender);
    void onFullscreen(cocos2d::CCObject* sender);
    void onBorderless(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender);
    void onResolutionNext(cocos2d::CCObject* sender);
    void onResolutionPrev(cocos2d::CCObject* sender);
    void onTextureQualityNext(cocos2d::CCObject* sender);
    void onTextureQualityPrev(cocos2d::CCObject* sender);
    void reloadMenu();
    void toggleResolution();
    void updateResolution(int);
    void updateTextureQuality(int);

    virtual bool init();
    virtual void keyBackClicked();

    CCMenuItemSpriteExtra* m_prevResolutionBtn;
    CCMenuItemSpriteExtra* m_nextResolutionBtn;
    cocos2d::CCLabelBMFont* m_windowedResolutionLabel;
    cocos2d::CCLabelBMFont* m_selectedResolutionLabel;
    cocos2d::CCLabelBMFont* m_qualityLabel;
    int m_textureQuality;
    cocos2d::CCArray* m_availableResolutions;
    CCMenuItemToggler* m_borderlessToggle;
    cocos2d::CCLabelBMFont* m_borderlessLabel;
    bool m_windowed;
    bool m_borderless;
    int m_currentResolution;
}

[[link(android)]]
class WorldLevelPage : FLAlertLayer {
    // virtual ~WorldLevelPage();

    static WorldLevelPage* create(GJGameLevel*, GJWorldNode*);

    bool init(GJGameLevel*, GJWorldNode*);
    void onClose(cocos2d::CCObject* sender);
    void onInfo(cocos2d::CCObject* sender);
    void onPlay(cocos2d::CCObject* sender);
    void onSong(cocos2d::CCObject* sender);

    virtual void keyBackClicked();
    virtual void show();

    GJWorldNode* m_worldNode;
    GJGameLevel* m_level;
}

[[link(android)]]
class WorldSelectLayer : cocos2d::CCLayer, BoomScrollLayerDelegate {
    // virtual ~WorldSelectLayer();

    static WorldSelectLayer* create(int);

    TodoReturn animateInActiveIsland();
    cocos2d::ccColor3B colorForPage(int);
    TodoReturn getColorValue(int, int, float);
    void goToPage(int, bool);
    bool init(int);
    void onBack(cocos2d::CCObject* sender);
    void onFreeLevels(cocos2d::CCObject* sender);
    void onGarage(cocos2d::CCObject* sender);
    void onNext(cocos2d::CCObject* sender);
    void onPrev(cocos2d::CCObject* sender);
    static cocos2d::CCScene* scene(int);
    TodoReturn setupWorlds();
    void showCompleteDialog();
    TodoReturn tryShowAd();
    void unblockButtons();
    void updateArrows();

    virtual void onExit();
    virtual void keyBackClicked();
    virtual void scrollLayerWillScrollToPage(BoomScrollLayer*, int);
    virtual void scrollLayerScrolledToPage(BoomScrollLayer*, int);
    virtual void scrollLayerMoved(cocos2d::CCPoint) = imac 0x3affc0;

    cocos2d::CCSprite* m_background;
    BoomScrollLayer* m_scrollLayer;
    CCMenuItemSpriteExtra* m_arrowLeft;
    CCMenuItemSpriteExtra* m_arrowRight;
    bool m_cleanupSprites;
    bool m_unkBool1;
    GJWorldNode* m_worldNode;
    bool m_unkBool2;
}
