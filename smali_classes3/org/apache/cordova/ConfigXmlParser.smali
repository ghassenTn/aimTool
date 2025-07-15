.class public Lorg/apache/cordova/ConfigXmlParser;
.super Ljava/lang/Object;
.source "ConfigXmlParser.java"


# static fields
.field private static final DEFAULT_CONTENT_SRC:Ljava/lang/String; = "index.html"

.field private static DEFAULT_HOSTNAME:Ljava/lang/String;

.field private static SCHEME_HTTP:Ljava/lang/String;

.field private static SCHEME_HTTPS:Ljava/lang/String;

.field private static TAG:Ljava/lang/String;


# instance fields
.field private contentSrc:Ljava/lang/String;

.field insideFeature:Z

.field private launchUrl:Ljava/lang/String;

.field onload:Z

.field paramType:Ljava/lang/String;

.field pluginClass:Ljava/lang/String;

.field private pluginEntries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation
.end field

.field private prefs:Lorg/apache/cordova/CordovaPreferences;

.field service:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 32
    const-string v0, "ConfigXmlParser"

    sput-object v0, Lorg/apache/cordova/ConfigXmlParser;->TAG:Ljava/lang/String;

    .line 34
    const-string v0, "http"

    sput-object v0, Lorg/apache/cordova/ConfigXmlParser;->SCHEME_HTTP:Ljava/lang/String;

    .line 35
    const-string v0, "https"

    sput-object v0, Lorg/apache/cordova/ConfigXmlParser;->SCHEME_HTTPS:Ljava/lang/String;

    .line 36
    const-string v0, "localhost"

    sput-object v0, Lorg/apache/cordova/ConfigXmlParser;->DEFAULT_HOSTNAME:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Lorg/apache/cordova/CordovaPreferences;

    invoke-direct {v0}, Lorg/apache/cordova/CordovaPreferences;-><init>()V

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->prefs:Lorg/apache/cordova/CordovaPreferences;

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginEntries:Ljava/util/ArrayList;

    .line 91
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/cordova/ConfigXmlParser;->insideFeature:Z

    .line 92
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->service:Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginClass:Ljava/lang/String;

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    .line 93
    iput-boolean v0, p0, Lorg/apache/cordova/ConfigXmlParser;->onload:Z

    return-void
.end method

.method private getLaunchUrlPrefix()Ljava/lang/String;
    .locals 5

    .line 174
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->prefs:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "AndroidInsecureFileModeEnabled"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 175
    const-string v0, "file:///android_asset/www/"

    return-object v0

    .line 177
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->prefs:Lorg/apache/cordova/CordovaPreferences;

    const-string v1, "scheme"

    sget-object v2, Lorg/apache/cordova/ConfigXmlParser;->SCHEME_HTTPS:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    .line 178
    .local v0, "scheme":Ljava/lang/String;
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->prefs:Lorg/apache/cordova/CordovaPreferences;

    const-string v2, "hostname"

    sget-object v3, Lorg/apache/cordova/ConfigXmlParser;->DEFAULT_HOSTNAME:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/apache/cordova/CordovaPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    .line 180
    .local v1, "hostname":Ljava/lang/String;
    sget-object v2, Lorg/apache/cordova/ConfigXmlParser;->SCHEME_HTTP:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    sget-object v2, Lorg/apache/cordova/ConfigXmlParser;->SCHEME_HTTPS:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 181
    sget-object v2, Lorg/apache/cordova/ConfigXmlParser;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "The provided scheme \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\" is not valid. Defaulting to \""

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/apache/cordova/ConfigXmlParser;->SCHEME_HTTPS:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\". (Valid Options="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/apache/cordova/ConfigXmlParser;->SCHEME_HTTP:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lorg/apache/cordova/ConfigXmlParser;->SCHEME_HTTPS:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    sget-object v0, Lorg/apache/cordova/ConfigXmlParser;->SCHEME_HTTPS:Ljava/lang/String;

    .line 188
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "://"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x2f

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private onPostParse()V
    .locals 1

    .line 123
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->contentSrc:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 124
    const-string v0, "index.html"

    iput-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->contentSrc:Ljava/lang/String;

    .line 126
    :cond_0
    return-void
.end method

