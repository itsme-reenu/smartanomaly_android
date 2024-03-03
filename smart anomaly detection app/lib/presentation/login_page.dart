import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reenu_susan_kurian_112033_s_application1/core/app_export.dart';
import 'package:reenu_susan_kurian_112033_s_application1/logic/auth_page.dart';
import 'package:reenu_susan_kurian_112033_s_application1/presentation/dashboard.dart';
import 'package:reenu_susan_kurian_112033_s_application1/widgets/custom_elevated_button.dart';
import 'package:reenu_susan_kurian_112033_s_application1/widgets/custom_text_form_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController userNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userNameController.text,
        password: passwordController.text,
      );
      // Navigate to the AuthPage if sign-in is successful
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
    } on FirebaseAuthException catch (e) {
      print('Failed with error code: ${e.code}');
      print(e.message);
      // Handle the error appropriately in your UI
      // For example, show a Snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to sign in: ${e.message}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Container(
                      height: 72.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                      ),
                    ),
                    SizedBox(height: 22.v),
                    Text(
                      "Welcome back",
                      style: theme.textTheme.headlineMedium,
                    ),
                    SizedBox(height: 21.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: CustomTextFormField(
                        controller: userNameController,
                        hintText: "username",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 24.v),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: CustomTextFormField(
                        controller: passwordController,
                        hintText: "Password",
                        textInputAction: TextInputAction.done,
                        textInputType: TextInputType.visiblePassword,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 17.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Text(
                          "Forgot password?",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 22.v),
                    CustomElevatedButton(
                      text: "Log in",
                      margin: EdgeInsets.symmetric(horizontal: 16.h),
                      onPressed: () {
                        //if (_formKey.currentState!.validate()) _signIn(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dashboard()),
                        );
                      },
                    ),
                    SizedBox(height: 17.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Text(
                          "New user? Sign Up",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
