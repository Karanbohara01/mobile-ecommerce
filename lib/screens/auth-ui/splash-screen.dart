// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_e_comm/utils/app-constant.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.secondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Lottie.asset('assets/images/splash-icon.json'),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: AppConstants.secondaryColor,
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}