.method private setStartUrl(Ljava/lang/String;)V
    .locals 5
    .param p1, "src"    # Ljava/lang/String;

    .line 193
    const-string v0, "^[a-z-]+://"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 194
    .local v0, "schemeRegex":Ljava/util/regex/Pattern;
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 196
    .local v1, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 197
    iput-object p1, p0, Lorg/apache/cordova/ConfigXmlParser;->launchUrl:Ljava/lang/String;

    goto :goto_0

    .line 199
    :cond_0
    invoke-direct {p0}, Lorg/apache/cordova/ConfigXmlParser;->getLaunchUrlPrefix()Ljava/lang/String;

    move-result-object v2

    .line 202
    .local v2, "launchUrlPrefix":Ljava/lang/String;
    const/4 v3, 0x0

    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x2f

    if-ne v3, v4, :cond_1

    .line 203
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 206
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lorg/apache/cordova/ConfigXmlParser;->launchUrl:Ljava/lang/String;

    .line 208
    .end local v2    # "launchUrlPrefix":Ljava/lang/String;
    :goto_0
    return-void
.end method


# virtual methods
.method public getLaunchUrl()Ljava/lang/String;
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->launchUrl:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 54
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->contentSrc:Ljava/lang/String;

    invoke-direct {p0, v0}, Lorg/apache/cordova/ConfigXmlParser;->setStartUrl(Ljava/lang/String;)V

    .line 57
    :cond_0
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->launchUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getPluginEntries()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lorg/apache/cordova/PluginEntry;",
            ">;"
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginEntries:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getPreferences()Lorg/apache/cordova/CordovaPreferences;
    .locals 1

    .line 45
    iget-object v0, p0, Lorg/apache/cordova/ConfigXmlParser;->prefs:Lorg/apache/cordova/CordovaPreferences;

    return-object v0
.end method

.method public handleEndTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 6
    .param p1, "xml"    # Lorg/xmlpull/v1/XmlPullParser;

    .line 162
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 163
    .local v0, "strNode":Ljava/lang/String;
    const-string v1, "feature"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 164
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginEntries:Ljava/util/ArrayList;

    new-instance v2, Lorg/apache/cordova/PluginEntry;

    iget-object v3, p0, Lorg/apache/cordova/ConfigXmlParser;->service:Ljava/lang/String;

    iget-object v4, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginClass:Ljava/lang/String;

    iget-boolean v5, p0, Lorg/apache/cordova/ConfigXmlParser;->onload:Z

    invoke-direct {v2, v3, v4, v5}, Lorg/apache/cordova/PluginEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 166
    const-string v1, ""

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->service:Ljava/lang/String;

    .line 167
    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginClass:Ljava/lang/String;

    .line 168
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/apache/cordova/ConfigXmlParser;->insideFeature:Z

    .line 169
    iput-boolean v1, p0, Lorg/apache/cordova/ConfigXmlParser;->onload:Z

    .line 171
    :cond_0
    return-void
.end method

