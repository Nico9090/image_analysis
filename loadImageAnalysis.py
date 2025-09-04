import tifffile as tiff
import matplotlib.pyplot as plt
from skimage.color import rgb2gray
from skimage.filters import threshold_otsu
import numpy as np
from skimage import img_as_float
from skimage.measure import label, regionprops

def createPlot(image,binary,colors):
    fig, ax = plt.subplots()
    ax.imshow(image, cmap='gray')
    #ax.contour(binary, colors=colors)
    return fig, ax
    
def loadImage(filePath):
    image = tiff.imread(filePath)
    grayScale = rgb2gray(image) if len(image.shape) == 3 else image
    thresh = threshold_otsu(grayScale)
    binary = grayScale > thresh
    imageFloat = img_as_float(image)
    imageFig, imageAx = createPlot(imageFloat,binary,'r')
    return imageFig, imageAx, binary, imageFloat
