.class Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;
.super Ljava/lang/Object;
.source "NativeToJsMessageQueue.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->reset()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;


# direct methods
.method constructor <init>(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;)V
    .locals 0
    .param p1, "this$0"    # Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    .line 331
    iput-object p1, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;->this$0:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 334
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;->this$0:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->-$$Nest$fputonline(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;Z)V

    .line 336
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;->this$0:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->-$$Nest$fputignoreNextFlush(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;Z)V

    .line 337
    iget-object v0, p0, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$1;->this$0:Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;

    invoke-static {v0}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;->-$$Nest$fgetdelegate(Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode;)Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;

    move-result-object v0

    invoke-interface {v0, v1}, Lorg/apache/cordova/NativeToJsMessageQueue$OnlineEventsBridgeMode$OnlineEventsBridgeModeDelegate;->setNetworkAvailable(Z)V

    .line 338
    return-void
.end method
