.class public Landroidx/webkit/WebSettingsCompat;
.super Ljava/lang/Object;
.source "WebSettingsCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/webkit/WebSettingsCompat$ExperimentalBackForwardCache;,
        Landroidx/webkit/WebSettingsCompat$ExperimentalSpeculativeLoading;,
        Landroidx/webkit/WebSettingsCompat$ForceDarkStrategy;,
        Landroidx/webkit/WebSettingsCompat$ForceDark;,
        Landroidx/webkit/WebSettingsCompat$MenuItemFlags;
    }
.end annotation


# static fields
.field public static final ATTRIBUTION_BEHAVIOR_APP_SOURCE_AND_APP_TRIGGER:I = 0x3

.field public static final ATTRIBUTION_BEHAVIOR_APP_SOURCE_AND_WEB_TRIGGER:I = 0x1

.field public static final ATTRIBUTION_BEHAVIOR_DISABLED:I = 0x0

.field public static final ATTRIBUTION_BEHAVIOR_WEB_SOURCE_AND_WEB_TRIGGER:I = 0x2

.field public static final DARK_STRATEGY_PREFER_WEB_THEME_OVER_USER_AGENT_DARKENING:I = 0x2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final DARK_STRATEGY_USER_AGENT_DARKENING_ONLY:I = 0x0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final DARK_STRATEGY_WEB_THEME_DARKENING_ONLY:I = 0x1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FORCE_DARK_AUTO:I = 0x1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FORCE_DARK_OFF:I = 0x0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final FORCE_DARK_ON:I = 0x2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final SPECULATIVE_LOADING_DISABLED:I = 0x0

.field public static final SPECULATIVE_LOADING_PRERENDER_ENABLED:I = 0x1

.field public static final WEB_AUTHENTICATION_SUPPORT_FOR_APP:I = 0x1

.field public static final WEB_AUTHENTICATION_SUPPORT_FOR_BROWSER:I = 0x2

