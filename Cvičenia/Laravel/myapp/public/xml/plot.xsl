<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>Grafik</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <!-- import samostatných css pre screen a print-->
            </head>
            <body>
                
                    <h1>Najlepší graf v hre</h1>

                    <xsl:variable name="max" select="20"></xsl:variable>
                    <xsl:variable name="c1">
                        <xsl:choose>
                            <xsl:when test="count(//song[@rating=1]) &gt; $max">
                                <xsl:value-of select="$max" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="count(//song[@rating=1])"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="c2">
                        <xsl:choose>
                            <xsl:when test="count(//song[@rating=2]) &gt; $max">
                                <xsl:value-of select="$max" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="count(//song[@rating=2])"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="c3">
                        <xsl:choose>
                            <xsl:when test="count(//song[@rating=3]) &gt; $max">
                                <xsl:value-of select="$max" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="count(//song[@rating=3])"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="c4">
                        <xsl:choose>
                            <xsl:when test="count(//song[@rating=4]) &gt; $max">
                                <xsl:value-of select="$max" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="count(//song[@rating=4])"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:variable name="c5">
                        <xsl:choose>
                            <xsl:when test="count(//song[@rating=5]) &gt; $max">
                                <xsl:value-of select="$max" />
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="count(//song[@rating=5])"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    
                    <h1><xsl:value-of select="$c1"></xsl:value-of></h1>
                    <h1><xsl:value-of select="$c2"></xsl:value-of></h1>
                    <h1><xsl:value-of select="$c3"></xsl:value-of></h1>
                    <h1><xsl:value-of select="$c4"></xsl:value-of></h1>
                    <h1><xsl:value-of select="$c5"></xsl:value-of></h1>
            </body>
        </html>
    </xsl:template>    

</xsl:stylesheet>