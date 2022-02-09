import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screen/homeScreen.dart';

void main() {
  runApp(ProviderScope(child: Day10()));
}

class Day10 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "Day 12",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