.field public static final WEB_AUTHENTICATION_SUPPORT_NONE:I


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;
    .locals 1
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 1152
    invoke-static {}, Landroidx/webkit/internal/WebViewGlueCommunicator;->getCompatConverter()Landroidx/webkit/internal/WebkitToCompatConverter;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroidx/webkit/internal/WebkitToCompatConverter;->convertSettings(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v0

    return-object v0
.end method

.method public static getAttributionRegistrationBehavior(Landroid/webkit/WebSettings;)I
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 870
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->ATTRIBUTION_REGISTRATION_BEHAVIOR:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 872
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 873
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getAttributionRegistrationBehavior()I

    move-result v1

    return v1

    .line 875
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getBackForwardCacheEnabled(Landroid/webkit/WebSettings;)Z
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 1143
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->BACK_FORWARD_CACHE:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 1144
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1145
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getBackForwardCacheEnabled()Z

    move-result v1

    return v1

    .line 1147
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getDisabledActionModeMenuItems(Landroid/webkit/WebSettings;)I
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 215
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->DISABLED_ACTION_MODE_MENU_ITEMS:Landroidx/webkit/internal/ApiFeature$N;

    .line 216
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$N;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$N;->isSupportedByFramework()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 217
    invoke-static {p0}, Landroidx/webkit/internal/ApiHelperForN;->getDisabledActionModeMenuItems(Landroid/webkit/WebSettings;)I

    move-result v1

    return v1

    .line 218
    :cond_0
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$N;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 219
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getDisabledActionModeMenuItems()I

    move-result v1

    return v1

    .line 221
    :cond_1
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getEnterpriseAuthenticationAppLinkPolicyEnabled(Landroid/webkit/WebSettings;)Z
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 635
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 637
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 638
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getEnterpriseAuthenticationAppLinkPolicyEnabled()Z

    move-result v1

    return v1

    .line 640
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getForceDark(Landroid/webkit/WebSettings;)I
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 335
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->FORCE_DARK:Landroidx/webkit/internal/ApiFeature$Q;

    .line 336
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$Q;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$Q;->isSupportedByFramework()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 337
    invoke-static {p0}, Landroidx/webkit/internal/ApiHelperForQ;->getForceDark(Landroid/webkit/WebSettings;)I

    move-result v1

    return v1

    .line 338
    :cond_0
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$Q;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 339
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getForceDark()I

    move-result v1

    return v1

    .line 341
    :cond_1
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getForceDarkStrategy(Landroid/webkit/WebSettings;)I
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 574
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->FORCE_DARK_STRATEGY:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 575
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 576
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getForceDark()I

    move-result v1

    return v1

    .line 578
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getOffscreenPreRaster(Landroid/webkit/WebSettings;)Z
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 96
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->OFF_SCREEN_PRERASTER:Landroidx/webkit/internal/ApiFeature$M;

    .line 97
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$M;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$M;->isSupportedByFramework()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 98
    invoke-static {p0}, Landroidx/webkit/internal/ApiHelperForM;->getOffscreenPreRaster(Landroid/webkit/WebSettings;)Z

    move-result v1

    return v1

    .line 99
    :cond_0
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$M;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 100
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getOffscreenPreRaster()Z

    move-result v1

    return v1

    .line 102
    :cond_1
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getRequestedWithHeaderOriginAllowList(Landroid/webkit/WebSettings;)Ljava/util/Set;
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebSettings;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 663
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->REQUESTED_WITH_HEADER_ALLOW_LIST:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 665
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 666
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getRequestedWithHeaderOriginAllowList()Ljava/util/Set;

    move-result-object v1

    return-object v1

    .line 668
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getSafeBrowsingEnabled(Landroid/webkit/WebSettings;)Z
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 153
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->SAFE_BROWSING_ENABLE:Landroidx/webkit/internal/ApiFeature$O;

    .line 154
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$O;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$O;->isSupportedByFramework()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 155
    invoke-static {p0}, Landroidx/webkit/internal/ApiHelperForO;->getSafeBrowsingEnabled(Landroid/webkit/WebSettings;)Z

    move-result v1

    return v1

    .line 156
    :cond_0
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$O;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 157
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getSafeBrowsingEnabled()Z

    move-result v1

    return v1

    .line 159
    :cond_1
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getSpeculativeLoadingStatus(Landroid/webkit/WebSettings;)I
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 1082
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->SPECULATIVE_LOADING:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 1084
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1085
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getSpeculativeLoadingStatus()I

    move-result v1

    return v1

    .line 1087
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getUserAgentMetadata(Landroid/webkit/WebSettings;)Landroidx/webkit/UserAgentMetadata;
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 763
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->USER_AGENT_METADATA:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 765
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 766
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getUserAgentMetadata()Landroidx/webkit/UserAgentMetadata;

    move-result-object v1

    return-object v1

    .line 768
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getWebAuthenticationSupport(Landroid/webkit/WebSettings;)I
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 993
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->WEB_AUTHENTICATION:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 995
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 996
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getWebAuthenticationSupport()I

    move-result v1

    return v1

    .line 998
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static getWebViewMediaIntegrityApiStatus(Landroid/webkit/WebSettings;)Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 906
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->WEBVIEW_MEDIA_INTEGRITY_API_STATUS:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 908
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 909
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->getWebViewMediaIntegrityApiStatus()Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;

    move-result-object v1

    return-object v1

    .line 911
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static isAlgorithmicDarkeningAllowed(Landroid/webkit/WebSettings;)Z
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;

    .line 457
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->ALGORITHMIC_DARKENING:Landroidx/webkit/internal/ApiFeature$T;

    .line 458
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$T;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$T;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 459
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/webkit/internal/WebSettingsAdapter;->isAlgorithmicDarkeningAllowed()Z

    move-result v1

    return v1

    .line 461
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setAlgorithmicDarkeningAllowed(Landroid/webkit/WebSettings;Z)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "allow"    # Z

    .line 439
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->ALGORITHMIC_DARKENING:Landroidx/webkit/internal/ApiFeature$T;

    .line 440
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$T;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$T;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 441
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setAlgorithmicDarkeningAllowed(Z)V

    .line 445
    return-void

    .line 443
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setAttributionRegistrationBehavior(Landroid/webkit/WebSettings;I)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "behavior"    # I

    .line 847
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->ATTRIBUTION_REGISTRATION_BEHAVIOR:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 849
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 850
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setAttributionRegistrationBehavior(I)V

    .line 854
    return-void

    .line 852
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setBackForwardCacheEnabled(Landroid/webkit/WebSettings;Z)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "backForwardCacheEnabled"    # Z

    .line 1119
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->BACK_FORWARD_CACHE:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 1120
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1121
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setBackForwardCacheEnabled(Z)V

    .line 1125
    return-void

    .line 1123
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setDisabledActionModeMenuItems(Landroid/webkit/WebSettings;I)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "menuItems"    # I

    .line 191
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->DISABLED_ACTION_MODE_MENU_ITEMS:Landroidx/webkit/internal/ApiFeature$N;

    .line 192
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$N;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$N;->isSupportedByFramework()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 193
    invoke-static {p0, p1}, Landroidx/webkit/internal/ApiHelperForN;->setDisabledActionModeMenuItems(Landroid/webkit/WebSettings;I)V

    goto :goto_0

    .line 194
    :cond_0
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$N;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 195
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setDisabledActionModeMenuItems(I)V

    .line 199
    :goto_0
    return-void

    .line 197
    :cond_1
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setEnterpriseAuthenticationAppLinkPolicyEnabled(Landroid/webkit/WebSettings;Z)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "enabled"    # Z

    .line 608
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->ENTERPRISE_AUTHENTICATION_APP_LINK_POLICY:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 610
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 611
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setEnterpriseAuthenticationAppLinkPolicyEnabled(Z)V

    .line 615
    return-void

    .line 613
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setForceDark(Landroid/webkit/WebSettings;I)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "forceDarkMode"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 306
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->FORCE_DARK:Landroidx/webkit/internal/ApiFeature$Q;

    .line 307
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$Q;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$Q;->isSupportedByFramework()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 308
    invoke-static {p0, p1}, Landroidx/webkit/internal/ApiHelperForQ;->setForceDark(Landroid/webkit/WebSettings;I)V

    goto :goto_0

    .line 309
    :cond_0
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$Q;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 310
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setForceDark(I)V

    .line 314
    :goto_0
    return-void

    .line 312
    :cond_1
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setForceDarkStrategy(Landroid/webkit/WebSettings;I)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "forceDarkBehavior"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 546
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->FORCE_DARK_STRATEGY:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 547
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 548
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setForceDarkStrategy(I)V

    .line 552
    return-void

    .line 550
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setOffscreenPreRaster(Landroid/webkit/WebSettings;Z)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "enabled"    # Z

    .line 71
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->OFF_SCREEN_PRERASTER:Landroidx/webkit/internal/ApiFeature$M;

    .line 72
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$M;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$M;->isSupportedByFramework()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 73
    invoke-static {p0, p1}, Landroidx/webkit/internal/ApiHelperForM;->setOffscreenPreRaster(Landroid/webkit/WebSettings;Z)V

    goto :goto_0

    .line 74
    :cond_0
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$M;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 75
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setOffscreenPreRaster(Z)V

    .line 79
    :goto_0
    return-void

    .line 77
    :cond_1
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setRequestedWithHeaderOriginAllowList(Landroid/webkit/WebSettings;Ljava/util/Set;)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebSettings;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 696
    .local p1, "allowList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->REQUESTED_WITH_HEADER_ALLOW_LIST:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 698
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 699
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setRequestedWithHeaderOriginAllowList(Ljava/util/Set;)V

    .line 703
    return-void

    .line 701
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setSafeBrowsingEnabled(Landroid/webkit/WebSettings;Z)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "enabled"    # Z

    .line 129
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->SAFE_BROWSING_ENABLE:Landroidx/webkit/internal/ApiFeature$O;

    .line 130
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$O;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$O;->isSupportedByFramework()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 131
    invoke-static {p0, p1}, Landroidx/webkit/internal/ApiHelperForO;->setSafeBrowsingEnabled(Landroid/webkit/WebSettings;Z)V

    goto :goto_0

    .line 132
    :cond_0
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$O;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 133
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setSafeBrowsingEnabled(Z)V

    .line 137
    :goto_0
    return-void

    .line 135
    :cond_1
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setSpeculativeLoadingStatus(Landroid/webkit/WebSettings;I)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "speculativeLoadingStatus"    # I

    .line 1055
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->SPECULATIVE_LOADING:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 1057
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1058
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setSpeculativeLoadingStatus(I)V

    .line 1062
    return-void

    .line 1060
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setUserAgentMetadata(Landroid/webkit/WebSettings;Landroidx/webkit/UserAgentMetadata;)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "metadata"    # Landroidx/webkit/UserAgentMetadata;

    .line 737
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->USER_AGENT_METADATA:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 739
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 740
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setUserAgentMetadata(Landroidx/webkit/UserAgentMetadata;)V

    .line 744
    return-void

    .line 742
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setWebAuthenticationSupport(Landroid/webkit/WebSettings;I)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "support"    # I

    .line 965
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->WEB_AUTHENTICATION:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 967
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 968
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setWebAuthenticationSupport(I)V

    .line 972
    return-void

    .line 970
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method

.method public static setWebViewMediaIntegrityApiStatus(Landroid/webkit/WebSettings;Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;)V
    .locals 2
    .param p0, "settings"    # Landroid/webkit/WebSettings;
    .param p1, "permissionConfig"    # Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;

    .line 889
    sget-object v0, Landroidx/webkit/internal/WebViewFeatureInternal;->WEBVIEW_MEDIA_INTEGRITY_API_STATUS:Landroidx/webkit/internal/ApiFeature$NoFramework;

    .line 891
    .local v0, "feature":Landroidx/webkit/internal/ApiFeature$NoFramework;
    invoke-virtual {v0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 892
    invoke-static {p0}, Landroidx/webkit/WebSettingsCompat;->getAdapter(Landroid/webkit/WebSettings;)Landroidx/webkit/internal/WebSettingsAdapter;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroidx/webkit/internal/WebSettingsAdapter;->setWebViewMediaIntegrityApiStatus(Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;)V

    .line 896
    return-void

    .line 894
    :cond_0
    invoke-static {}, Landroidx/webkit/internal/WebViewFeatureInternal;->getUnsupportedOperationException()Ljava/lang/UnsupportedOperationException;

    move-result-object v1

    throw v1
.end method
