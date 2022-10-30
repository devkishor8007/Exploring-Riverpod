import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameRiverpod = Provider<String>((ref) => "Exploring Riverpod");
final appsettingRiverpod = Provider<String>((ref) => "Setting");
final widgetNameRiverpod = Provider<String>((ref) => "Text Changer Font-Size");
final hopeRiverpod = Provider<String>(
    (ref) => "Hope You'll Understand This! \nKeep Learning and Stay Safe");

// Change Notifier
class ChangeAllFont extends ChangeNotifier {
  double _fontSize = 15;

  double get fontSize => _fontSize;

  increaseSize(val) {
    _fontSize = val;
    notifyListeners();
  }
}

// state notifier
final changeNotifierProvider =
    StateNotifierProvider<ChangeFontNotifier, double>(
        (_) => ChangeFontNotifier());

class ChangeFontNotifier extends StateNotifier<double> {
  ChangeFontNotifier() : super(15.0);

  void increaseSize(v) => state = v;
}
