.class Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode$1;
.super Ljava/lang/Object;
.source "NativeToJsMessageQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;->onNativeToJsMessageAvailable(Lorg/apache/cordova/NativeToJsMessageQueue;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;

.field final synthetic val$queue:Lorg/apache/cordova/NativeToJsMessageQueue;


# direct methods
.method constructor <init>(Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;Lorg/apache/cordova/NativeToJsMessageQueue;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 375
    iput-object p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode$1;->this$0:Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;

    iput-object p2, p0, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode$1;->val$queue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 378
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode$1;->val$queue:Lorg/apache/cordova/NativeToJsMessageQueue;

    invoke-virtual {v0}, Lorg/apache/cordova/NativeToJsMessageQueue;->popAndEncodeAsJs()Ljava/lang/String;

    move-result-object v0

    .line 379
    .local v0, "js":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 380
    iget-object v1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode$1;->this$0:Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;

    invoke-static {v1}, Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;->-$$Nest$fgetengine(Lorg/apache/cordova/NativeToJsMessageQueue$EvalBridgeMode;)Lorg/apache/cordova/CordovaWebViewEngine;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lorg/apache/cordova/CordovaWebViewEngine;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 382
    :cond_0
    return-void
.end method
