// // ignore_for_file: body_might_complete_normally_nullable

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_application_e_comm/models/user-model.dart';
// import 'package:flutter_application_e_comm/utils/app-constant.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:get/get.dart';

// class SignUpController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // For password visibility
//   var isPasswordVisible = false.obs;

//   Future<UserCredential?> signUpMethod(
//     String userName,
//     String userEmail,
//     String userPhone,
//     String userCity,
//     String userPassword,
//     String userDeviceToken,
//   ) async {
//     try {
//       EasyLoading.show(status: "Please wait");
//       UserCredential userCredential =
//           await _auth.createUserWithEmailAndPassword(
//         email: userName,
//         password: userPassword,
//       );

//       // send email verification
//       await userCredential.user!.sendEmailVerification();

//       UserModel userModel = UserModel(
//         uId: userCredential.user!.uid,
//         username: userName,
//         email: userEmail,
//         phone: userPhone,
//         userImg: '',
//         userDeviceToken: userDeviceToken,
//         country: '',
//         userAddress: '',
//         street: '',
//         isAdmin: false,
//         isActive: true,
//         createdOn: DateTime.now(),
//         city: userCity,
//       );

//       // add data into database
//       _firestore
//           .collection('users')
//           .doc(userCredential.user!.uid)
//           .set(userModel.toMap());
//       EasyLoading.dismiss();

//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       EasyLoading.dismiss();
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

// ignore_for_file: body_might_complete_normally_nullable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_e_comm/models/user-model.dart';
import 'package:flutter_application_e_comm/utils/app-constant.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
      EasyLoading.show(status: "Please wait");
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userEmail, // Fix: Use userEmail here instead of userName
        password: userPassword,
      );

      // send email verification
      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
        uId: userCredential.user!.uid,
        username: userName,
        email: userEmail,
        phone: userPhone,
        userImg: '',
        userDeviceToken: userDeviceToken,
        country: '',
        userAddress: '',
        street: '',
        isAdmin: false,
        isActive: true,
        createdOn: DateTime.now(),
        city: userCity,
      );

      // add data into database
      await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      EasyLoading.dismiss();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
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
