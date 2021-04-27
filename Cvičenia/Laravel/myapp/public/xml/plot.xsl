<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>Grafik</title>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            </head>
            <body>
                
                    <h1>Najlepší graf v hre</h1>
                    <!-- premenná, ktorá určuje maximálny počet pesníčiek zobrazených grafom-->
                    <xsl:variable name="max" select="20"></xsl:variable>

                    <!-- 
                        Načítanie jednotlivých počtov pesníčiek podľa kategórie. Každá premenná
                        c1 až c5 predstavuje počet pesníčiek daného hodnotenia. Do premennej sa
                        podľa podmienky načíta počet pesníčiek pomocou count funkcie alebo ak je
                        tento počet väčší než povolené maximum uložené v premennej $max, tak sa 
                        načíta maximum.
                    -->

                    <!-- Načítanie počtu pesníčiek s hodnotením 1-->
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
                    
                    <!-- Načítanie počtu pesníčiek s hodnotením 2-->
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
                    
                    <!-- Načítanie počtu pesníčiek s hodnotením 3-->
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
                    
                    <!-- Načítanie počtu pesníčiek s hodnotením 4-->
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
                    
                    <!-- Načítanie počtu pesníčiek s hodnotením 5-->
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

                    <!-- Samotné svg na vykreslenie grafu-->
                    <svg
                        viewBox="0 0 1300 1300"
                        role="img"
                        version="1.1"
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                    >   

                        <!-- Popisy grafu-->
                        <title id="title">Stĺpcový graf hodnotenia všetkých pesníčiek</title>
                        <desc id="desc">Hodnotenie všetkých pesníčiek v rozmedzí od 1 do 5</desc>

                        <!-- Wrapper na celý graf-->
                        <g stroke="#777" stroke-width="1" font-size="15" font-family="Arial">
                            <!-- Ypsilon wrapper, ktorý má nastavený okraj 100 pomocou translatu-->
                            <g transform="translate(100,100)">
                                
                                <!-- Y-ová os-->
                                <line x1="0" x2="0" y1="0" y2="1100"></line>

                                <!-- Y ticky, dĺžka 9. Záporné číslo je použité kvôli translatu-->
                                <line x1="-9" x2="0" y1="100" y2="100"></line>
                                <line x1="-9" x2="0" y1="200" y2="200"></line>
                                <line x1="-9" x2="0" y1="300" y2="300"></line>
                                <line x1="-9" x2="0" y1="400" y2="400"></line>
                                <line x1="-9" x2="0" y1="500" y2="500"></line>
                                <line x1="-9" x2="0" y1="600" y2="600"></line>
                                <line x1="-9" x2="0" y1="700" y2="700"></line>
                                <line x1="-9" x2="0" y1="800" y2="800"></line>
                                <line x1="-9" x2="0" y1="900" y2="900"></line>
                                <line x1="-9" x2="0" y1="1000" y2="1000"></line>

                                <!-- 
                                    Vodiace čiary pre ypsilonovú os. Sú formou striedania bodky a čiarky
                                    aby boli prehľadnejšie. Farba je šedá.
                                -->
                                <g stroke="#ccc" stroke-dasharray="10 3 3 3">    
                                    <line x1="0" x2="1100" y1="100" y2="100"></line>
                                    <line x1="0" x2="1100" y1="200" y2="200"></line>
                                    <line x1="0" x2="1100" y1="300" y2="300"></line>
                                    <line x1="0" x2="1100" y1="400" y2="400"></line>
                                    <line x1="0" x2="1100" y1="500" y2="500"></line>
                                    <line x1="0" x2="1100" y1="600" y2="600"></line>
                                    <line x1="0" x2="1100" y1="700" y2="700"></line>
                                    <line x1="0" x2="1100" y1="800" y2="800"></line>
                                    <line x1="0" x2="1100" y1="900" y2="900"></line>
                                    <line x1="0" x2="1100" y1="1000" y2="1000"></line>
                                </g>

                                <!-- Popisy y-novych tickov-->
                                <g text-anchor="end" dominant-baseline="middle">
                                    <text x="-10" y="100">20</text>
                                    <text x="-10" y="200">18</text>
                                    <text x="-10" y="300">16</text>
                                    <text x="-10" y="400">14</text>
                                    <text x="-10" y="500">12</text>
                                    <text x="-10" y="600">10</text>
                                    <text x="-10" y="700">8</text>
                                    <text x="-10" y="800">6</text>
                                    <text x="-10" y="900">4</text>
                                    <text x="-10" y="1000">2</text>
                                </g>
                                
                                <!-- Popis ypsilonovej osi. rotate( stupeň otočenia, x súradnica, y súradnica)-->
                                <text
                                    x="-50"
                                    y="500"
                                    text-anchor="middle"
                                    dominant-baseline="middle"
                                    font-size="15"
                                    font-weight="bold"
                                    transform="rotate(-90, -50, 500)"
                                >
                                Počet pesníčiek s daným hodnotením
                                </text>

                            </g>
                            
                            <!-- X wrapper s nastaveným okrajom 100 a posunutý začiatok súradníc na spodok grafu-->
                            <g transform="translate(100,1200)">
                                
                                <!-- X-ová os-->
                                <line x1="0" x2="1100" y1="0" y2="0"></line>

                                <!-- X ticky, dlžka 9-->
                                <line x1="200" x2="200" y1="9" y2="0"></line>
                                <line x1="350" x2="350" y1="9" y2="0"></line>
                                <line x1="500" x2="500" y1="9" y2="0"></line>
                                <line x1="650" x2="650" y1="9" y2="0"></line>
                                <line x1="800" x2="800" y1="9" y2="0"></line>

                                <!-- Popisy x-ových tickov. Sú poziciované na stred stĺpcov grafu.-->
                                <g text-anchor="end">
                                    <text x="200" y="30">Rating 1</text>
                                    <text x="350" y="30">Rating 2</text>
                                    <text x="500" y="30">Rating 3</text>
                                    <text x="650" y="30">Rating 4</text>
                                    <text x="800" y="30">Rating 5</text>
                                </g>

                                <!-- Popis x-ovej osi-->
                                <text x="550" y="70" text-anchor="middle" font-size="15" font-weight="bold">Rating pesníčky x/5</text>

                            </g>
                            
                        </g>

                        <!-- 
                            Jednotlivé stĺpce grafu sú vykreslené pomocou rectangle elementu, pričom ich šírka je rovnaká (100)
                            a majú medzi sebou medzery 50. Od začiatku a konca grafu majú odstup 150. Stĺpec najhoršie hodnotených
                            pesníčiek je červený, najlepších je zelený a ostatné sú modré. Výška stĺpcu je vyrátaná ako počet
                            pesníčiek daného hodnotenia (c1 až c5)*50, keďže je zvolená mierka 50=>1. Keďže kvoli použitému
                            translatu musíme vyrátať y súradnícu začiatku vykreslenia ako maximálnu výšku (1000) - výška stĺpca.
                        -->

                        <!-- Najhoršie pesníčky-->
                        <g transform="translate(100,200)" stroke="#222" stroke-width="1" fill="#fc1c03">
                            <rect x="150" y="{1000-$c1*50}" width="100" height="{$c1*50}"></rect>
                        </g>

                        <!-- Ostatné pesníčky-->
                        <g transform="translate(100,200)" stroke="#222" stroke-width="1" fill="#0d00ff">
                            <rect x="300" y="{1000-$c2*50}" width="100" height="{$c2*50}"></rect>
                            <rect x="450" y="{1000-$c3*50}" width="100" height="{$c3*50}"></rect>
                            <rect x="600" y="{1000-$c4*50}" width="100" height="{$c4*50}"></rect>
                        </g>

                        <!-- Najlepšie pesníčky-->
                        <g transform="translate(100,200)" stroke="#222" stroke-width="1" fill="#00ff4c">
                            <rect x="750" y="{1000-$c5*50}" width="100" height="{$c5*50}"></rect>
                        </g>

                    </svg>
            </body>
        </html>
    </xsl:template>    

</xsl:stylesheet>