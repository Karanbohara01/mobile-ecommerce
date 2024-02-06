// ignore_for_file: file_names, prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_e_comm/utils/app-constant.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../user-panel/main-screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.offAll(() => MainScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.secondaryColor,
      appBar: AppBar(
        backgroundColor: AppConstants.secondaryColor,
        elevation: 0,
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: Container(
              width: Get.width,
              alignment: Alignment.center,
              child: Lottie.asset('assets/images/splash-icon.json'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            width: Get.width,
            alignment: Alignment.center,
            child: Text(
              AppConstants.poweredBy,
              style: TextStyle(
                color: AppConstants.textColor,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      )),
    );
  }
}
