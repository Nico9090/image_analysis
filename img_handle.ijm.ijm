title = getTitle();
print("Active image: "+ title);
run("8-bit");//rescales the intensity values
setAutoThreshold("Otsu dark"); //identifies foreground and background
//all pixel intensities <= threshold are background
//all pixel intensities >= threshold are foreground
run("Convert to Mask"); //foreground to white, background to black
run("Watershed"); //splits touching objects
run("Set Measurements...","area mean min centroid redirect=None decimal=3");
run("Analyze Particles...","size=50-Infinity show=Outlines display clear");
saveAs("Results","results.csv");
