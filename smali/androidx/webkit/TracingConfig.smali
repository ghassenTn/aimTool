.class public Landroidx/webkit/TracingConfig;
.super Ljava/lang/Object;
.source "TracingConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/webkit/TracingConfig$Builder;,
        Landroidx/webkit/TracingConfig$TracingMode;,
        Landroidx/webkit/TracingConfig$PredefinedCategories;
    }
.end annotation


# static fields
.field public static final CATEGORIES_ALL:I = 0x1

.field public static final CATEGORIES_ANDROID_WEBVIEW:I = 0x2

.field public static final CATEGORIES_FRAME_VIEWER:I = 0x40

.field public static final CATEGORIES_INPUT_LATENCY:I = 0x8

.field public static final CATEGORIES_JAVASCRIPT_AND_RENDERING:I = 0x20

.field public static final CATEGORIES_NONE:I = 0x0

.field public static final CATEGORIES_RENDERING:I = 0x10

.field public static final CATEGORIES_WEB_DEVELOPER:I = 0x4

.field public static final RECORD_CONTINUOUSLY:I = 0x1

.field public static final RECORD_UNTIL_FULL:I


# instance fields
.field private final mCustomIncludedCategories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mPredefinedCategories:I

.field private final mTracingMode:I


# direct methods
.method public constructor <init>(ILjava/util/List;I)V
    .locals 1
    .param p1, "predefinedCategories"    # I
    .param p3, "tracingMode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 127
    .local p2, "customIncludedCategories":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 121
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroidx/webkit/TracingConfig;->mCustomIncludedCategories:Ljava/util/List;

    .line 128
    iput p1, p0, Landroidx/webkit/TracingConfig;->mPredefinedCategories:I

    .line 129
    iget-object v0, p0, Landroidx/webkit/TracingConfig;->mCustomIncludedCategories:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 130
    iput p3, p0, Landroidx/webkit/TracingConfig;->mTracingMode:I

    .line 131
    return-void
.end method


# virtual methods
.method public getCustomIncludedCategories()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 150
    iget-object v0, p0, Landroidx/webkit/TracingConfig;->mCustomIncludedCategories:Ljava/util/List;

    return-object v0
.end method

.method public getPredefinedCategories()I
    .locals 1

    .line 140
    iget v0, p0, Landroidx/webkit/TracingConfig;->mPredefinedCategories:I

    return v0
.end method

.method public getTracingMode()I
    .locals 1

    .line 160
    iget v0, p0, Landroidx/webkit/TracingConfig;->mTracingMode:I

    return v0
.end method
