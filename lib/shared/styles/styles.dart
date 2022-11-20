import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'colors.dart';

const defaultColr = Colors.deepOrange;

class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const TitleText(
      {required this.text,
      this.fontSize = 18,
      this.color = LightColor.titleTextColor,
      this.fontWeight = FontWeight.w800});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      style:
          TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
    );
  }
}
