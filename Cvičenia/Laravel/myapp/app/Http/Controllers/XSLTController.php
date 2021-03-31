<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class XSLTController extends Controller
{
    public function index(){
        $xml = new \DOMDocument();
        $xml->load('xml/data.xml');     
        $xsl = new \DOMDocument();
        $xsl->load('xml/hello.xsl');
        $xsltProc = new \XSLTProcessor();
        $xsltProc->importStyleSheet($xsl);
        return $xsltProc->transformToXML($xml);
    }
}
