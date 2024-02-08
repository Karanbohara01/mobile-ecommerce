// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, no_leading_underscores_for_local_identifiers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_e_comm/utils/app-constant.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../screens/auth-ui/welcome_screen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "A.K",
                  style: TextStyle(color: AppConstants.textColor),
                ),
                subtitle: Text(
                  "Version 1.0.1",
                  style: TextStyle(color: AppConstants.textColor),
                ),
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: AppConstants.primaryColor,
                  child: Text(
                    "A",
                    style: TextStyle(color: AppConstants.textColor),
                  ),
                ),
              ),
            ),
            Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Home",
                  style: TextStyle(color: AppConstants.textColor),
                ),
                leading: Icon(
                  Icons.home,
                  color: AppConstants.textColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstants.textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Products",
                  style: TextStyle(color: AppConstants.textColor),
                ),
                leading: Icon(
                  Icons.production_quantity_limits,
                  color: AppConstants.textColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstants.textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Orders",
                  style: TextStyle(color: AppConstants.textColor),
                ),
                leading: Icon(
                  Icons.shopping_bag,
                  color: AppConstants.textColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstants.textColor,
                ),
                onTap: () {
                  // Get.back();
                  // Get.to(() => AllOrdersScreen());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Contact",
                  style: TextStyle(color: AppConstants.textColor),
                ),
                leading: Icon(
                  Icons.help,
                  color: AppConstants.textColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstants.textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () async {
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  FirebaseAuth _auth = FirebaseAuth.instance;
                  await _auth.signOut();
                  await googleSignIn.signOut();
                  Get.offAll(() => WelcomeScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  "Logout",
                  style: TextStyle(color: AppConstants.textColor),
                ),
                leading: Icon(
                  Icons.logout,
                  color: AppConstants.textColor,
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: AppConstants.textColor,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: AppConstants.secondaryColor,
      ),
    );
  }
}
