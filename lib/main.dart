import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/welcome.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      debugShowCheckedModeBanner: false,

      home: Welcome(),
    );
  }
}