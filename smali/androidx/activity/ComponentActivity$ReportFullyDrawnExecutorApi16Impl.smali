.class Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;
.super Ljava/lang/Object;
.source "ComponentActivity.java"

# interfaces
.implements Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutor;
.implements Landroid/view/ViewTreeObserver$OnDrawListener;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/activity/ComponentActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReportFullyDrawnExecutorApi16Impl"
.end annotation


# instance fields
.field final mEndWatchTimeMillis:J

.field mOnDrawScheduled:Z

.field mRunnable:Ljava/lang/Runnable;

.field final synthetic this$0:Landroidx/activity/ComponentActivity;


# direct methods
.method constructor <init>(Landroidx/activity/ComponentActivity;)V
    .locals 4
    .param p1, "this$0"    # Landroidx/activity/ComponentActivity;

    .line 1171
    iput-object p1, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->this$0:Landroidx/activity/ComponentActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1173
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x2710

    add-long/2addr v0, v2

    iput-wide v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mEndWatchTimeMillis:J

    .line 1175
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mOnDrawScheduled:Z

    return-void
.end method


# virtual methods
.method public execute(Ljava/lang/Runnable;)V
    .locals 3
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .line 1192
    iput-object p1, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mRunnable:Ljava/lang/Runnable;

    .line 1193
    iget-object v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->this$0:Landroidx/activity/ComponentActivity;

    invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 1194
    .local v0, "decorView":Landroid/view/View;
    iget-boolean v1, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mOnDrawScheduled:Z

    if-eqz v1, :cond_1

    .line 1195
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_0

    .line 1196
    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    goto :goto_0

    .line 1198
    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    goto :goto_0

    .line 1203
    :cond_1
    new-instance v1, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl$$ExternalSyntheticLambda0;-><init>(Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    .line 1210
    :goto_0
    return-void
.end method

.method synthetic lambda$execute$0$androidx-activity-ComponentActivity$ReportFullyDrawnExecutorApi16Impl()V
    .locals 1

    .line 1204
    iget-object v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 1205
    iget-object v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mRunnable:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 1206
    const/4 v0, 0x0

    iput-object v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mRunnable:Ljava/lang/Runnable;

    .line 1208
    :cond_0
    return-void
.end method

.method public onDraw()V
    .locals 6

    .line 1214
    iget-object v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mRunnable:Ljava/lang/Runnable;

    .line 1215
    .local v0, "runnable":Ljava/lang/Runnable;
    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1216
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 1217
    const/4 v2, 0x0

    iput-object v2, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mRunnable:Ljava/lang/Runnable;

    .line 1218
    iget-object v2, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->this$0:Landroidx/activity/ComponentActivity;

    iget-object v2, v2, Landroidx/activity/ComponentActivity;->mFullyDrawnReporter:Landroidx/activity/FullyDrawnReporter;

    invoke-virtual {v2}, Landroidx/activity/FullyDrawnReporter;->isFullyDrawnReported()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1219
    iput-boolean v1, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mOnDrawScheduled:Z

    .line 1220
    iget-object v1, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->this$0:Landroidx/activity/ComponentActivity;

    invoke-virtual {v1}, Landroidx/activity/ComponentActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 1222
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mEndWatchTimeMillis:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    .line 1225
    iput-boolean v1, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mOnDrawScheduled:Z

    .line 1226
    iget-object v1, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->this$0:Landroidx/activity/ComponentActivity;

    invoke-virtual {v1}, Landroidx/activity/ComponentActivity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 1228
    :cond_1
    :goto_0
    return-void
.end method

.method public run()V
    .locals 1

    .line 1236
    iget-object v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->this$0:Landroidx/activity/ComponentActivity;

    invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 1237
    return-void
.end method

.method public viewCreated(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .line 1179
    iget-boolean v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mOnDrawScheduled:Z

    if-nez v0, :cond_0

    .line 1180
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/activity/ComponentActivity$ReportFullyDrawnExecutorApi16Impl;->mOnDrawScheduled:Z

    .line 1181
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 1183
    :cond_0
    return-void
.end method
