import 'dart:convert';

import 'package:part_three/domain/entities/user.dart';
import 'package:part_three/data/user_json.dart';
import 'package:http/http.dart' as http;
import 'package:part_three/domain/repositories/users_repository.dart';

class RestApiUsersRepository implements UsersRepository {
  @override
  Future<List<User>> getUsers() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    return list.map((e) => UserJson.fromJson(e).toDomain()).toList();
  }
}
