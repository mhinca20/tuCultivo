###script que convierte las imagenes en blanco

import numpy as np
import cv2
import matplotlib.pyplot as plt
from skimage.segmentation import slic
from skimage.segmentation import mark_boundaries

for i in range(11,18):
    image_name = str(i) + ".jpg"
    image = cv2.imread("datasetTrainPlants/" + image_name, cv2.IMREAD_COLOR)
    image[:,:,:]=255
    cv2.imwrite("negroYBlancoParaPlantas/"+image_name, image)
