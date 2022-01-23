import 'package:flutter_riverpod/flutter_riverpod.dart';

final appNameRiverpod = Provider<String>((ref) => "Exploring Riverpod");
final stringRiverpod = Provider<String>((ref) => "Kishor Kc");
final intRiverpod = Provider<int>((ref) => 14);
final doubleRiverpod = Provider<double>((ref) => 5.66);
final listRiverpod = Provider<List<String>>(
  (ref) => [
    "Flutter",
    "Dart",
    "Firebase",
    "Javascript",
    "Node Js",
    "MongoDB",
    "Python",
    "Java",
    "Postgres",
    "Nestjs"
  ],
);