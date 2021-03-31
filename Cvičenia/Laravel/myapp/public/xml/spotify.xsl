<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>Obvious Spotify Rip-Off</title>
            </head>
            <body>
                <h1>Welcome to Not-Spotify</h1>
                <hr/>

                <h2>Music</h2>
                <hr/>

                <h3>All music artists and their music</h3>
                <table border="1">
                    <thead>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="spotify/music/artists/artist"/>
                    </tbody>
                </table>

                <h2>Podcasts</h2>
                <hr/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="spotify/music/artists/artist">
        <tr bgcolor="#9acd32">
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
        <tr bgcolor="#ff00ff">
            <td colspan="2">
                <xsl:value-of select="name"></xsl:value-of> 
            </td>
            <td>
                <xsl:text>Release date:</xsl:text>
                <xsl:value-of select="release_date"></xsl:value-of>
            </td>
        </tr>
        <xsl:for-each select="songs/song">
            <tr>
                <xsl:choose>
                    <xsl:when test="not(favourite_in_album)">
                        <xsl:apply-templates select="."></xsl:apply-templates> 
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="." mode="best"></xsl:apply-templates> 
                    </xsl:otherwise>
                </xsl:choose>
            </tr>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="song">
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
        <td bgcolor="#fcba03">
            <xsl:value-of select="name"></xsl:value-of>
        </td>
        <td bgcolor="#fcba03">
            <xsl:value-of select="length"></xsl:value-of>
        </td>
        <td bgcolor="#fcba03">
            <xsl:value-of select="@rating"></xsl:value-of>
            <xsl:text>/5</xsl:text>
        </td>
    </xsl:template>
</xsl:stylesheet>