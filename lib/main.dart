import 'package:exploring_riverpod/page/bottomNavigation.notifer.page.dart';
// import 'package:exploring_riverpod/page/bottomNavigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: Day4()));
}

class Day4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Day 6",
      theme: ThemeData(
        canvasColor: Colors.purpleAccent.withOpacity(0.3),
      ),
      debugShowCheckedModeBanner: false,
      // home: BottomNavigationPage(), // use change notifer
      home: BottomNavigationNotifierPage(), // use state notifer
    );
  }
}
