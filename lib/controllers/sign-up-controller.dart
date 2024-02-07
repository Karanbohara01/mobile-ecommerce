// ignore_for_file: body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_e_comm/models/user-model.dart';
import 'package:flutter_application_e_comm/utils/app-constant.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // For password visibility
  var isPasswordVisible = false.obs;

  Future<UserCredential?> signUpMethod(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
    String userDeviceToken,
  ) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userName,
        password: userPassword,
      );

      // send email verification
      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
          uId: uId,
          username: username,
          email: email,
          phone: phone,
          userImg: userImg,
          userDeviceToken: userDeviceToken,
          country: country,
          userAddress: userAddress,
          street: street,
          isAdmin: isAdmin,
          isActive: isActive,
          createdOn: createdOn,
          city: city);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstants.secondaryColor,
        colorText: AppConstants.textColor,
      );
    }
  }
}
