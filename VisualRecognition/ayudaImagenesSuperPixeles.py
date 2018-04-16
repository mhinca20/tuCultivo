import numpy as np
import cv2
import matplotlib.pyplot as plt
from skimage.segmentation import slic
from skimage.segmentation import mark_boundaries

image_name = "31.jpg"
image = cv2.imread("conPlagas/" + image_name, cv2.IMREAD_COLOR)
# cv2.imshow("imagen", img)
# cv2.waitKey(0)
# cv2.destroyAllWindows()
segments = slic(image, n_segments = 100, sigma = 5)

for (i, segVal) in enumerate(np.unique(segments)):
    # print ("[x] inspecting segment %d" % (i))
    mask = np.zeros(image.shape[:2], dtype = "uint8")
    mask[segments == segVal] = 255
    # show the masked region
    # cv2.imshow("Mask", mask)
    cv2.imshow("superPixel", cv2.bitwise_and(image, image, mask = mask))
    cv2.waitKey(100)
    response = input("a = is plant, 0 = is not plant")
    if (response == "0"):
        image[segments == segVal] = 255

#cv2.imwrite("blackAndWhyteImages/"+image_name, image)
cv2.imwrite("negroYBlancoParaPlantas/"+image_name, image)
# fig = plt.figure("Superpixels -- %d segments" % (100))
# ax = fig.add_subplot(1, 2, 1)
# ax.imshow(mark_boundaries(img, segments))
# ax = fig.add_subplot(1, 2, 2)
# ax.imshow(img)
# plt.axis("off")
# plt.show()
#cv2.imshow("imagen", img)
#cv2.waitKey(0)
#cv2.destroyAllWindows()
