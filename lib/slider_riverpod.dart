import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameRiverpod = Provider<String>((ref) => "Exploring Riverpod");
final whatWidgetRivepod = Provider<String>((ref) => "Slider Widget");
final hopeRiverpod = Provider<String>(
    (ref) => "Hope You'll Understand This! \nKeep Learning and Stay Safe");

class SliderWidget extends ChangeNotifier {
  double _value = 0.0;
  double get value => _value;

  onchanged(val) {
    _value = val;
    notifyListeners();
  }
}

final sliderNotifierRiverpod = StateNotifierProvider<SliderNotifier, double>((_)=> SliderNotifier());

class SliderNotifier extends StateNotifier<double> {
  SliderNotifier(): super(0.0);

  onchanged(val) => state = val;
}
