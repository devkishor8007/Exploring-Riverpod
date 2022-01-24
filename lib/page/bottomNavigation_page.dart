import 'package:exploring_riverpod/riverpod/bottomNavigation_Riverpod.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final implementBottomNavigation = ref.watch(callingBottomNavigation);
    return Scaffold(
      bottomNavigationBar:
          makeBottomNavigationBar(implementBottomNavigation, context),
      body: getOpenWidget[implementBottomNavigation.currentValue],
    );
  }

  Widget makeBottomNavigationBar(
      BottomNavigationBarWidget implementBottomNavigation,
      BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: false,
      currentIndex: implementBottomNavigation.currentValue,
      onTap: (val) {
        implementBottomNavigation.changeValue(val);
      },
      items: items,
    );
  }
}
