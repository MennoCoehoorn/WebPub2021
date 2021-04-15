<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AssigmentController extends Controller
{
    public function index(){
        $xml = new \DOMDocument();
        $xml->load('xml/main.xml');     
        $xsl = new \DOMDocument();
        $xsl->load('xml/spotify.xsl');
        $xsltProc = new \XSLTProcessor();
        $xsltProc->importStyleSheet($xsl);
        return $xsltProc->transformToXML($xml);
    }
    public function grafik(){
        $xml = new \DOMDocument();
        $xml->load('xml/main.xml');     
        $xsl = new \DOMDocument();
        $xsl->load('xml/plot.xsl');
        $xsltProc = new \XSLTProcessor();
        $xsltProc->importStyleSheet($xsl);
        return $xsltProc->transformToXML($xml);
    }
}
