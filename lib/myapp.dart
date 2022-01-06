import 'package:flutter/material.dart';
import 'package:bmi_calculator/inputpage/input_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Schyler',
      ),
      debugShowCheckedModeBanner: false,
      home: const InputPage(),
    );
  }
}
