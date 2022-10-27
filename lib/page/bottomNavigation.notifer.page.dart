import 'package:exploring_riverpod/riverpod/bottomNavigation_Riverpod.dart';
import 'package:exploring_riverpod/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomNavigationNotifierPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomImpl = ref.watch(bottomNotifierProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        currentIndex: bottomImpl,
        onTap: (val) {
          ref.read(bottomNotifierProvider.notifier).changeValue(val);
        },
        items: items,
      ),
      // makeBottomNavigationBar(bottomImpl, context),
      body: getOpenWidget[bottomImpl],
    );
  }

  // Widget makeBottomNavigationBar(
  //     BottomNavigationBarWidget implementBottomNavigation,
  //     BuildContext context) {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     selectedItemColor: Colors.white,
  //     unselectedItemColor: Colors.grey,
  //     showUnselectedLabels: false,
  //     currentIndex: implementBottomNavigation.currentValue,
  //     onTap: (val) {
  //       implementBottomNavigation.changeValue(val);
  //     },
  //     items: items,
  //   );
  // }
}
