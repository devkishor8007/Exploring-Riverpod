// import 'package:exploring_riverpod/page/switchPage.dart';
import 'package:exploring_riverpod/page/switchPageNotifer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: Day3()));
}

class Day3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Day 3",
      theme: ThemeData(
        canvasColor: Colors.teal.withOpacity(0.3),
      ),
      debugShowCheckedModeBanner: false,
      // home: SwitchHomePage(),
      home: SwitchHomeNotifierPage(),
    );
  }
}
