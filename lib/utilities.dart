import 'package:flutter/material.dart';

TextStyle buildTextStyle(
  BuildContext context, {
  Color color,
  double size,
}) {
  return TextStyle(
    color: color,
    fontSize: size ?? 16,
  );
}
