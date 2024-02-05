// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('hello,Welcome to my Application!'),
        centerTitle: true,
      ),
    );
  }
}
