import 'package:part_three/domain/entities/user.dart';

abstract class UsersRepository {
  Future<List<User>> getUsers();
}