import 'package:flutter/material.dart';
import 'dart:math' as math;

class WeightSlider extends StatelessWidget {
  late int minValue;
  late int maxValue;
  late double width;
  late int value;
  late ValueChanged<int> onChanged;
  ScrollController? scrollController;
  double get itemExtent => width / 3;

  WeightSlider(
      {Key? key,
      required this.minValue,
      required this.maxValue,
      required this.value,
      required this.onChanged,
      required this.width})
      : super(key: key) {
    scrollController = ScrollController(
      initialScrollOffset: (value - minValue) * width / 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = maxValue - minValue + 3;
    return NotificationListener(
        onNotification: onNotification,
        child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemExtent: itemExtent,
            itemCount: itemCount,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final int value = indexToValue(index);
              bool isExtra = index == 0 || index == itemCount - 1;
              return isExtra
                  ? Container()
                  : GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () => _animateTo(value, durationMillis: 50),
                      child: FittedBox(
                        child: Text(
                          value.toString(),
                          style: getTextStyle(value),
                        ),
                        fit: BoxFit.scaleDown,
                      ),
                    );
            }));
  }

  _animateTo(int valueToSelect, {int durationMillis = 200}) {
    double targetExtent = (valueToSelect - minValue) * itemExtent;
    scrollController!.animateTo(
      targetExtent,
      duration: Duration(milliseconds: durationMillis),
      curve: Curves.decelerate,
    );
  }

  int offsetToMiddleIndex(double offset) {
    return (offset + width / 2) ~/ itemExtent;
  }

  int _offsetToMiddleValue(double offset) {
    int indexOfMiddleElement = offsetToMiddleIndex(offset);
    int middleValue = indexToValue(indexOfMiddleElement);
    middleValue = math.max(minValue, math.min(maxValue, middleValue));
    return middleValue;
  }

  bool onNotification(Notification notification) {
    if (notification is ScrollNotification) {
      int middleValue = _offsetToMiddleValue(notification.metrics.pixels);

      if (notification is ScrollEndNotification) {
        _animateTo(middleValue);
      }

      if (middleValue != value) {
        onChanged(middleValue);
      }
    }
    return true;
  }

  int indexToValue(int index) {
    return minValue + (index - 1);
  }

  TextStyle _getDefaultTextStyle() {
    return const TextStyle(
      color: Color(0xFFF4aF1B),
      fontSize: 14.0,
    );
  }

  TextStyle _getHighlightTextStyle() {
    return const TextStyle(
      color: Color.fromRGBO(77, 123, 243, 1.0),
      fontSize: 28.0,
    );
  }

  TextStyle getTextStyle(int itemValue) {
    return itemValue == value
        ? _getHighlightTextStyle()
        : _getDefaultTextStyle();
  }
}
