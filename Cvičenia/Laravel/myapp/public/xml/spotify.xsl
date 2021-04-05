<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>Obvious Spotify Rip-Off</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <!-- import samostatných css pre screen a print-->
                <link rel="stylesheet" type="text/css" href="/css/print.css" media="print"/>
                <link rel="stylesheet" type="text/css" href="/css/web.css" media="screen"/>
            </head>
            <body>
                <div class="title">
                    <h1>Welcome to Not-Spotify</h1>
                </div>
                

                <div class="sub_title">
                    <hr />
                    <h2>Music</h2>
                    <hr />
                </div>
                
                
                <div>
                    <!-- pridanie atribútu class pre daný div s hodnotou "picked_songs"-->
                    <xsl:attribute name="class">picked_songs</xsl:attribute>
                    
                    <!-- výpis "najlepších" songov, sú to songy, ktoré majú rating väčší ako 4 a sú z albumu s ratingom väčším ako 4-->
                    <h3>Best songs</h3>
                    <!-- vytvorenie tabuľky cez xsl:element-->
                    <xsl:element name="table">
                        <!-- nastavenie atribútu border s hodnotou 1 pre danú tabuľku-->
                        <xsl:attribute name="border">1</xsl:attribute>
                        <!-- vytvorenie headeru pre danú tabuľku-->
                        <thead>
                            <tr>
                                <xsl:attribute name="class">best</xsl:attribute>
                                <th>Artist</th>
                                <th>Song Name</th>
                                <!-- niektoré stĺpce majú class "rtg", tieto stĺpce sa pri responzivite nezobrazujú na najmenších zariadeniach-->
                                <th class="rtg">Song Rating</th>
                                <th>Album Name</th>
                                <th class="rtg">Album Rating</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- pre každú pesníčku, ktorá spĺňa kritéria je pomocou templatu vytvorený riadok v tabuľke-->
                            <xsl:apply-templates select="/spotify/music/artists/artist/albums/album/songs/song[(@rating &gt; 4) and (ancestor::album/@rating &gt; 4)]"/>
                        </tbody>
                    </xsl:element>
                    
                    <!-- zobrazenie najhorších pesníčiek, podobný princíp ako predošlé najlepšie pesníčky len iný template-->
                    <h3>Worst songs</h3>
                    <xsl:element name="table">
                        <xsl:attribute name="border">1</xsl:attribute>
                        <thead>
                            <tr>
                                <xsl:attribute name="class">bad</xsl:attribute>
                                <th>Artist</th>
                                <th>Song Name</th>
                                <th class="rtg">Song Rating</th>
                                <th>Album Name</th>
                                <th class="rtg">Album Rating</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="/spotify/music/artists/artist/albums/album/songs/song[(@rating &lt; 3) and (ancestor::album/@rating &gt; 3)]"/>
                        </tbody>
                    </xsl:element>
                </div>

                <!-- Jednoduché zobrazenie všetký pesníčiek do veľkej tabuľky-->
                <div class="all_songs">
                    <h3>All music artists and their music</h3>
                    <table border="1">
                        <thead>
                        </thead>
                        <tbody>
                            <!-- template vždy spracuje jedného umelca a vytvorí záznamy preňho-->
                            <xsl:apply-templates select="spotify/music/artists/artist"/>
                        </tbody>
                    </table>
                </div>
                
                <div class="sub_title">
                    <hr />
                    <h2>Podcasts</h2>
                    <hr />
                </div>

                <h4>Spooky podcasts:</h4>
                <!-- template vypíše všetky podcasty, ktoré sú z kategórie horror, viac detailov nižšie v samotnom template-->
                <xsl:apply-templates select="/spotify/other_content/podcasts/podcast[@subgenre_ID='p_1']"></xsl:apply-templates>
                <hr/>
                <!-- výpis všetkých podcastov, ktoré sú po slovensky-->
                <h4>Slovak podcasts:</h4>
                <div class="sk_pods">
                    <xsl:apply-templates select="/spotify/other_content/podcasts/podcast[language='Slovak']"></xsl:apply-templates>
                </div>

                <!-- ozdobný footer-->
                <footer>
                    <div></div>
                </footer>
            </body>
        </html>
    </xsl:template>

    <!-- template, použitý pri na výpis každého elementu artist, podľa ďalej uvedených pravidiel-->
    <xsl:template match="spotify/music/artists/artist">
        <!-- údaje sú reprezentované tabuľkou, takže sa údaje reprezentujú s pomocou td elementov-->
        <tr>
            <xsl:attribute name="class">header</xsl:attribute>
            <!-- 
                následujúce tri informácie sú z xml získané jednoducho, keďže sa tento template už v rámci xml nachádza v elemente artist
                a dané informácie sú jeho priami potomkovia, tak stačilo cez xml:value-of vytiahnuť ich hodnotu priamo cez ich meno
            -->
            <td>
                <!-- meno daného umelca-->
                <xsl:value-of select="name"></xsl:value-of>
            </td>
            <td>
                <!-- rok kedy im začala kariéra-->
                <xsl:text> Debuted in year </xsl:text>
                <xsl:value-of select="career_start"></xsl:value-of>
            </td>
            <td>
                <!-- počet followerov-->
                <xsl:text> Followers: </xsl:text>
                <xsl:value-of select="followers"></xsl:value-of>
            </td>
        </tr>
        <!-- 
            volanie templatu na vypísanie všetkých albumov, ktoré daný umelec má v xml súbore zapísané, albumy sú 
            uložené ako potomkovia elementu albums, ktorý je potomkom artist
        -->
        <xsl:apply-templates select="albums/album"></xsl:apply-templates>
    </xsl:template>

    <xsl:template match="albums/album">
        <!-- 
            podobne ako pri artist aj album má ako priamych potomkov elementy obsahujúce informácie o ňom, preto
            bolo ich transformovanie pomocou xsl:value-of priamočiare, stačilo ako select dať názov príslušných
            elementov
        -->
        <tr>
            <xsl:attribute name="class">album</xsl:attribute>
            <td colspan="2">
                <!-- názov albumu-->
                <xsl:value-of select="name"></xsl:value-of> 
            </td>
            <td>
                <!-- dátum vydania albumu-->
                <xsl:text>Release date: </xsl:text>
                <xsl:value-of select="release_date"></xsl:value-of>
            </td>
        </tr>
        <!-- 
            Pomocou foreach cyklusu som vypísal všetky pesníčky patriace danému albumu. Pesníčky sú vždy samostatný element.
            Element song, je priamym potomkom elementu songs a ten je priamym potomkom elementu album. Nepoužil som
            iba volanie templatu na songs/song, kvôli tomu, že som použil rozne templaty na vypísanie songu, podľa toho, či ide o
            favourite in album alebo nie. Toto sa overuje pomocou xsl:choose a následne sa cez xsl:when a otherwise aplikujú správne
            templates. Template sa určí pomocou mode.
        -->
        <xsl:for-each select="songs/song">
            <tr>
                <xsl:choose>
                    <!-- test na to, či daný element song obsahuje element favourite_in_album-->
                    <xsl:when test="not(favourite_in_album)">
                        <!-- 
                            template sa volá so selectom "." keďže sme sa už pomocou foreach cyklu nastavili
                            na element song
                        -->
                        <xsl:apply-templates select="." mode="normal"></xsl:apply-templates> 
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="." mode="best"></xsl:apply-templates> 
                    </xsl:otherwise>
                </xsl:choose>
            </tr>
        </xsl:for-each>
    </xsl:template>

    <!-- 
        základný template songu, všetky údaje sú priamy potomok elementu song, takže ich hodnoty získavam
        cez xsl:value-of
    -->
    <xsl:template match="song" mode="normal">
        <td>
            <xsl:value-of select="name"></xsl:value-of>
        </td>
        <td>
            <xsl:value-of select="length"></xsl:value-of>
        </td>
        <td>
            <xsl:value-of select="@rating"></xsl:value-of>
            <xsl:text>/5</xsl:text>
        </td>
    </xsl:template>

    <!-- jediný rozdiel oproti mode normal je, že daný riadok je farebne odlíšený pomocou css-->
    <xsl:template match="song" mode="best">
        <td>
            <xsl:attribute name="class">best</xsl:attribute>
            <xsl:value-of select="name"></xsl:value-of>
        </td>
        <td>
            <xsl:attribute name="class">best</xsl:attribute>
            <xsl:value-of select="length"></xsl:value-of>
        </td>
        <td>
            <xsl:attribute name="class">best</xsl:attribute>
            <xsl:value-of select="@rating"></xsl:value-of>
            <xsl:text>/5</xsl:text>
        </td>
    </xsl:template>

    <!-- 
        Template na vypísanie songu, ktorý sa používa pri vybraných pesníčkach (best a worst).
        Keďže som chcel vypísať aj údaje o albume a umelcovi, spojených s danou pesníčkou,
        tak som si tieto údaje pri volaní tohto templatu vniesol ako parametre.
    -->
    <xsl:template match="song" mode="pick">
        <!-- hodnoty vnesené do tamplatu ako parametre-->
        <xsl:param name="alb_nm"></xsl:param>
        <xsl:param name="alb_rtg"></xsl:param>
        <xsl:param name="artist"></xsl:param>
        <td>
            <xsl:copy-of select="$artist"></xsl:copy-of>
        </td>
        <td>
            <xsl:value-of select="name"></xsl:value-of>
        </td>
        <td class="rtg">
            <xsl:value-of select="@rating"></xsl:value-of>
            <xsl:text>/5</xsl:text>
        </td>
        <td>
            <xsl:value-of select="$alb_nm"></xsl:value-of>
        </td>
        <td class="rtg">
            <xsl:value-of select="$alb_rtg"></xsl:value-of>
            <xsl:text>/5</xsl:text>
        </td>
    </xsl:template>

    <!-- template používaný na výpis horrorových podcastov-->
    <xsl:template match="/spotify/other_content/podcasts/podcast[@subgenre_ID='p_1']">
        <div>
            <xsl:attribute name="class">spooky</xsl:attribute>
            <!-- výpis informácií o podcaste-->
            <h5><xsl:value-of select="name"></xsl:value-of> by <xsl:value-of select="author"></xsl:value-of></h5>
            <p><xsl:value-of select="description"></xsl:value-of></p>
            <!-- tabuľka na na výpis jednotlivých epizód a informácií o nich-->
            <table border="1" class="ep_table">
                <thead>
                    <tr class="header">
                        <th>Episode number</th>
                        <th>Episode name</th>
                        <th>Release date</th>
                        <th>Runtime</th>
                        <th>Guests</th>
                        <th>Rating</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- volanie templatu, ktorý vypíše jednotlivé epizódy pomocou foreach cyklu-->
                    <xsl:for-each select="episodes/episode">
                        <xsl:call-template name="episodetemp"></xsl:call-template>
                    </xsl:for-each>
                </tbody>
            </table>
        </div>
    </xsl:template>

    <!-- template na výpis slovenských podcastov, funguje na rovnakom princípe ako horrorové, len je iný match, kvôli odlišnej podmienke-->
    <xsl:template match="/spotify/other_content/podcasts/podcast[language='Slovak']">
        <h5><xsl:value-of select="name"></xsl:value-of></h5>
        <p>
            <xsl:copy>
                <xsl:apply-templates select="description"></xsl:apply-templates>
            </xsl:copy>
        </p>

        <table border="1" class="ep_table">
            <thead>
                <tr class="header">
                    <th>Episode number</th>
                    <th>Episode name</th>
                    <th>Release date</th>
                    <th>Runtime</th>
                    <th>Guests</th>
                    <th>Rating</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="episodes/episode">
                    <xsl:call-template name="episodetemp"></xsl:call-template>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>

    <!-- template na vypísanie jednej konkrétnej epizódy-->
    <xsl:template name="episodetemp">
        <!-- premenná, ktorá sa vypíše ak epizóda nemá žiadnych hostí-->
        <xsl:variable name="no_gst" select="'No guests'"></xsl:variable>
        <tr>
            <!-- výpis základných informácií o epizóde, ktoré sú potomkami elementu episode-->
            <td><xsl:value-of select="episode_num"></xsl:value-of></td>
            <td><xsl:value-of select="name"></xsl:value-of></td>
            <td><xsl:value-of select="release_date"></xsl:value-of></td>
            <td><xsl:value-of select="length"></xsl:value-of></td>
            <td>
                <!-- podmienka na zistenie, či epizóda obsahuje hostí alebo nie. Hostia sú reprezentovaný ako element guest.-->
                <xsl:choose>
                    <xsl:when test="descendant::guest">
                        <xsl:for-each select="descendant::guest">
                            <xsl:value-of select="."></xsl:value-of>
                            <xsl:text>, </xsl:text>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$no_gst"></xsl:value-of>
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <!-- 
                    podmienka overujúca, či má epizóda rating rovný 5, ak má tak sa vykoná to, čo je v xsl:if,
                    čiže sa pridá danému td class, ktorý je neskôr použitý na jeho zafarbenie pomocou css
                -->
                <xsl:if test="@rating=5">
                    <xsl:attribute name="class">best</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@rating"></xsl:value-of>
                <xsl:text>/5</xsl:text>
            </td>
        </tr>
    </xsl:template>

    <!-- 
        Následné dva tamplaty sa volajú na vypísanie vybraných pesníčiek (best a worst). Vnútri sa volajú templaty na song, s modom
        pick. Tento template používa niekoľko parametrov, ktoré sa do daného templatu posielajú pomocou xsl:with-param.
     -->
    <xsl:template match="/spotify/music/artists/artist/albums/album/songs/song[(@rating &lt; 3) and (ancestor::album/@rating &gt; 3)]">
        <tr>
            <xsl:apply-templates select="." mode="pick">
                <xsl:with-param name="alb_nm" select="ancestor::album/name"></xsl:with-param>
                <xsl:with-param name="alb_rtg" select="ancestor::album/@rating"></xsl:with-param>
                <xsl:with-param name="artist" select="ancestor::artist/name"></xsl:with-param>
            </xsl:apply-templates>
        </tr>
    </xsl:template>

    <xsl:template match="/spotify/music/artists/artist/albums/album/songs/song[(@rating &gt; 4) and (ancestor::album/@rating &gt; 4)]">
        <tr>
            <xsl:apply-templates select="." mode="pick">
                <xsl:with-param name="alb_nm" select="ancestor::album/name"></xsl:with-param>
                <xsl:with-param name="alb_rtg" select="ancestor::album/@rating"></xsl:with-param>
                <xsl:with-param name="artist" select="ancestor::artist/name"></xsl:with-param>
            </xsl:apply-templates>
        </tr>
    </xsl:template>

</xsl:stylesheet>