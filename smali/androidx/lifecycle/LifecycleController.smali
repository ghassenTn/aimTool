.class public final Landroidx/lifecycle/LifecycleController;
.super Ljava/lang/Object;
.source "LifecycleController.kt"


# annotations
.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nLifecycleController.kt\nKotlin\n*S Kotlin\n*F\n+ 1 LifecycleController.kt\nandroidx/lifecycle/LifecycleController\n*L\n1#1,70:1\n57#1,3:71\n57#1,3:74\n*S KotlinDebug\n*F\n+ 1 LifecycleController.kt\nandroidx/lifecycle/LifecycleController\n*L\n49#1:71,3\n36#1:74,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008\u0001\u0018\u00002\u00020\u0001B%\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0002\u0010\nJ\u0008\u0010\r\u001a\u00020\u000eH\u0007J\u0011\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0008\u001a\u00020\tH\u0082\u0008R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0010"
    }
    d2 = {
        "Landroidx/lifecycle/LifecycleController;",
        "",
        "lifecycle",
        "Landroidx/lifecycle/Lifecycle;",
        "minState",
        "Landroidx/lifecycle/Lifecycle$State;",
        "dispatchQueue",
        "Landroidx/lifecycle/DispatchQueue;",
        "parentJob",
        "Lkotlinx/coroutines/Job;",
        "(Landroidx/lifecycle/Lifecycle;Landroidx/lifecycle/Lifecycle$State;Landroidx/lifecycle/DispatchQueue;Lkotlinx/coroutines/Job;)V",
        "observer",
        "Landroidx/lifecycle/LifecycleEventObserver;",
        "finish",
        "",
        "handleDestroy",
        "lifecycle-common"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final dispatchQueue:Landroidx/lifecycle/DispatchQueue;

.field private final lifecycle:Landroidx/lifecycle/Lifecycle;

.field private final minState:Landroidx/lifecycle/Lifecycle$State;

.field private final observer:Landroidx/lifecycle/LifecycleEventObserver;


# direct methods
.method public static synthetic $r8$lambda$oWRpCg8vH8nSBgktHTqCr-ANl8M(Landroidx/lifecycle/LifecycleController;Lkotlinx/coroutines/Job;Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 0

    invoke-static {p0, p1, p2, p3}, Landroidx/lifecycle/LifecycleController;->observer$lambda$0(Landroidx/lifecycle/LifecycleController;Lkotlinx/coroutines/Job;Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V

    return-void
.end method

.method public constructor <init>(Landroidx/lifecycle/Lifecycle;Landroidx/lifecycle/Lifecycle$State;Landroidx/lifecycle/DispatchQueue;Lkotlinx/coroutines/Job;)V
    .locals 4
    .param p1, "lifecycle"    # Landroidx/lifecycle/Lifecycle;
    .param p2, "minState"    # Landroidx/lifecycle/Lifecycle$State;
    .param p3, "dispatchQueue"    # Landroidx/lifecycle/DispatchQueue;
    .param p4, "parentJob"    # Lkotlinx/coroutines/Job;

    const-string v0, "lifecycle"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "minState"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "dispatchQueue"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "parentJob"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Landroidx/lifecycle/LifecycleController;->lifecycle:Landroidx/lifecycle/Lifecycle;

    .line 28
    iput-object p2, p0, Landroidx/lifecycle/LifecycleController;->minState:Landroidx/lifecycle/Lifecycle$State;

    .line 29
    iput-object p3, p0, Landroidx/lifecycle/LifecycleController;->dispatchQueue:Landroidx/lifecycle/DispatchQueue;

    .line 32
    new-instance v0, Landroidx/lifecycle/LifecycleController$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p4}, Landroidx/lifecycle/LifecycleController$$ExternalSyntheticLambda0;-><init>(Landroidx/lifecycle/LifecycleController;Lkotlinx/coroutines/Job;)V

    iput-object v0, p0, Landroidx/lifecycle/LifecycleController;->observer:Landroidx/lifecycle/LifecycleEventObserver;

    .line 44
    nop

    .line 48
    iget-object v0, p0, Landroidx/lifecycle/LifecycleController;->lifecycle:Landroidx/lifecycle/Lifecycle;

    invoke-virtual {v0}, Landroidx/lifecycle/Lifecycle;->getCurrentState()Landroidx/lifecycle/Lifecycle$State;

    move-result-object v0

    sget-object v1, Landroidx/lifecycle/Lifecycle$State;->DESTROYED:Landroidx/lifecycle/Lifecycle$State;

    if-ne v0, v1, :cond_0

    .line 49
    move-object v0, p0

    .local v0, "this_$iv":Landroidx/lifecycle/LifecycleController;
    const/4 v1, 0x0

    .line 71
    .local v1, "$i$f$handleDestroy":I
    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {p4, v3, v2, v3}, Lkotlinx/coroutines/Job$DefaultImpls;->cancel$default(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 72
    invoke-virtual {v0}, Landroidx/lifecycle/LifecycleController;->finish()V

    .line 73
    nop

    .end local v0    # "this_$iv":Landroidx/lifecycle/LifecycleController;
    .end local v1    # "$i$f$handleDestroy":I
    goto :goto_0

    .line 51
    :cond_0
    iget-object v0, p0, Landroidx/lifecycle/LifecycleController;->lifecycle:Landroidx/lifecycle/Lifecycle;

    iget-object v1, p0, Landroidx/lifecycle/LifecycleController;->observer:Landroidx/lifecycle/LifecycleEventObserver;

    check-cast v1, Landroidx/lifecycle/LifecycleObserver;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/Lifecycle;->addObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 53
    :goto_0
    nop

    .line 26
    return-void
.end method

.method private final handleDestroy(Lkotlinx/coroutines/Job;)V
    .locals 3
    .param p1, "parentJob"    # Lkotlinx/coroutines/Job;

    const/4 v0, 0x0

    .line 57
    .local v0, "$i$f$handleDestroy":I
    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {p1, v1, v2, v1}, Lkotlinx/coroutines/Job$DefaultImpls;->cancel$default(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 58
    invoke-virtual {p0}, Landroidx/lifecycle/LifecycleController;->finish()V

    .line 59
    return-void
.end method

.method private static final observer$lambda$0(Landroidx/lifecycle/LifecycleController;Lkotlinx/coroutines/Job;Landroidx/lifecycle/LifecycleOwner;Landroidx/lifecycle/Lifecycle$Event;)V
    .locals 3
    .param p0, "this$0"    # Landroidx/lifecycle/LifecycleController;
    .param p1, "$parentJob"    # Lkotlinx/coroutines/Job;
    .param p2, "source"    # Landroidx/lifecycle/LifecycleOwner;

    const-string v0, "this$0"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "$parentJob"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "source"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "<anonymous parameter 1>"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    invoke-interface {p2}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object p3

    invoke-virtual {p3}, Landroidx/lifecycle/Lifecycle;->getCurrentState()Landroidx/lifecycle/Lifecycle$State;

    move-result-object p3

    sget-object v0, Landroidx/lifecycle/Lifecycle$State;->DESTROYED:Landroidx/lifecycle/Lifecycle$State;

    if-ne p3, v0, :cond_0

    .line 36
    move-object p3, p0

    .local p3, "this_$iv":Landroidx/lifecycle/LifecycleController;
    const/4 v0, 0x0

    .line 74
    .local v0, "$i$f$handleDestroy":I
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {p1, v2, v1, v2}, Lkotlinx/coroutines/Job$DefaultImpls;->cancel$default(Lkotlinx/coroutines/Job;Ljava/util/concurrent/CancellationException;ILjava/lang/Object;)V

    .line 75
    invoke-virtual {p3}, Landroidx/lifecycle/LifecycleController;->finish()V

    .line 76
    nop

    .end local v0    # "$i$f$handleDestroy":I
    .end local p3    # "this_$iv":Landroidx/lifecycle/LifecycleController;
    goto :goto_0

    .line 37
    :cond_0
    invoke-interface {p2}, Landroidx/lifecycle/LifecycleOwner;->getLifecycle()Landroidx/lifecycle/Lifecycle;

    move-result-object p3

    invoke-virtual {p3}, Landroidx/lifecycle/Lifecycle;->getCurrentState()Landroidx/lifecycle/Lifecycle$State;

    move-result-object p3

    iget-object v0, p0, Landroidx/lifecycle/LifecycleController;->minState:Landroidx/lifecycle/Lifecycle$State;

    check-cast v0, Ljava/lang/Enum;

    invoke-virtual {p3, v0}, Landroidx/lifecycle/Lifecycle$State;->compareTo(Ljava/lang/Enum;)I

    move-result p3

    if-gez p3, :cond_1

    .line 38
    iget-object p3, p0, Landroidx/lifecycle/LifecycleController;->dispatchQueue:Landroidx/lifecycle/DispatchQueue;

    invoke-virtual {p3}, Landroidx/lifecycle/DispatchQueue;->pause()V

    goto :goto_0

    .line 40
    :cond_1
    iget-object p3, p0, Landroidx/lifecycle/LifecycleController;->dispatchQueue:Landroidx/lifecycle/DispatchQueue;

    invoke-virtual {p3}, Landroidx/lifecycle/DispatchQueue;->resume()V

    .line 42
    :goto_0
    return-void
.end method


# virtual methods
.method public final finish()V
    .locals 2

    .line 67
    iget-object v0, p0, Landroidx/lifecycle/LifecycleController;->lifecycle:Landroidx/lifecycle/Lifecycle;

    iget-object v1, p0, Landroidx/lifecycle/LifecycleController;->observer:Landroidx/lifecycle/LifecycleEventObserver;

    check-cast v1, Landroidx/lifecycle/LifecycleObserver;

    invoke-virtual {v0, v1}, Landroidx/lifecycle/Lifecycle;->removeObserver(Landroidx/lifecycle/LifecycleObserver;)V

    .line 68
    iget-object v0, p0, Landroidx/lifecycle/LifecycleController;->dispatchQueue:Landroidx/lifecycle/DispatchQueue;

    invoke-virtual {v0}, Landroidx/lifecycle/DispatchQueue;->finish()V

    .line 69
    return-void
.end method
