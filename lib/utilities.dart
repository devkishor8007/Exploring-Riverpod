import 'package:flutter/material.dart';

TextStyle buildTextStyle(
  BuildContext context, {
  double size,
  Color color,
  FontWeight fontWeight,
}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontWeight: fontWeight ?? FontWeight.normal,
    fontSize: size ?? Theme.of(context).textTheme.headline5.fontSize,
  );
}
