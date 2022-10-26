import 'package:exploring_riverpod/page/showNameNotifier_page.dart';
// import 'package:exploring_riverpod/page/showName_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: Day4()));
}

class Day4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Day 5",
      theme: ThemeData(
        canvasColor: Colors.tealAccent.withOpacity(0.3),
      ),
      debugShowCheckedModeBanner: false,
      // home: ShowNamePage(), // use for change notifier
      home: ShowNameNotifierPage(), // use for state notifier
    );
  }
}
