.class Lorg/apache/cordova/CordovaWebViewImpl$1;
.super Ljava/lang/Object;
.source "CordovaWebViewImpl.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/CordovaWebViewImpl;->loadUrlIntoView(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/CordovaWebViewImpl;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/cordova/CordovaWebViewImpl;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/CordovaWebViewImpl;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 151
    iput-object p1, p0, Lorg/apache/cordova/CordovaWebViewImpl$1;->this$0:Lorg/apache/cordova/CordovaWebViewImpl;

    iput-object p2, p0, Lorg/apache/cordova/CordovaWebViewImpl$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 154
    iget-object v0, p0, Lorg/apache/cordova/CordovaWebViewImpl$1;->this$0:Lorg/apache/cordova/CordovaWebViewImpl;

    invoke-virtual {v0}, Lorg/apache/cordova/CordovaWebViewImpl;->stopLoading()V

    .line 155
    const-string v0, "CordovaWebViewImpl"

    const-string v1, "CordovaWebView: TIMEOUT ERROR!"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 160
    .local v0, "data":Lorg/json/JSONObject;
    :try_start_0
    const-string v1, "errorCode"

    const/4 v2, -0x6

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 161
    const-string v1, "description"

    const-string v2, "The connection to the server was unsuccessful."

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 162
    const-string v1, "url"

    iget-object v2, p0, Lorg/apache/cordova/CordovaWebViewImpl$1;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 165
    goto :goto_0

    .line 163
    :catch_0
    move-exception v1

    .line 166
    :goto_0
    iget-object v1, p0, Lorg/apache/cordova/CordovaWebViewImpl$1;->this$0:Lorg/apache/cordova/CordovaWebViewImpl;

    invoke-static {v1}, Lorg/apache/cordova/CordovaWebViewImpl;->-$$Nest$fgetpluginManager(Lorg/apache/cordova/CordovaWebViewImpl;)Lorg/apache/cordova/PluginManager;

    move-result-object v1

    const-string v2, "onReceivedError"

    invoke-virtual {v1, v2, v0}, Lorg/apache/cordova/PluginManager;->postMessage(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    return-void
.end method
