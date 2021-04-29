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

                    <!-- Samotné svg na vykreslenie grafu-->
                    <svg
                        viewBox="0 0 900 900"
                        role="img"
                        version="1.1"
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                    >   

                        <defs>
                            <marker id="arrowhead" markerWidth="10" markerHeight="7" 
                            refX="0" refY="3.5" orient="auto">
                            <polygon points="0 0, 10 3.5, 0 7" />
                            </marker>
                        </defs>

                        <defs>
                            <marker id="arrowhead2" markerWidth="10" markerHeight="7" 
                            refX="0" refY="3.5" orient="auto">
                            <polygon points="10 0, 10 7, 0 3.5" />
                            </marker>
                        </defs>

                        <!-- Popisy grafu-->
                        <title id="title">Rockfort</title>
                        <desc id="desc">Rockfort populacia</desc>

                        <!-- Wrapper na celý graf-->
                        <g stroke="#777" stroke-width="1" font-size="15" font-family="Arial">
                            <!-- Ypsilon wrapper, ktorý má nastavený okraj 100 pomocou translatu-->
                            <g transform="translate(100,100)">
                                
                                <!-- Y-ová os-->
                                <line x1="0" x2="0" y1="0" y2="700" marker-start="url(#arrowhead2)"></line>

                                <!-- Y ticky, dĺžka 9. Záporné číslo je použité kvôli translatu-->
                                <line x1="-9" x2="0" y1="50" y2="50"></line>
                                <line x1="-9" x2="0" y1="150" y2="150"></line>
                                <line x1="-9" x2="0" y1="250" y2="250"></line>
                                <line x1="-9" x2="0" y1="350" y2="350"></line>
                                <line x1="-9" x2="0" y1="450" y2="450"></line>
                                <line x1="-9" x2="0" y1="550" y2="550"></line>
                                <line x1="-9" x2="0" y1="650" y2="650"></line>

                                
                                <line x1="0" x2="700" y1="50" y2="50"></line>
                                <line x1="0" x2="700" y1="150" y2="150"></line>
                                <line x1="0" x2="700" y1="250" y2="250"></line>
                                <line x1="0" x2="700" y1="350" y2="350"></line>
                                <line x1="0" x2="700" y1="450" y2="450"></line>
                                <line x1="0" x2="700" y1="550" y2="550"></line>
                                <line x1="0" x2="700" y1="650" y2="650"></line>
                                
                                

                                <!-- Popisy y-novych tickov-->
                                <g text-anchor="end" dominant-baseline="middle">
                                    <text x="-10" y="50">330k</text>
                                    <text x="-10" y="150">325k</text>
                                    <text x="-10" y="250">320k</text>
                                    <text x="-10" y="350">315k</text>
                                    <text x="-10" y="450">310k</text>
                                    <text x="-10" y="550">305k</text>
                                    <text x="-10" y="650">300k</text>
                                </g>
                                
                                <!-- Popis ypsilonovej osi. rotate( stupeň otočenia, x súradnica, y súradnica)-->
                                <text
                                    x="-50"
                                    y="350"
                                    text-anchor="middle"
                                    dominant-baseline="middle"
                                    font-size="15"
                                    font-weight="bold"
                                    transform="rotate(-90, -50, 350)"
                                >
                                Populácia
                                </text>

                            </g>
                            
                            <!-- X wrapper s nastaveným okrajom 100 a posunutý začiatok súradníc na spodok grafu-->
                            <g transform="translate(100,800)">
                                
                                <!-- X-ová os-->
                                <line x1="0" x2="700" y1="0" y2="0" marker-end="url(#arrowhead)"></line>

                                <!-- X ticky, dlžka 9-->
                                <line x1="50" x2="50" y1="9" y2="0"></line>
                                <line x1="150" x2="150" y1="9" y2="0"></line>
                                <line x1="250" x2="250" y1="9" y2="0"></line>
                                <line x1="350" x2="350" y1="9" y2="0"></line>
                                <line x1="450" x2="450" y1="9" y2="0"></line>
                                <line x1="550" x2="550" y1="9" y2="0"></line>
                                <line x1="650" x2="650" y1="9" y2="0"></line>

                                <!-- Popisy x-ových tickov. Sú poziciované na stred stĺpcov grafu.-->
                                <g text-anchor="end">
                                    <text x="50" y="30">1500</text>
                                    <text x="150" y="30">1800</text>
                                    <text x="250" y="30">1900</text>
                                    <text x="350" y="30">1950</text>
                                    <text x="450" y="30">1975</text>
                                    <text x="550" y="30">2000</text>
                                    <text x="650" y="30">2021</text>
                                </g>

                                <!-- Popis x-ovej osi-->
                                <text x="350" y="70" text-anchor="middle" font-size="15" font-weight="bold">Rok</text>

                            </g>
                            
                        </g>

                        <g stroke="#0d00ff" stroke-width="3" fill="#0d00ff">
                            <line x1="150" x2="250" y1="750" y2="670"></line>
                            <line x1="250" x2="350" y1="670" y2="560"></line>
                            <line x1="350" x2="450" y1="560" y2="440"></line>
                            <line x1="450" x2="550" y1="440" y2="340"></line>
                            <line x1="550" x2="650" y1="340" y2="250"></line>
                            <line x1="650" x2="750" y1="250" y2="170"></line>
                        </g>

                        <circle cx="150" cy="750" r="5" stroke="green" fill="green" stroke-width="5"/>
                        <circle cx="250" cy="670" r="5" stroke="green" fill="green" stroke-width="5"/>
                        <circle cx="350" cy="560" r="5" stroke="green" fill="green" stroke-width="5"/>
                        <circle cx="450" cy="440" r="5" stroke="green" fill="green" stroke-width="5"/>
                        <circle cx="550" cy="340" r="5" stroke="green" fill="green" stroke-width="5"/>
                        <circle cx="650" cy="250" r="5" stroke="green" fill="green" stroke-width="5"/>
                        <circle cx="750" cy="170" r="5" stroke="green" fill="green" stroke-width="5"/>

                        

                    </svg>
            </body>
        </html>
    </xsl:template>    

</xsl:stylesheet>