.method public handleStartTag(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 5
    .param p1, "xml"    # Lorg/xmlpull/v1/XmlPullParser;

    .line 129
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "strNode":Ljava/lang/String;
    const-string v1, "feature"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, "name"

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 133
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/apache/cordova/ConfigXmlParser;->insideFeature:Z

    .line 134
    invoke-interface {p1, v3, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->service:Ljava/lang/String;

    goto/16 :goto_1

    .line 136
    :cond_0
    iget-boolean v1, p0, Lorg/apache/cordova/ConfigXmlParser;->insideFeature:Z

    const-string v4, "value"

    if-eqz v1, :cond_4

    const-string v1, "param"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 137
    invoke-interface {p1, v3, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    .line 138
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    const-string v2, "service"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 139
    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->service:Ljava/lang/String;

    goto :goto_1

    .line 140
    :cond_1
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    const-string v2, "package"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    const-string v2, "android-package"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    goto :goto_0

    .line 142
    :cond_2
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->paramType:Ljava/lang/String;

    const-string v2, "onload"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 143
    const-string v1, "true"

    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lorg/apache/cordova/ConfigXmlParser;->onload:Z

    goto :goto_1

    .line 141
    :cond_3
    :goto_0
    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginClass:Ljava/lang/String;

    goto :goto_1

    .line 145
    :cond_4
    const-string v1, "preference"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 146
    invoke-interface {p1, v3, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 147
    .local v1, "name":Ljava/lang/String;
    invoke-interface {p1, v3, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 148
    .local v2, "value":Ljava/lang/String;
    iget-object v3, p0, Lorg/apache/cordova/ConfigXmlParser;->prefs:Lorg/apache/cordova/CordovaPreferences;

    invoke-virtual {v3, v1, v2}, Lorg/apache/cordova/CordovaPreferences;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .end local v1    # "name":Ljava/lang/String;
    .end local v2    # "value":Ljava/lang/String;
    goto :goto_1

    .line 150
    :cond_5
    const-string v1, "content"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 151
    const-string v1, "src"

    invoke-interface {p1, v3, v1}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 152
    .local v1, "src":Ljava/lang/String;
    if-eqz v1, :cond_6

    .line 153
    iput-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->contentSrc:Ljava/lang/String;

    goto :goto_1

    .line 156
    :cond_6
    const-string v2, "index.html"

    iput-object v2, p0, Lorg/apache/cordova/ConfigXmlParser;->contentSrc:Ljava/lang/String;

    .line 159
    .end local v1    # "src":Ljava/lang/String;
    :cond_7
    :goto_1
    return-void
.end method

.method public parse(Landroid/content/Context;)V
    .locals 6
    .param p1, "action"    # Landroid/content/Context;

    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "config"

    const-string v3, "xml"

    invoke-virtual {v0, v2, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 63
    .local v0, "id":I
    if-nez v0, :cond_0

    .line 65
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 66
    if-nez v0, :cond_0

    .line 67
    sget-object v1, Lorg/apache/cordova/ConfigXmlParser;->TAG:Ljava/lang/String;

    const-string v2, "res/xml/config.xml is missing!"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    return-void

    .line 72
    :cond_0
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginEntries:Ljava/util/ArrayList;

    new-instance v2, Lorg/apache/cordova/PluginEntry;

    const-string v3, "CordovaAllowListPlugin"

    const-string v4, "org.apache.cordova.AllowListPlugin"

    const/4 v5, 0x1

    invoke-direct {v2, v3, v4, v5}, Lorg/apache/cordova/PluginEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 80
    iget-object v1, p0, Lorg/apache/cordova/ConfigXmlParser;->pluginEntries:Ljava/util/ArrayList;

    new-instance v2, Lorg/apache/cordova/PluginEntry;

    const-string v3, "CordovaSplashScreenPlugin"

    const-string v4, "org.apache.cordova.SplashScreenPlugin"

    invoke-direct {v2, v3, v4, v5}, Lorg/apache/cordova/PluginEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v1

    invoke-virtual {p0, v1}, Lorg/apache/cordova/ConfigXmlParser;->parse(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 89
    return-void
.end method

.method public parse(Lorg/xmlpull/v1/XmlPullParser;)V
    .locals 2
    .param p1, "xml"    # Lorg/xmlpull/v1/XmlPullParser;

    .line 96
    const/4 v0, -0x1

    .line 98
    .local v0, "eventType":I
    :goto_0
    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    .line 99
    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 100
    invoke-virtual {p0, p1}, Lorg/apache/cordova/ConfigXmlParser;->handleStartTag(Lorg/xmlpull/v1/XmlPullParser;)V

    goto :goto_1

    .line 102
    :cond_0
    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    .line 104
    invoke-virtual {p0, p1}, Lorg/apache/cordova/ConfigXmlParser;->handleEndTag(Lorg/xmlpull/v1/XmlPullParser;)V

    .line 107
    :cond_1
    :goto_1
    :try_start_0
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    .line 112
    :goto_2
    goto :goto_0

    .line 110
    :catch_0
    move-exception v1

    .line 111
    .local v1, "e":Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .end local v1    # "e":Ljava/io/IOException;
    goto :goto_2

    .line 108
    :catch_1
    move-exception v1

    .line 109
    .local v1, "e":Lorg/xmlpull/v1/XmlPullParserException;
    invoke-virtual {v1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    .end local v1    # "e":Lorg/xmlpull/v1/XmlPullParserException;
    goto :goto_2

    .line 115
    :cond_2
    invoke-direct {p0}, Lorg/apache/cordova/ConfigXmlParser;->onPostParse()V

    .line 116
    return-void
.end method
