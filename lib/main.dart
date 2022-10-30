import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screen/homeScreen.dart';

void main() {
  runApp(ProviderScope(child: Day11()));
}

class Day11 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "Day 11",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
