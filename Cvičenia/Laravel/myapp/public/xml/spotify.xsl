<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>Obvious Spotify Rip-Off</title>
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
                    <xsl:attribute name="class">picked_songs</xsl:attribute>
                    
                    <h3>Best songs</h3>
                    <xsl:element name="table">
                        <xsl:attribute name="border">1</xsl:attribute>
                        <thead>
                            <tr>
                                <xsl:attribute name="class">best</xsl:attribute>
                                <th>Artist</th>
                                <th>Song Name</th>
                                <th>Song Rating</th>
                                <th>Album Name</th>
                                <th>Album Rating</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="/spotify/music/artists/artist/albums/album/songs/song[(@rating &gt; 4) and (ancestor::album/@rating &gt; 4)]"/>
                        </tbody>
                    </xsl:element>
                    
                    <h3>Worst songs</h3>
                    <xsl:element name="table">
                        <xsl:attribute name="border">1</xsl:attribute>
                        <thead>
                            <tr>
                                <xsl:attribute name="class">bad</xsl:attribute>
                                <th>Artist</th>
                                <th>Song Name</th>
                                <th>Song Rating</th>
                                <th>Album Name</th>
                                <th>Album Rating</th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:apply-templates select="/spotify/music/artists/artist/albums/album/songs/song[(@rating &lt; 3) and (ancestor::album/@rating &gt; 3)]"/>
                        </tbody>
                    </xsl:element>
                </div>

                <div class="all_songs">
                    <h3>All music artists and their music</h3>
                    <table border="1">
                        <thead>
                        </thead>
                        <tbody>
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
                <xsl:apply-templates select="/spotify/other_content/podcasts/podcast[@subgenre_ID='p_1']"></xsl:apply-templates>
                <hr/>
                <h4>Slovak podcasts:</h4>
                <div class="sk_pods">
                    <xsl:apply-templates select="/spotify/other_content/podcasts/podcast[language='Slovak']"></xsl:apply-templates>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="spotify/music/artists/artist">
        <tr>
            <xsl:attribute name="class">header</xsl:attribute>
            <td>
                <xsl:value-of select="name"></xsl:value-of>
            </td>
            <td>
                <xsl:text> Debuted in year </xsl:text>
                <xsl:value-of select="career_start"></xsl:value-of>
            </td>
            <td>
                <xsl:text> Followers: </xsl:text>
                <xsl:value-of select="followers"></xsl:value-of>
            </td>
        </tr>
        <xsl:apply-templates select="albums/album"></xsl:apply-templates>
    </xsl:template>

    <xsl:template match="albums/album">
        <tr>
            <xsl:attribute name="class">album</xsl:attribute>
            <td colspan="2">
                <xsl:value-of select="name"></xsl:value-of> 
            </td>
            <td>
                <xsl:text>Release date: </xsl:text>
                <xsl:value-of select="release_date"></xsl:value-of>
            </td>
        </tr>
        <xsl:for-each select="songs/song">
            <tr>
                <xsl:choose>
                    <xsl:when test="not(favourite_in_album)">
                        <xsl:apply-templates select="." mode="normal"></xsl:apply-templates> 
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="." mode="best"></xsl:apply-templates> 
                    </xsl:otherwise>
                </xsl:choose>
            </tr>
        </xsl:for-each>
    </xsl:template>

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

    <xsl:template match="song" mode="pick">
        <xsl:param name="alb_nm"></xsl:param>
        <xsl:param name="alb_rtg"></xsl:param>
        <xsl:param name="artist"></xsl:param>
        <td>
            <xsl:copy-of select="$artist"></xsl:copy-of>
        </td>
        <td>
            <xsl:value-of select="name"></xsl:value-of>
        </td>
        <td>
            <xsl:value-of select="@rating"></xsl:value-of>
            <xsl:text>/5</xsl:text>
        </td>
        <td>
            <xsl:value-of select="$alb_nm"></xsl:value-of>
        </td>
        <td>
            <xsl:value-of select="$alb_rtg"></xsl:value-of>
            <xsl:text>/5</xsl:text>
        </td>
    </xsl:template>

    <xsl:template match="/spotify/other_content/podcasts/podcast[@subgenre_ID='p_1']">
        <div>
            <xsl:attribute name="class">spooky</xsl:attribute>
            <h5><xsl:value-of select="name"></xsl:value-of> by <xsl:value-of select="author"></xsl:value-of></h5>
            <p><xsl:value-of select="description"></xsl:value-of></p>
            <table border="1">
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
        </div>
    </xsl:template>

    <xsl:template name="episodetemp">
        <xsl:variable name="no_gst" select="'No guests'"></xsl:variable>
        <tr>
            <td><xsl:value-of select="episode_num"></xsl:value-of></td>
            <td><xsl:value-of select="name"></xsl:value-of></td>
            <td><xsl:value-of select="release_date"></xsl:value-of></td>
            <td><xsl:value-of select="length"></xsl:value-of></td>
            <td>
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
                <xsl:if test="@rating=5">
                    <xsl:attribute name="class">best</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="@rating"></xsl:value-of>
                <xsl:text>/5</xsl:text>
            </td>
        </tr>
    </xsl:template>

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

    <xsl:template match="/spotify/other_content/podcasts/podcast[language='Slovak']">
        <h5><xsl:value-of select="name"></xsl:value-of></h5>
        <p>
            <xsl:copy>
                <xsl:apply-templates select="description"></xsl:apply-templates>
            </xsl:copy>
        </p>

        <table border="1">
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
</xsl:stylesheet>