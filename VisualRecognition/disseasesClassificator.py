import json
from watson_developer_cloud import VisualRecognitionV3

visual_recognition = VisualRecognitionV3(
	'2016-05-20',
	api_key="4893812447dc238483d5c01a41dfc798057baaeb")
cont = 0
for i in [151, 9]:
	with open('./test/'+ str(i) + '.jpg', 'rb') as images_file:
		classes = visual_recognition.classify(
			images_file,
			parameters=json.dumps({
				'classifier_ids': ['DefaultCustomModel_914733598'],
				'threshold': 0.6
			}))
	# if(classes["images"][0]["classifiers"][0]["classes"][0]["class"] == "sanas"):
	# 	cont += 1
	# else:
	# 	print(i)
	#print(json.dumps(classes, indent=2))
	print(classes["images"][0]["classifiers"][0]["classes"][0]["class"])
print(cont)
