import 'package:fpdart/fpdart.dart';
import 'package:part_three_dot_five/domain/entities/user.dart';
import 'package:part_three_dot_five/domain/failures/users_list_failure.dart';

abstract class UsersRepository {
  Future<Either<UsersListFailure, List<User>>> getUsers();
}