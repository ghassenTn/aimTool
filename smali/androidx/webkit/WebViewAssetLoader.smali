.class public final Landroidx/webkit/WebViewAssetLoader;
.super Ljava/lang/Object;
.source "WebViewAssetLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/webkit/WebViewAssetLoader$PathMatcher;,
        Landroidx/webkit/WebViewAssetLoader$PathHandler;,
        Landroidx/webkit/WebViewAssetLoader$Builder;,
        Landroidx/webkit/WebViewAssetLoader$InternalStoragePathHandler;,
        Landroidx/webkit/WebViewAssetLoader$ResourcesPathHandler;,
        Landroidx/webkit/WebViewAssetLoader$AssetsPathHandler;
    }
.end annotation


# static fields
.field public static final DEFAULT_DOMAIN:Ljava/lang/String; = "appassets.androidplatform.net"

.field private static final TAG:Ljava/lang/String; = "WebViewAssetLoader"


# instance fields
.field private final mMatchers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/webkit/WebViewAssetLoader$PathMatcher;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/webkit/WebViewAssetLoader$PathMatcher;",
            ">;)V"
        }
    .end annotation

    .line 547
    .local p1, "pathMatchers":Ljava/util/List;, "Ljava/util/List<Landroidx/webkit/WebViewAssetLoader$PathMatcher;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 548
    iput-object p1, p0, Landroidx/webkit/WebViewAssetLoader;->mMatchers:Ljava/util/List;

    .line 549
    return-void
.end method


# virtual methods
.method public shouldInterceptRequest(Landroid/net/Uri;)Landroid/webkit/WebResourceResponse;
    .locals 5
    .param p1, "url"    # Landroid/net/Uri;

    .line 565
    iget-object v0, p0, Landroidx/webkit/WebViewAssetLoader;->mMatchers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/webkit/WebViewAssetLoader$PathMatcher;

    .line 566
    .local v1, "matcher":Landroidx/webkit/WebViewAssetLoader$PathMatcher;
    invoke-virtual {v1, p1}, Landroidx/webkit/WebViewAssetLoader$PathMatcher;->match(Landroid/net/Uri;)Landroidx/webkit/WebViewAssetLoader$PathHandler;

    move-result-object v2

    .line 568
    .local v2, "handler":Landroidx/webkit/WebViewAssetLoader$PathHandler;
    if-nez v2, :cond_0

    goto :goto_0

    .line 569
    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroidx/webkit/WebViewAssetLoader$PathMatcher;->getSuffixPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 570
    .local v3, "suffixPath":Ljava/lang/String;
    invoke-interface {v2, v3}, Landroidx/webkit/WebViewAssetLoader$PathHandler;->handle(Ljava/lang/String;)Landroid/webkit/WebResourceResponse;

    move-result-object v4

    .line 572
    .local v4, "response":Landroid/webkit/WebResourceResponse;
    if-nez v4, :cond_1

    goto :goto_0

    .line 574
    :cond_1
    return-object v4

    .line 576
    .end local v1    # "matcher":Landroidx/webkit/WebViewAssetLoader$PathMatcher;
    .end local v2    # "handler":Landroidx/webkit/WebViewAssetLoader$PathHandler;
    .end local v3    # "suffixPath":Ljava/lang/String;
    .end local v4    # "response":Landroid/webkit/WebResourceResponse;
    :cond_2
    const/4 v0, 0x0

    return-object v0
.end method
