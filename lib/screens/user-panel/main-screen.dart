// ignore_for_file: file_names, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_e_comm/screens/auth-ui/welcome_screen.dart';
import 'package:flutter_application_e_comm/widgets/banner-widget.dart';
import 'package:flutter_application_e_comm/widgets/custom-drawer-widget.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../utils/app-constant.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppConstants.textColor),
        backgroundColor: AppConstants.primaryColor,
        title: Text(AppConstants.appName,style: TextStyle(color: AppConstants.textColor),),
        centerTitle: true,

      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height:Get.height/90.0,),
            // Text("Karan")
            // Banner
            BannerWidget(),
          ],
        ),
      ),
    );
  }
}
