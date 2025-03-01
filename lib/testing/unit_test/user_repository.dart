import 'dart:convert';
import 'dart:io';
import 'user_model.dart';
import 'package:http/http.dart' as http;

class Repository {

  final http.Client client;
  Repository(this.client);

  Future<List<User>> getUserData() async {
    const userUrl = "https://jsonplaceholder.typicode.com/users/1";
    final response = await client.get(Uri.parse(userUrl));

    if (response.statusCode == 200) {

      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => User.fromJson(e)).toList();
      
     // userFromJson(response.body);
    }
    throw Exception('Failed To Load Data');
  }
}
