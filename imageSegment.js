importClass(Packages.ij.IJ);
function showImage(path){
	importClass(Packages.ij.IJ);
	imp = IJ.openImage(path);
	imp.show();
	return imp
}
var ki67Image1 = showImage("/path/to/Downloads/Ki67_001.tif");
IJ.run(ki67Image1,"8-bit","");
function segmentImage(image,threshold){
	importClass(Packages.ij.IJ);
	IJ.setThreshold(image,threshold,200);
	IJ.run(image,"Convert to Mask","black");
	IJ.run(image,"Watershed","");
}
segmentImage(ki67Image1,100);
function extractFeatures(imageObj,outputFile){
	IJ.run("Set Measurements...", "area mean min max centroid redirect=None decimal=3");
	IJ.run(imageObj, "Analyze Particles...", "size=50-Infinity show=Nothing clear include summarize");
	IJ.selectWindow("Results");
	IJ.saveAs("Results", outputFile);
}
extractFeatures(ki67Image1,"path/to/Downloads/ki67Measurements.csv")
