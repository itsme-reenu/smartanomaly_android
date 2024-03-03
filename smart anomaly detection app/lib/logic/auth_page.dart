import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reenu_susan_kurian_112033_s_application1/presentation/carousel_design.dart';
import 'package:reenu_susan_kurian_112033_s_application1/presentation/dashboard.dart';

class AuthPage extends StatelessWidget {
 const AuthPage({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return Dashboard();
            } else {
              return CarouselScreen();
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
 }
}
