import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameRiverpod = Provider<String>((ref) => "Exploring Riverpod");
final widgetNameRiverpod =
    Provider<String>((ref) => "Bottom Navigation Bar Widget");
final hopeRiverpod = Provider<String>(
    (ref) => "Hope You'll Understand This! \nKeep Learning and Stay Safe");

class TextFormWidget extends ChangeNotifier {
  String _text = "Kishor Kc";

  String get text => _text;

  onChangedVlue(String val) {
    _text = val;
    notifyListeners();
  }
}

class BottomNavigationBarWidget extends ChangeNotifier {
  int _currentValue = 0;

  int get currentValue => _currentValue;

  changeValue(newValue) {
    _currentValue = newValue;
    notifyListeners();
  }
}
