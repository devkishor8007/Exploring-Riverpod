import 'package:exploring_riverpod/model/data.dart';
import 'package:http/http.dart' as http;

class DataService {
  List<JokesApi> getJokes;
  List jokes = [];
  String url = "https://official-joke-api.appspot.com/jokes/ten";

  Future<List<JokesApi>> getListJokesApi() async {
    var resp = await http.get(Uri.parse(url));
    getJokes = jokesApiFromJson(resp.body);
    return getJokes;
  }
}
