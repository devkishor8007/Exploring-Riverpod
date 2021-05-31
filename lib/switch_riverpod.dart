import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameRiverpod = Provider<String>((ref) => "Exploring Riverpod");
final singleswitchName = Provider<String>((ref) => "Single Switch Widget");
final multipleswitchName = Provider<String>((ref) => "Multiple Switch Widget");
final hopeRiverpod = Provider<String>(
    (ref) => "Hope You'll Understand This! \nKeep Learning and Stay Safe");

class SwitchWidget extends ChangeNotifier {
  bool _value = false;

  bool get value => _value;

  onChanged(changeval) {
    _value = changeval;
    notifyListeners();
  }
}

class MultipleSwitchWidget extends ChangeNotifier {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

  bool get value1 => _value1;
  bool get value2 => _value2;
  bool get value3 => _value3;

  onChangedMultipleOne(changeval1) {
    _value1 = changeval1;
    notifyListeners();
  }

  onChangedMultipleTwo(changeval2) {
    _value2 = changeval2;
    notifyListeners();
  }

  onChangedMultipleThree(changeval3) {
    _value3 = changeval3;
    notifyListeners();
  }
}
