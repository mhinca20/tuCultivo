import numpy as np
import cv2
import matplotlib.pyplot as plt
from skimage.segmentation import slic
from skimage.segmentation import mark_boundaries
from sklearn import svm
from sklearn.externals import joblib
import features as ft

if (__name__ == "__main__"):
    np.seterr(divide='ignore', invalid='ignore')

    x = []
    y = []
    #for i in [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,201,202,203,204,205,206,207]:
    for i in [1,4,12,14,24,29,36,52,72,201,202,203,204,205,206,207]:
    #for i in [4,14,36,52]:
        image = cv2.resize(cv2.imread("datasetTrainPlants/" + str(i) + ".jpg"),(400,400))
        imageBYW = cv2.resize(cv2.imread("negroYBlancoParaPlantas/" + str(i) + ".jpg"),(400,400))
        #imageBYW = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
        image_hsv = cv2.cvtColor(image, cv2.COLOR_BGR2HSV)
        segments = slic(image, n_segments = 100, sigma = 5)
        for (j, segVal) in enumerate(np.unique(segments)):
            features = ft.retrieve_features(image[segments==segVal], image_hsv[segments==segVal])
            x.append(features)
            if(np.mean(imageBYW[segments==segVal]) > 200):
                y.append(0)
            else:
                y.append(1)

            # mask = np.zeros(image.shape[:2], dtype = "uint8")
            # mask[segments == segVal] = 255
            # cv2.imshow("superPixel", cv2.bitwise_and(image, image, mask = mask))
            # cv2.waitKey()
            #if(np.mean(imageBYW[segments==segVal]) > 188 and np.mean(imageBYW[segments==segVal] < 190):
            #    print(np.mean(imageBYW[segments==segVal])
    x = np.asarray(x)
    y = np.asarray(y)
    print(np.sum(y))
    print(len(y))
    model = svm.SVC(kernel='poly', degree=3, coef0=1)
    model.fit(x, y.reshape((x.shape[0])))
    joblib.dump(model, 'model.pkl')
