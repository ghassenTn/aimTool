.class Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi1;
.super Ljava/lang/Object;
.source "ComponentActivity.java"

# interfaces
.implements Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/activity/ComponentActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReportFullyDrawnExecutorApi1"
.end annotation


# instance fields
.field final mHandler:Landroid/os/Handler;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1147
    invoke-direct {p0}, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi1;->createHandler()Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi1;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method private createHandler()Landroid/os/Handler;
    .locals 3

    .line 1165
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    .line 1166
    .local v0, "looper":Landroid/os/Looper;
    new-instance v1, Landroid/os/Handler;

    if-nez v0, :cond_0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    goto :goto_0

    :cond_0
    move-object v2, v0

    :goto_0
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-object v1
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .line 1160
    iget-object v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi1;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    .line 1161
    return-void
.end method

.method public viewCreated(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .line 1151
    return-void
.end method
