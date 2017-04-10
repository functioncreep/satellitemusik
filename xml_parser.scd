// XML Parser?

(
var myXML, path;

path = thisProcess.nowExecutingPath.dirname +/+ "2378861.gpx";
myXML = File(path, "r");

// first, load contents as string into variable:
myXML = myXML.readAllString;
myXML.postln;

// next, get nodes... everything under "gpx" tag:

)