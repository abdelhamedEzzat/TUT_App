import 'package:clean_arcicalcutre/presentation_layer/resorces/theme_data.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp._internal(); // Named Constractor

  static final MyApp _instance = MyApp._internal(); //SINGLE INSTATNCE

  factory MyApp() => _instance; //Factory Constractor

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
