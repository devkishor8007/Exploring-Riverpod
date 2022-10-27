import 'package:exploring_riverpod/page/dashboardPage.dart';
import 'package:exploring_riverpod/page/homePage.dart';
import 'package:exploring_riverpod/page/notificationPage.dart';
import 'package:exploring_riverpod/page/profilePage.dart';
import 'package:flutter/material.dart';

TextStyle buildTextStyle(
  BuildContext context, {
  double? size,
}) {
  return TextStyle(
    color: Colors.white,
    fontSize: size ?? Theme.of(context).textTheme.headline5!.fontSize,
  );
}

Widget makeCenter(BuildContext context, String name) => Center(
      child: Text(
        name,
        style: buildTextStyle(context),
      ),
    );

List<Widget> getOpenWidget = [
  HomePage(),
  ProfilePage(),
  NotificationPage(),
  DashBoardPage(),
];

List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(
    label: "Home",
    icon: Icon(Icons.home_sharp),
  ),
  BottomNavigationBarItem(
    label: "Profile",
    icon: Icon(Icons.person),
  ),
  BottomNavigationBarItem(
    label: "Notification",
    icon: Icon(Icons.notifications_none_rounded),
  ),
  BottomNavigationBarItem(
    label: "Dashboard",
    icon: Icon(Icons.dashboard),
  ),
];
