﻿// jsilver PSD compiler// for use with psd2html#target photoshop// in case we double clicked the file//app.bringToFront();function log(mesg) {    $.write(mesg + "\n");   }function processLayer(theLayer) { convertToSmartObject(); rasterizeLayer()}function processLayers(theParent) {   for (var m = theParent.layers.length - 1; m >= 0;m--) {       var theLayer = theParent.layers[m];        app.activeDocument.activeLayer = theLayer;                if (theLayer.typename == "ArtLayer") {            processLayer(theLayer);        } else {            processLayers(theLayer);          }     };}// fastfunction deleteAllHiddenLayers() {    try {    var idDlt = charIDToTypeID( "Dlt " );        var desc24 = new ActionDescriptor();        var idnull = charIDToTypeID( "null" );            var ref23 = new ActionReference();            var idLyr = charIDToTypeID( "Lyr " );            var idOrdn = charIDToTypeID( "Ordn" );            var idhidden = stringIDToTypeID( "hidden" );            ref23.putEnumerated( idLyr, idOrdn, idhidden );        desc24.putReference( idnull, ref23 );    executeAction( idDlt, desc24, DialogModes.NO );    } catch(e) {            } } function convertToSmartObject() {    try {    var idnewPlacedLayer = stringIDToTypeID( "newPlacedLayer" );    executeAction( idnewPlacedLayer, undefined, DialogModes.NO );    } catch(e) {            }}function rasterizeLayer() {    var idrasterizeLayer = stringIDToTypeID( "rasterizeLayer" );        var desc21 = new ActionDescriptor();        var idnull = charIDToTypeID( "null" );            var ref20 = new ActionReference();            var idLyr = charIDToTypeID( "Lyr " );            var idOrdn = charIDToTypeID( "Ordn" );            var idTrgt = charIDToTypeID( "Trgt" );            ref20.putEnumerated( idLyr, idOrdn, idTrgt );        desc21.putReference( idnull, ref20 );    executeAction( idrasterizeLayer, desc21, DialogModes.NO );}function savePsd() {    var idsave = charIDToTypeID( "save" );    executeAction( idsave, undefined, DialogModes.NO );}function quitPhotoshop() {   var idsave = charIDToTypeID( "quit" );   executeAction( idsave, undefined, DialogModes.NO );  }function compilePsd (theParent) {     deleteAllHiddenLayers();     processLayers(theParent);        savePsd();        quitPhotoshop();     };doc = app.activeDocument;compilePsd(doc);