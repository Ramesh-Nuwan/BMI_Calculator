import 'package:flutter/material.dart';
import 'package:bmi_calculator/MyApp.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      /*statusBarColor: Colors.white, //top bar color
    statusBarIconBrightness: Brightness.dark, //top bar icons
    systemNavigationBarColor: Colors.white, //bottom bar color
    systemNavigationBarIconBrightness: Brightness.dark, //bottom bar icons*/
      ));

  runApp(_widgetForRoute());
}

Widget _widgetForRoute(/*String route*/) {
  return const MyApp();
}
