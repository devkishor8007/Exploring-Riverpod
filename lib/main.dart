import 'package:exploring_riverpod/page/counterPage-notifer.dart';
// import 'package:exploring_riverpod/page/counterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.indigo.withBlue(2),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.lightBlue.withBlue(3)),
      ),
      debugShowCheckedModeBanner: false,
      // home: CounterPage(),  // for ChangeNotifier
      home: CounterNotiferPage(), // for state notifer
    );
  }
}
