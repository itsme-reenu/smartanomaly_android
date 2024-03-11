import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

// Ensure this file exists and contains your Firebase configuration

const kModelName = "model"; // Replace with your model name

class ModelLogic extends StatefulWidget {
 const ModelLogic({Key? key}) : super(key: key);

 @override
 State<ModelLogic> createState() => _ModelLogicState();
}

class _ModelLogicState extends State<ModelLogic> {
 FirebaseCustomModel? model;

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

 Future<XFile?> captureImage() async {
   final ImagePicker _picker = ImagePicker();
   final XFile? image = await _picker.pickImage(source: ImageSource.camera);
   return image;
 }

 Future<String> runModelOnImage(XFile image) async {
   // Process the image and run the model
   // This is a placeholder for your actual model processing logic
   String result = "Model output";
   return result;
 }

 Future<Map<String, String>> readLabels() async {
   final String labelsPath = 'assets/labels.txt'; // Adjust the path as necessary
   final String labelsContent = await rootBundle.loadString(labelsPath);
   final List<String> labels = labelsContent.split('\n');
   return Map.fromIterables(labels, labels);
 }

 void captureAndProcessImage() async {
   final XFile? image = await captureImage();
   if (image != null) {
      final String modelOutput = await runModelOnImage(image);
      final Map<String, String> labels = await readLabels();
      final String label = labels[modelOutput] ?? "Unknown";
      // Display the label to the user
      print("Model output: $label");
   }
 }

 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Smart Anomaly Detection App'),
        ),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: model != null
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Model name: ${model!.name}'),
                                Text('Model size: ${model!.size}'),
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
                          final _model = await FirebaseModelDownloader.instance
                              .getModel(kModelName,
                                 FirebaseModelDownloadType.latestModel);

                          setState(() {
                            model = _model;
                          });
                        },
                        child: const Text('Get latest model'),
                      ),
                    ),
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
                        child: const Text('Delete local model'),
                      ),
                    ),
                 ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                 onPressed: captureAndProcessImage,
                 child: const Text('Capture and Process Image'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
 }
}