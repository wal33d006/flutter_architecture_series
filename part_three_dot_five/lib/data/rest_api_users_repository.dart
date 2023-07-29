import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:part_three_dot_five/domain/entities/user.dart';
import 'package:part_three_dot_five/data/user_json.dart';
import 'package:http/http.dart' as http;
import 'package:part_three_dot_five/domain/failures/users_list_failure.dart';
import 'package:part_three_dot_five/domain/repositories/users_repository.dart';

class RestApiUsersRepository implements UsersRepository {
  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      var list = jsonDecode(response.body) as List;
      // status code handling
      // json parsing handling
      return right(list.map((e) => UserJson.fromJson(e).toDomain()).toList());
    } catch (ex) {
      return left(UsersListFailure(error: ex.toString()));
    }
  }
}
