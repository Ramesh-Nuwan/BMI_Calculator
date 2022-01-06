import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/widget_utils.dart' show screenAwareSize;

class GenderLine extends StatelessWidget {
  const GenderLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: screenAwareSize(8.0, context),
          bottom: screenAwareSize(6.0, context)),
      child: Container(
        height: screenAwareSize(8.0, context),
        width: 1.0,
        color: const Color(0xFFF4aF1B),
      ),
    );
  }
}
