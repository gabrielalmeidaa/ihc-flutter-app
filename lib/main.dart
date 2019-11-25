import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ihc_project/data.dart';
import 'homepage.dart';
import 'dart:convert';


final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
final dataInstance = DataInstance.instance;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter GoogleMaps Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primaryColor: Color(0xff6200ee),
      ),
      home: HomePage(),
    );
  }
}