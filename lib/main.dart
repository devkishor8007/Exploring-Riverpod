import 'package:exploring_riverpod/Screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: Day7()));
}

final darkThemeRiverpod = StateProvider<bool>((ref) => false);

class Day7 extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final watchDarkThemeRiverpod = watch(darkThemeRiverpod);
    return MaterialApp(
      title: "Day 7",
      theme:
          watchDarkThemeRiverpod.state ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
