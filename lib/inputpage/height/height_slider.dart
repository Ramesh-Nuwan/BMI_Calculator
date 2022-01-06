import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/widget_utils.dart' show screenAwareSize;

const double selectedLabelFontSize = 14.0;
const double circleSize = 32.0;

double circleSizeAdapted(BuildContext context) =>
    screenAwareSize(circleSize, context);

class HeightSlider extends StatelessWidget {
  final int? height;

  const HeightSlider({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SliderLabel(height: height),
          Row(
            children: const <Widget>[
              SliderCircle(),
              Expanded(child: SliderLine()),
            ],
          )
        ],
      ),
    );
  }
}

class SliderLabel extends StatelessWidget {
  final int? height;

  const SliderLabel({Key? key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: screenAwareSize(4.0, context),
          bottom: screenAwareSize(2.0, context)),
      child: Text(
        "$height",
        style: const TextStyle(
            fontSize: selectedLabelFontSize,
            color: Color(0xFF00154F),
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

class SliderCircle extends StatelessWidget {
  const SliderCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: circleSizeAdapted(context),
      height: circleSizeAdapted(context),
      decoration: const BoxDecoration(
        color: Color(0xFF00154F),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.unfold_more,
        color: const Color(0xFFF4aF1B),
        size: 0.6 * circleSizeAdapted(context),
      ),
    );
  }
}

class SliderLine extends StatelessWidget {
  const SliderLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
          40,
          (i) => Expanded(
                  child: Container(
                height: 2.0,
                decoration: BoxDecoration(
                    color: i.isEven
                        ? Theme.of(context).primaryColor
                        : Colors.white),
              ))),
    );
  }
}
