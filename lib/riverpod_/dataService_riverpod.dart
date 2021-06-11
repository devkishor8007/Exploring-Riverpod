import 'package:exploring_riverpod/model/data.dart';
import 'package:exploring_riverpod/service/dataService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiService = Provider((ref) => DataService());

final dataServicesRiverpod = FutureProvider<List<JokesApi>>((ref) {
  return ref.read(apiService).getListJokesApi();
});
