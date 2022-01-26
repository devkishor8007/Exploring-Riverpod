import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameRiverpod = Provider<String>((ref) => "Exploring Riverpod");
final appsettingRiverpod = Provider<String>((ref) => "Setting");
final widgetNameRiverpod =
    Provider<String>((ref) => "Dark Theme using Switch Widget");
final hopeRiverpod = Provider<String>(
    (ref) => "Hope You'll Understand This! \nKeep Learning and Stay Safe");

final darkThemeRiverpod = StateProvider<bool>((ref) => false);
