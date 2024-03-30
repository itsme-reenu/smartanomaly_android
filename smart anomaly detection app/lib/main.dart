import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reenu_susan_kurian_112033_s_application1/firebase_options.dart';
import 'package:reenu_susan_kurian_112033_s_application1/logic/camera_module.dart';
import 'package:reenu_susan_kurian_112033_s_application1/presentation/carousel_design.dart';
import 'core/app_export.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
 );
 SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
 ]);

 ThemeHelper().changeTheme('primary');
 cameras = await availableCameras();
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme, // Ensure theme is defined or imported
          title: 'SafeNest',
          debugShowCheckedModeBanner: false,
          home: CarouselScreen(),
        );
      },
    );
 }
}