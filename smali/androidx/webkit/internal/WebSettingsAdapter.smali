.class public Landroidx/webkit/internal/WebSettingsAdapter;
.super Ljava/lang/Object;
.source "WebSettingsAdapter.java"


# instance fields
.field private final mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;


# direct methods
.method public constructor <init>(Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;)V
    .locals 0
    .param p1, "boundaryInterface"    # Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p1, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    .line 40
    return-void
.end method


# virtual methods
.method public getAttributionRegistrationBehavior()I
    .locals 1

    .line 185
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getAttributionBehavior()I

    move-result v0

    return v0
.end method

.method public getBackForwardCacheEnabled()Z
    .locals 1

    .line 263
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getBackForwardCacheEnabled()Z

    move-result v0

    return v0
.end method

.method public getDisabledActionModeMenuItems()I
    .locals 1

    .line 81
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getDisabledActionModeMenuItems()I

    move-result v0

    return v0
.end method

.method public getEnterpriseAuthenticationAppLinkPolicyEnabled()Z
    .locals 1

    .line 139
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getEnterpriseAuthenticationAppLinkPolicyEnabled()Z

    move-result v0

    return v0
.end method

.method public getForceDark()I
    .locals 1

    .line 95
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getForceDark()I

    move-result v0

    return v0
.end method

.method public getForceDarkStrategy()I
    .locals 1

    .line 109
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getForceDarkBehavior()I

    move-result v0

    return v0
.end method

.method public getOffscreenPreRaster()Z
    .locals 1

    .line 53
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getOffscreenPreRaster()Z

    move-result v0

    return v0
.end method

.method public getRequestedWithHeaderOriginAllowList()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 148
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getRequestedWithHeaderOriginAllowList()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getSafeBrowsingEnabled()Z
    .locals 1

    .line 67
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getSafeBrowsingEnabled()Z

    move-result v0

    return v0
.end method

.method public getSpeculativeLoadingStatus()I
    .locals 1

    .line 247
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getSpeculativeLoadingStatus()I

    move-result v0

    return v0
.end method

.method public getUserAgentMetadata()Landroidx/webkit/UserAgentMetadata;
    .locals 1

    .line 166
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    .line 167
    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getUserAgentMetadataMap()Ljava/util/Map;

    move-result-object v0

    .line 166
    invoke-static {v0}, Landroidx/webkit/internal/UserAgentMetadataInternal;->getUserAgentMetadataFromMap(Ljava/util/Map;)Landroidx/webkit/UserAgentMetadata;

    move-result-object v0

    return-object v0
.end method

.method public getWebAuthenticationSupport()I
    .locals 1

    .line 231
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getWebauthnSupport()I

    move-result v0

    return v0
.end method

.method public getWebViewMediaIntegrityApiStatus()Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;
    .locals 2

    .line 212
    new-instance v0, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;

    iget-object v1, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    .line 213
    invoke-interface {v1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getWebViewMediaIntegrityApiDefaultStatus()I

    move-result v1

    invoke-direct {v0, v1}, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;-><init>(I)V

    iget-object v1, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    .line 214
    invoke-interface {v1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->getWebViewMediaIntegrityApiOverrideRules()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;->setOverrideRules(Ljava/util/Map;)Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;

    move-result-object v0

    .line 215
    invoke-virtual {v0}, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig$Builder;->build()Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;

    move-result-object v0

    .line 212
    return-object v0
.end method

.method public isAlgorithmicDarkeningAllowed()Z
    .locals 1

    .line 123
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->isAlgorithmicDarkeningAllowed()Z

    move-result v0

    return v0
.end method

.method public setAlgorithmicDarkeningAllowed(Z)V
    .locals 1
    .param p1, "allow"    # Z

    .line 116
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setAlgorithmicDarkeningAllowed(Z)V

    .line 117
    return-void
.end method

.method public setAttributionRegistrationBehavior(I)V
    .locals 1
    .param p1, "behavior"    # I

    .line 193
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setAttributionBehavior(I)V

    .line 194
    return-void
.end method

.method public setBackForwardCacheEnabled(Z)V
    .locals 1
    .param p1, "backForwardCacheEnabled"    # Z

    .line 255
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setBackForwardCacheEnabled(Z)V

    .line 256
    return-void
.end method

.method public setDisabledActionModeMenuItems(I)V
    .locals 1
    .param p1, "menuItems"    # I

    .line 74
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setDisabledActionModeMenuItems(I)V

    .line 75
    return-void
.end method

.method public setEnterpriseAuthenticationAppLinkPolicyEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 131
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setEnterpriseAuthenticationAppLinkPolicyEnabled(Z)V

    .line 132
    return-void
.end method

.method public setForceDark(I)V
    .locals 1
    .param p1, "forceDarkMode"    # I

    .line 88
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setForceDark(I)V

    .line 89
    return-void
.end method

.method public setForceDarkStrategy(I)V
    .locals 1
    .param p1, "forceDarkStrategy"    # I

    .line 102
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setForceDarkBehavior(I)V

    .line 103
    return-void
.end method

.method public setOffscreenPreRaster(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 46
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setOffscreenPreRaster(Z)V

    .line 47
    return-void
.end method

.method public setRequestedWithHeaderOriginAllowList(Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 157
    .local p1, "allowList":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setRequestedWithHeaderOriginAllowList(Ljava/util/Set;)V

    .line 158
    return-void
.end method

.method public setSafeBrowsingEnabled(Z)V
    .locals 1
    .param p1, "enabled"    # Z

    .line 60
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setSafeBrowsingEnabled(Z)V

    .line 61
    return-void
.end method

.method public setSpeculativeLoadingStatus(I)V
    .locals 1
    .param p1, "speculativeLoadingStatus"    # I

    .line 239
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setSpeculativeLoadingStatus(I)V

    .line 240
    return-void
.end method

.method public setUserAgentMetadata(Landroidx/webkit/UserAgentMetadata;)V
    .locals 2
    .param p1, "uaMetadata"    # Landroidx/webkit/UserAgentMetadata;

    .line 176
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    .line 177
    invoke-static {p1}, Landroidx/webkit/internal/UserAgentMetadataInternal;->convertUserAgentMetadataToMap(Landroidx/webkit/UserAgentMetadata;)Ljava/util/Map;

    move-result-object v1

    .line 176
    invoke-interface {v0, v1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setUserAgentMetadataFromMap(Ljava/util/Map;)V

    .line 178
    return-void
.end method

.method public setWebAuthenticationSupport(I)V
    .locals 1
    .param p1, "support"    # I

    .line 223
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-interface {v0, p1}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setWebauthnSupport(I)V

    .line 224
    return-void
.end method

.method public setWebViewMediaIntegrityApiStatus(Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;)V
    .locals 3
    .param p1, "permissionConfig"    # Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;

    .line 202
    iget-object v0, p0, Landroidx/webkit/internal/WebSettingsAdapter;->mBoundaryInterface:Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;

    invoke-virtual {p1}, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;->getDefaultStatus()I

    move-result v1

    .line 203
    invoke-virtual {p1}, Landroidx/webkit/WebViewMediaIntegrityApiStatusConfig;->getOverrideRules()Ljava/util/Map;

    move-result-object v2

    .line 202
    invoke-interface {v0, v1, v2}, Lorg/chromium/support_lib_boundary/WebSettingsBoundaryInterface;->setWebViewMediaIntegrityApiStatus(ILjava/util/Map;)V

    .line 204
    return-void
.end method
