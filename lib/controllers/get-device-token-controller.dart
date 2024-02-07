//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_application_e_comm/utils/app-constant.dart';
// import 'package:get/get.dart';
//
// class GetDeviceTokenController extends GetxController {
//   String? deviceToken;
//
//   @override
//   void onInit() {
//     super.onInit();
//     getDeviceToken();
//   }
//
//   Future<void> getDeviceToken() async {
//     try {
//       String? token = await FirebaseMessaging.instance.getToken();
//
//       if (token != null) {
//         deviceToken = token;
//         print("token : $deviceToken");
//         update();
//       }
//     } catch (e) {
//       Get.snackbar(
//         "Error",
//         "$e",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: AppConstants.secondaryColor,
//         colorText: AppConstants.textColor,
//       );
//     }
//   }
// }


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_e_comm/utils/app-constant.dart';
import 'package:get/get.dart';

class GetDeviceTokenController extends GetxController {
  String? deviceToken;

  @override
  void onInit() {
    super.onInit();
    getDeviceToken();
  }

  Future<void> getDeviceToken() async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();

      if (token != null && token.isNotEmpty) {
        deviceToken = token;
        print("Token: $deviceToken");
      } else {
        print("Device token is null or empty.");
        Get.snackbar(
          "Error",
          "Failed to retrieve device token. Please try again later.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstants.secondaryColor,
          colorText: AppConstants.textColor,
        );
      }
    } catch (e) {
      print("Error getting device token: $e");
      Get.snackbar(
        "Error",
        "Failed to get device token. Please try again later.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstants.secondaryColor,
        colorText: AppConstants.textColor,
      );
    }
  }
}

