import 'package:exploring_riverpod/page/dashboardPage.dart';
import 'package:exploring_riverpod/page/notificationPage.dart';
import 'package:exploring_riverpod/page/profilePage.dart';
import 'package:exploring_riverpod/bottomNavigation_Riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'homePage.dart';

final callingBottomNavigation =
    ChangeNotifierProvider<BottomNavigationBarWidget>(
        (ref) => BottomNavigationBarWidget());

// ignore: must_be_immutable
class BottomNavigationPage extends ConsumerWidget {
  List<Widget> getOpenWidget = [
    HomePage(),
    ProfilePage(),
    NotificationPage(),
    DashBoardPage(),
  ];
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final implementBottomNavigation = watch(callingBottomNavigation);
    return Scaffold(
      bottomNavigationBar:
          makeBottomNavigationBar(implementBottomNavigation, context),
      body: getOpenWidget[implementBottomNavigation.currentValue],
    );
  }

  Widget makeBottomNavigationBar(
      BottomNavigationBarWidget implementBottomNavigation,
      BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
      currentIndex: implementBottomNavigation.currentValue,
      onTap: (val) {
        context.read(callingBottomNavigation).changeValue(val);
      },
      items: [
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
      ],
    );
  }
}
