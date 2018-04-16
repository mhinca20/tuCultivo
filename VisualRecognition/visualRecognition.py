import json
from watson_developer_cloud import VisualRecognitionV3

visual_recognition = VisualRecognitionV3(
	'2016-05-20',
	api_key="d45aadc2f037c51d479ecdb4bbcb1b8cd2985494")
cont = 0
for i in range(100):
	with open('./sinPlagas/'+ str(i+101) + '.jpg', 'rb') as images_file:
		classes = visual_recognition.classify(
			images_file,
			parameters=json.dumps({
				'classifier_ids': ['DefaultCustomModel_2073470166'],
				'threshold': 0.6
			}))
	if(classes["images"][0]["classifiers"][0]["classes"][0]["class"] == "sanas"):
		cont += 1
	else:
		print(i)
	#print(json.dumps(classes, indent=2))
	#print(classes["images"][0]["classifiers"][0]["classes"][0]["class"])
print(cont)
