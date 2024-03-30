import 'dart:io' as io;
import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reenu_susan_kurian_112033_s_application1/logic/camera_module.dart';
import 'package:reenu_susan_kurian_112033_s_application1/theme/theme_helper.dart';


// Ensure this file exists and contains your Firebase configuration

const kModelName = "model"; // Replace with your model name

class ModelLogic extends StatefulWidget {
  const ModelLogic({Key? key}) : super(key: key);

  @override
  State<ModelLogic> createState() => _ModelLogicState();
}

class _ModelLogicState extends State<ModelLogic> {
  FirebaseCustomModel? model;
  bool isProcessingComplete = false;
  String modelOutput = "";

  @override
  void initState() {
    super.initState();
    initWithLocalModel();
  }

  initWithLocalModel() async {
    final _model = await FirebaseModelDownloader.instance.getModel(
        kModelName, FirebaseModelDownloadType.localModelUpdateInBackground);

    setState(() {
      model = _model;
    });
  }
  
Future<String> loadLabels() async {
 return await rootBundle.loadString('assets/labels.txt');
}

  Future<XFile?> pickImageFromGallery() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        String modelOutput = await runModelOnImage(image);
        print("Model output: $modelOutput");
        final Map<String, String> labels = await readLabels();
        print("Labels: $labels");
        final String label = labels[modelOutput] ?? "Default Label";
        print("Matched label: $label");
        // Update the state variables
        setState(() {
          isProcessingComplete = true;
          modelOutput == label;
        });
      }
      return image;
    } catch (e) {
      print("Error picking image: $e");
      return null;
    }
  }

  Future<String> runModelOnImage(XFile image) async {
    // Process the image and run the model
   // This is a placeholder for your actual model processing logic
   String result = "Model output";
   return result;
  }

  Future<Map<String, String>> readLabels() async {
    String labelsContent = await loadLabels();

    final List<String> lines = labelsContent.split('\n');
    final Map<String, String> labels = {};
    for (var i = 0; i < lines.length; i++) {
      labels[i.toString()] = lines[i];
    }
    return labels;
  }

  void captureAndProcessImage() async {
    // Navigate to a new screen that contains the CameraModule widget
    // Pass a callback function to CameraModule
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Scaffold(
            body: CameraModule(
              onImageCaptured: (XFile? image) async {
                if (image != null) {
                  final String modelOutput = await runModelOnImage(image);
                  final Map<String, String> labels = await readLabels();
                  final String label = labels[modelOutput] ?? "Unknown";
                  // Display the label to the user
                  //print("Model output: $label");
            
                }
                // Navigate back to the previous screen after processing the image
                Navigator.pop(context);
              },
            ),
          ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeHelper().themeData();

    return Theme(
      data: themeData, // Apply the theme data from the ThemeHelper
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData, // Apply the theme data to the MaterialApp
        home: Scaffold(
          // appBar: AppBar(
          //   title: const Text('Smart Anomaly Detection App'),
          // ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Card(
                      margin: EdgeInsets.zero,
                      color: themeData.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: model != null
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                   'Model name: ${model!.name}',
                                   style: TextStyle(color: Colors.white), // Set the text color to white
                                  ),
                                  Text(
                                   'Model size: ${model!.size}',
                                   style: TextStyle(color: Colors.white), ),
                                   //Text("Model output: abuse", style: TextStyle(color: Colors.white)),
                                   // Set the text color to white
                                ],
                              )
                            : const Text("No local model found"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(

                          onPressed: () async {
                            final _model =
                                await FirebaseModelDownloader.instance.getModel(
                                    kModelName,
                                    FirebaseModelDownloadType.latestModel);

                            setState(() {
                            
                              model = _model;
                            });
                          },
                          child: const Text('Get latest model'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, 
                            backgroundColor: themeData.primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            textStyle: TextStyle(fontSize: 13),
                        ),
                      ),),
                      const SizedBox(width: 20),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            await FirebaseModelDownloader.instance
                                .deleteDownloadedModel(kModelName);

                            setState(() {
                              model = null;
                            });
                          },
                          child: const Text('Delete latest model'),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white, backgroundColor: themeData.primaryColor,
                              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                            textStyle: TextStyle(fontSize: 13),
                        ),
                      ),),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: captureAndProcessImage,
                    child: const Text('Capture and Process Image', style: TextStyle(color: Colors.white, fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: themeData.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Increase button size
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: pickImageFromGallery,
                    child: const Text('Pick Image from Gallery', style: TextStyle(color: Colors.white, fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, 
                      backgroundColor: themeData.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Increase button size
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
