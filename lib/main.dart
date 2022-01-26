import 'package:exploring_riverpod/Screens/homeScreen.dart';
import 'package:exploring_riverpod/riverpod_apply.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: Day7()));
}

class Day7 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchDarkThemeRiverpod = ref.watch(darkThemeRiverpod);
    return MaterialApp(
      title: "Day 7",
      theme: watchDarkThemeRiverpod ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
