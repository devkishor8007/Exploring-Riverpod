import 'package:exploring_riverpod/page/sliderPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: Day4()));
}

class Day4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Day 4",
      theme: ThemeData(
        canvasColor: Colors.orangeAccent.withOpacity(0.3),
      ),
      debugShowCheckedModeBanner: false,
      home: SliderHomePage(),
    );
  }
}
