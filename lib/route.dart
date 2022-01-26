import 'package:flutter/material.dart';

pop(BuildContext context) {
  return Navigator.pop(context);
}

push(BuildContext context, Widget widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => widget),
  );
}
