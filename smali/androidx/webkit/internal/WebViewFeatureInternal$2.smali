.class Landroidx/webkit/internal/WebViewFeatureInternal$2;
.super Landroidx/webkit/internal/ApiFeature$NoFramework;
.source "WebViewFeatureInternal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/webkit/internal/WebViewFeatureInternal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "publicFeatureValue"    # Ljava/lang/String;
    .param p2, "internalFeatureValue"    # Ljava/lang/String;

    .line 557
    invoke-direct {p0, p1, p2}, Landroidx/webkit/internal/ApiFeature$NoFramework;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public isSupportedByWebView()Z
    .locals 2

    .line 561
    invoke-super {p0}, Landroidx/webkit/internal/ApiFeature$NoFramework;->isSupportedByWebView()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 562
    return v1

    .line 564
    :cond_0
    const-string v0, "MULTI_PROCESS"

    invoke-static {v0}, Landroidx/webkit/WebViewFeature;->isFeatureSupported(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 565
    invoke-static {}, Landroidx/webkit/WebViewCompat;->isMultiProcessEnabled()Z

    move-result v0

    return v0

    .line 567
    :cond_1
    return v1
.end method
