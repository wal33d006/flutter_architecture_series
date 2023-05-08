import 'package:dartz/dartz.dart';
import 'package:part_three/domain/entities/user.dart';
import 'package:part_three/domain/failures/users_list_failure.dart';

abstract class UsersRepository {
  Future<Either<UsersListFailure, List<User>>> getUsers();
}