import 'package:flutter/material.dart';

TextStyle buildTextStyle(
  BuildContext context, {
  double size,
}) {
  return TextStyle(
    color: Colors.white,
    fontSize: size ?? Theme.of(context).textTheme.headline5.fontSize,
  );
}
