// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_e_comm/controllers/google-sign-in-controller.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../utils/app-constant.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstants.secondaryColor,
        title: const Text(
          "Welcome to My App",
          style: TextStyle(color: AppConstants.textColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Lottie.asset('assets/images/splash-icon.json'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: Text(
              "Happy Shopping",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 12,
          ),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 12.0,
              decoration: BoxDecoration(
                color: AppConstants.secondaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton.icon(
                icon: Image.asset(
                  "assets/images/final-google-logo.png",
                  width: Get.width / 12,
                  height: Get.height / 12,
                ),
                label: Text(
                  "Sign in with Google",
                  style: TextStyle(color: AppConstants.textColor),
                ),
                onPressed: () {
                  _googleSignInController.SignInWithGoogle();
                },
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 50,
          ),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 12.0,
              decoration: BoxDecoration(
                color: AppConstants.secondaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton.icon(
                icon: Icon(
                  Icons.email,
                  color: AppConstants.textColor,
                ),
                label: Text(
                  "Sign in with Email",
                  style: TextStyle(color: AppConstants.textColor),
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
