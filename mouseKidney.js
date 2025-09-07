//open folder and save tiff of 20 slices
importClass(Packages.ij.IJ);
importClass(Packages.java.io.File);
IJ.run("Image Sequence...", "open=C:/Users/path/Downloads/mouseKidney60nm/mouseKidney60nm/Kidney_public file=tif sort");
importClass(Packages.ij.IJ);
IJ.saveAs("Tiff","C:/Users/path/Downloads/mouseKidney60nm.tif");

//binarize image and pop up foreground
importClass(Packages.ij.IJ);
var imp = IJ.openImage("C:/Users/path/Downloads/mouseKidney60nm.tif");
IJ.run(imp,"8-bit","");
IJ.run(imp, "Auto Threshold", "method=Otsu white");
IJ.run(imp, "Fire", "");
imp.show();

importClass(Packages.ij.IJ);
var imp = IJ.getImage(); 
imp.show();

importClass(Packages.ij.IJ);
importClass(Packages.ij.ImagePlus);
importClass(Packages.ij.process.ImageProcessor);
importClass(Packages.ij.measure.ResultsTable);

// Get current image
var imp = IJ.getImage();

// Extract slice 1 as a separate image
var ip2 = imp.getStack().getProcessor(2);    // slice index starts at 1
var slice2 = new ImagePlus("Slice2", ip2.duplicate()); // duplicate so original stack stays intact
slice2.show();

// Preprocessing
IJ.run(slice2, "8-bit", "");
IJ.run(slice2, "Auto Threshold", "method=Otsu white");
IJ.run(slice2, "Convert to Mask", "");
IJ.run(slice2, "Watershed", "");

// Set measurements
IJ.run("Set Measurements...", "area mean min max centroid redirect=None decimal=3");

// Analyze particles — **one row per particle**
IJ.run(slice2, "Analyze Particles...", "size=50-Infinity clear include");

// Save Results Table
IJ.saveAs("Results", "C:/Users/path/Downloads/mouseKidney60nmslice2Measur.csv");
