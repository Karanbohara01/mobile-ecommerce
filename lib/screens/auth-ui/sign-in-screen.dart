// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_e_comm/controllers/sign-in-controller.dart';
import 'package:flutter_application_e_comm/screens/auth-ui/forget-password-screen.dart';
import 'package:flutter_application_e_comm/screens/auth-ui/sign-up-screen.dart';
import 'package:flutter_application_e_comm/screens/user-panel/main-screen.dart';
import 'package:flutter_application_e_comm/utils/app-constant.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstants.secondaryColor,
          centerTitle: true,
          title: const Text(
            "Sign In",
            style: TextStyle(color: AppConstants.textColor),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: [
                Column(
                  children: [
                    isKeyboardVisible
                        ? Text("Wel come to My App")
                        : Lottie.asset('assets/images/splash-icon.json'),
                  ],
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: userEmail,
                      cursorColor: AppConstants.secondaryColor,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                      child: Obx(
                            () => TextFormField(
                          controller: userPassword,
                          obscureText: signInController.isPasswordVisible.value,
                          cursorColor: AppConstants.secondaryColor,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: "Password",
                            prefixIcon: Icon(Icons.password),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                signInController.isPasswordVisible.toggle();
                              },
                              child: signInController.isPasswordVisible.value
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                            contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),

                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){
                      Get.to(()=>ForgetPasswordScreen());
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: AppConstants.secondaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 20,
                ),
                Material(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 18.0,
                    decoration: BoxDecoration(
                      color: AppConstants.secondaryColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: TextButton(
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(color: AppConstants.textColor),
                      ),
    onPressed: () async {
      String email = userEmail.text.trim();
      String password = userPassword.text.trim();

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar(
          "Error",
          "Please enter all details",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstants.secondaryColor,
          colorText: AppConstants.textColor,);

      }else{
        UserCredential? userCredential = await signInController.signInMethod(email, password);
        if(userCredential != null){
          if(userCredential.user!.emailVerified){
            Get.snackbar("Success", "Login Successful.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: AppConstants.secondaryColor,
              colorText: AppConstants.textColor,);
            Get.offAll(()=> MainScreen());
          }
          else{
            Get.snackbar("Error", "Please verify your email before login."
            );
          }}

          else{
          Get.snackbar(
            "Error",
            "Please Try Again",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppConstants.secondaryColor,
            colorText: AppConstants.textColor,);

        }

      }
    },
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height / 47,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: AppConstants.secondaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.offAll(() => SignUpScreen()),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: AppConstants.secondaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}




