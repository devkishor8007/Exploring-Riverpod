import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameRiverpod = Provider<String>((ref) => "Exploring Riverpod");
final widgetNameRiverpod = Provider<String>((ref) => "Drop-Down Button Widget");
final hopeRiverpod = Provider<String>(
    (ref) => "Hope You'll Understand This! \nKeep Learning and Stay Safe");

class DropdownButtonRiverpod extends ChangeNotifier {
  List<String> _countryNameList = ["Nepal", "USA", "Japan", "China", "India"];
  String _currentCountryName = "Nepal";

  List<String> get countryNameList => _countryNameList;
  String get currentCountryName => _currentCountryName;

  onChangeCountryName(newVal) {
    _currentCountryName = newVal;
    notifyListeners();
  }
}
