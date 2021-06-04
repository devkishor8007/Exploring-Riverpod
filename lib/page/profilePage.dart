import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Welcome to Profile Page",
        style: buildTextStyle(context),
      ),
    );
  }
}
