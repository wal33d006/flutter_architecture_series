import 'package:dartz/dartz.dart';
import 'package:part_three_dot_five/domain/entities/user.dart';
import 'package:part_three_dot_five/domain/failures/users_list_failure.dart';
import 'package:part_three_dot_five/domain/repositories/users_repository.dart';

class MockUsersRepository implements UsersRepository {
  @override
  Future<Either<UsersListFailure, List<User>>> getUsers() async => right([
        User(
          id: 123,
          name: 'name',
          username: 'username',
          email: 'email',
          phone: 'phone',
          website: 'website',
        )
      ]);
}
