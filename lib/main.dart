import 'package:exploring_riverpod/Screens/textSizeChangerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: Day8()));
}

class Day8 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: "Day 8",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.greenAccent.withOpacity(0.2),
      ),
      debugShowCheckedModeBanner: false,
      home: TextSizeChangerScreen(),
    );
  }
}
