import 'package:exploring_riverpod/model/data.dart';
import 'package:http/http.dart' as http;

class DataService {
  List<Person> getJokes;
  String url = "https://jsonplaceholder.typicode.com/comments";

  Future<List<Person>> getListJokesApi() async {
    var resp = await http.get(Uri.parse(url));
    getJokes = personFromJson(resp.body);
    return getJokes;
  }
}
