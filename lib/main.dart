import 'package:exploring_riverpod/Screens/dropDownButtonScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: Day9()));
}

class Day9 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return MaterialApp(
      title: "Day 9",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.redAccent.withOpacity(0.2),
      ),
      debugShowCheckedModeBanner: false,
      home: DropDownButtonScreens(),
    );
  }
}
