import "dart:convert";

import "package:app/data.dart";
import "package:http/http.dart" as http;

Future<List<User>> getAllUsers() async {
  List<User> result = [];
  final http.Response response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  final List json = jsonDecode(response.body);
  for (Map userJson in json) {
    User parsedUser = User.fromJson(userJson);
    result.add(parsedUser);
  }
  return result;
}
