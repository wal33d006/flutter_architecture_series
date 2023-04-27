import 'package:part_two/domain/entities/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}