import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_two/domain/repositories/users_repository.dart';
import 'package:part_two/ui/users_list/users_list_state.dart';

class UsersListCubit extends Cubit<UsersListState> {
  final UsersRepository usersRepository;

  UsersListCubit(this.usersRepository) : super(UsersListState.empty());

  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true));
    final users = await usersRepository.getUsers();
    emit(state.copyWith(users: users, isLoading: false));
  }
}
