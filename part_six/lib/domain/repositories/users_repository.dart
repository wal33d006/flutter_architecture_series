import 'package:dartz/dartz.dart';
import 'package:part_six/domain/entities/user.dart';
import 'package:part_six/domain/failures/users_list_failure.dart';

abstract class UsersRepository {
  Future<Either<UsersListFailure, List<User>>> getUsers();
}