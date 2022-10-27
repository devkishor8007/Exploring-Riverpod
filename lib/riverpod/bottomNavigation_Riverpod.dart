import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameRiverpod = Provider<String>((ref) => "Exploring Riverpod");
final widgetNameRiverpod =
    Provider<String>((ref) => "Bottom Navigation Bar Widget");
final hopeRiverpod = Provider<String>(
    (ref) => "Hope You'll Understand This! \nKeep Learning and Stay Safe");

// Change Notifier
final callingBottomNavigation =
    ChangeNotifierProvider<BottomNavigationBarWidget>(
        (ref) => BottomNavigationBarWidget());

class BottomNavigationBarWidget extends ChangeNotifier {
  int _currentValue = 0;

  int get currentValue => _currentValue;

  changeValue(newValue) {
    _currentValue = newValue;
    notifyListeners();
  }
}

// state notifier
final bottomNotifierProvider =
    StateNotifierProvider<BottomNotifier, int>((_) => BottomNotifier());

class BottomNotifier extends StateNotifier<int> {
  BottomNotifier() : super(0);

  changeValue(v) => state = v;
}
