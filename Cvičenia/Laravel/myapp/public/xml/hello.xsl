<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
    <xsl:output
            method="html"
            encoding="UTF-8"
            indent="yes"
    />
	
    <xsl:template match="/">
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
         
        <html>
            <head>
                <title>World of Health</title>
                <style>
                    th { background-color: #AAAAAA; }
                    tr.even td { background-color: #DDDDDD; }
                </style>
            </head>
            <body>
				
                <h2>Table of Departments</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Order Number</th>
                            <th>Department ID</th>
                            <th>Department Name</th>
                            <th>Head Name</th>
                            <th>Room references</th>
                            <th>Features</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:apply-templates select="world-of-health/departments/department"/>
                    </tbody>
                </table>

                <h2>List of Rooms</h2>
                <ol>
                    <xsl:apply-templates select="world-of-health/rooms"/>
                </ol>
                
            </body>
        </html>
    </xsl:template>
	
    <xsl:template match="departments/department">
        <xsl:param name="dep" select="@idDepartment"></xsl:param>
        <xsl:element name="tr">

        <xsl:if test="(position() mod 2) != 1">
            <xsl:attribute name="class">even</xsl:attribute>
        </xsl:if>
            <td><xsl:number /></td>
            <td>
                <xsl:apply-templates select="@idDepartment"/>
            </td>
            <td>
                <xsl:apply-templates select="name"/>
            </td>
            <td>
                <xsl:call-template name="headname">
                    <xsl:with-param name="head" select="@head"></xsl:with-param>
                </xsl:call-template>
            </td>
            <td>
                <ul>
                    <xsl:apply-templates select="//room[@department= $dep]" mode="refs"/>
                </ul>
            </td>
            <td>
                <xsl:for-each select="features/feature">
                    <xsl:sort select="."></xsl:sort>
                    <xsl:element name="span">
                        <xsl:choose>
                            <xsl:when test="(contains(@type,'t1')) and (not(contains(@type,' ')))">
                                <xsl:attribute name="style">color: blue;</xsl:attribute>                                    
                            </xsl:when>
                            <xsl:when test="(contains(@type,'t2'))">
                                <xsl:attribute name="style">color: red;</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:value-of select="."></xsl:value-of>
                    </xsl:element>
                    <xsl:text>,</xsl:text>
                </xsl:for-each>
                
            </td>

        </xsl:element>
    </xsl:template>

    <xsl:template match="rooms/room">
        <xsl:element name="li">
            <xsl:attribute name="id">
                <xsl:value-of select="concat('room-', @idRoom)"/>
            </xsl:attribute>
            <xsl:text>Room </xsl:text>
            <xsl:value-of select="@idRoom"/>
            <xsl:text>: </xsl:text>
            <xsl:value-of select="name"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="rooms/room" mode="refs">
        <xsl:element name="li">
            <xsl:element name="a">
                <xsl:attribute name="href"><xsl:value-of select="concat('room-', @idRoom)"/></xsl:attribute>
                <xsl:value-of select="name"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>

    <xsl:template name="headname">
        <xsl:param name = "head" />
        <xsl:choose>
            <xsl:when test="not($head)">
                <xsl:element name="i">Neznámy</xsl:element>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="//head[@idHead = $head]/name"></xsl:value-of>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>