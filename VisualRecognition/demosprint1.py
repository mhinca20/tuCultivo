import json
import requests
import cv2
from watson_developer_cloud import VisualRecognitionV3
############## creacion de objeto apra api de visual recognition de IBM ###############
visual_recognition = VisualRecognitionV3(
	'2016-05-20',
	api_key="4893812447dc238483d5c01a41dfc798057baaeb")

################# clasificacion d eimagenes de prueba con el api de IBM ###############
for i in [151, 9]:
    file_path = './test/'+ str(i) + '.jpg'
    with open(file_path, 'rb') as images_file:
        classes = visual_recognition.classify(
			images_file,
			parameters=json.dumps({
				'classifier_ids': ['DefaultCustomModel_914733598'],
				'threshold': 0.6
			}))
    predict = classes["images"][0]["classifiers"][0]["classes"][0]["class"]
    print(predict)
######################### mostrar cada imagen ##########################
    image = cv2.imread(file_path)
    cv2.imshow(predict, image)
    cv2.waitKey()
    cv2.destroyAllWindows()

########### posts de simulacion de sensores ####################
#r = requests.post("https://tucultivo.herokuapp.com/sensors/?/values", data={"sensor": {"value": 27}})
#r2 = requests.post("https://tucultivo.herokuapp.com/sensors/?/values", data={"sensor": {"value": 28}})
