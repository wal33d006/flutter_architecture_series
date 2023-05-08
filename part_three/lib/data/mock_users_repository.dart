import 'package:part_three/domain/entities/user.dart';
import 'package:part_three/domain/repositories/users_repository.dart';

class MockUsersRepository implements UsersRepository {
  @override
  Future<List<User>> getUsers() async => [
        User(
          id: 123,
          name: 'name',
          username: 'username',
          email: 'email',
          phone: 'phone',
          website: 'website',
        )
      ];
}
