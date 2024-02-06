// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_e_comm/screens/auth-ui/sign-up-screen.dart';
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
                    child: TextFormField(
                      cursorColor: AppConstants.secondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: Icon(Icons.visibility_off),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 8.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: AppConstants.secondaryColor,
                        fontWeight: FontWeight.bold),
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
                      onPressed: () {},
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


// import 'package:flutter/material.dart';
// import 'package:flutter_application_e_comm/utils/app-constant.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({Key? key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppConstants.secondaryColor,
//           centerTitle: true,
//           title: const Text(
//             "Sign In",
//             style: TextStyle(color: AppConstants.textColor),
//           ),
//         ),
//         body: Container(
//           width: double.infinity,
//           height: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   isKeyboardVisible
//                       ? Text("Welcome to My App")
//                       : Lottie.asset('assets/images/splash-icon.json'),
//                 ],
//               ),
//               SizedBox(height: Get.height / 20),
//               Container(
//                 width: Get.width,
//                 child: TextFormField(
//                   cursorColor: AppConstants.secondaryColor,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     hintText: "Email",
//                     prefixIcon: Icon(Icons.email),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: 12.0,
//                       horizontal: 16.0,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 width: Get.width,
//                 child: TextFormField(
//                   cursorColor: AppConstants.secondaryColor,
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     hintText: "Password",
//                     prefixIcon: Icon(Icons.password),
//                     suffixIcon: Icon(Icons.visibility_off),
//                     contentPadding: EdgeInsets.symmetric(
//                       vertical: 12.0,
//                       horizontal: 16.0,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               GestureDetector(
//                 onTap: () {
//                   // Handle forgot password
//                 },
//                 child: Container(
//                   alignment: Alignment.centerRight,
//                   child: Text(
//                     "Forgot Password?",
//                     style: TextStyle(
//                       color: AppConstants.secondaryColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: Get.height / 20),
//               Container(
//                 width: Get.width / 2,
//                 decoration: BoxDecoration(
//                   color: AppConstants.secondaryColor,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: TextButton(
//                   onPressed: () {
//                     // Handle sign in button press
//                   },
//                   child: Text(
//                     "SIGN IN",
//                     style: TextStyle(color: AppConstants.textColor),
//                   ),
//                 ),
//               ),
//               SizedBox(height: Get.height / 47),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Don't have an account?",
//                     style: TextStyle(
//                       color: AppConstants.secondaryColor,
//                     ),
//                   ),
//                   Text(
//                     "Sign Up",
//                     style: TextStyle(
//                       color: AppConstants.secondaryColor,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }
