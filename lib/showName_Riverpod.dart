import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameRiverpod = Provider<String>((ref) => "Exploring Riverpod");
final widgetNameRiverpod = Provider<String>((ref) => "TextField Widget");
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

final textRiverPod =
    StateNotifierProvider<TextNotifier, String>((_) => TextNotifier());

class TextNotifier extends StateNotifier<String> {
  TextNotifier() : super('Kishor KC');

  void onChangedVlue(String val) => state = val;
}
