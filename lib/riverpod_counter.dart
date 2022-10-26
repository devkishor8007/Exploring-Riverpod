import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameRiverpod = Provider<String>((ref) => "Exploring Riverpod");

class CounterRiverpod extends ChangeNotifier {
  int _value = 0;

  int get value => _value;

  add() {
    _value++;
    notifyListeners();
  }

  subtract() {
    _value--;
    notifyListeners();
  }
}

final counterNotifierProvider =
    StateNotifierProvider<CounterNotifer, int>((_) => CounterNotifer());

class CounterNotifer extends StateNotifier<int> {
  CounterNotifer() : super(0);

  void add() => state = state + 1;
  void subtract() => state = state - 1;
}
