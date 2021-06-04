import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Welcome to Notification Page",
        style: buildTextStyle(context),
      ),
    );
  }
}
