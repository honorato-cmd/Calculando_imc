import 'package:flutter/material.dart';

class Cores {
  static const RED = "RED";
  static const ORANGE = "ORANGE";
  static const YELLOW = "YELLOW";
  static const GREEN = "GREEN";
  static const BLUE = "BLUE";
  static const DEFAULT = "DEFAULT";

  static const _colorMap = {
    RED: Colors.red,
    ORANGE: Colors.orange,
    YELLOW: Colors.yellow,
    GREEN: Colors.green,
    BLUE: Colors.blue,
    DEFAULT: Colors.teal,
  };

  const Cores._();

  static getColorFor(String color) =>
      _colorMap[color.toUpperCase()] ?? _colorMap[DEFAULT];
}

class SO extends StatelessWidget {
  var color = 'red';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColor.getColorFor(color),
      appBar: AppBar(),
    );
  }
}
