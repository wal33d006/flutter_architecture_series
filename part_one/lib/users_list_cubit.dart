import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_one/user_json.dart';
import 'package:part_one/users_list_state.dart';
import 'package:http/http.dart' as http;

class UsersListCubit extends Cubit<UsersListState> {
  UsersListCubit() : super(UsersListState.empty());

  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true));
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
    var response = await http.get(url);
    var list = jsonDecode(response.body) as List;
    final users = list.map((e) => UserJson.fromJson(e)).toList();
    emit(state.copyWith(users: users, isLoading: false));
  }
}
