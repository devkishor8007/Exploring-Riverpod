import 'package:exploring_riverpod/page/basicPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Day 2",
      theme: ThemeData(
        canvasColor: Colors.purpleAccent.withOpacity(0.3),
      ),
      debugShowCheckedModeBanner: false,
      home: DataTypePage(),
    );
  }
}