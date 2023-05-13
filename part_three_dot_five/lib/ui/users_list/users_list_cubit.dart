import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_three_dot_five/domain/repositories/users_repository.dart';
import 'package:part_three_dot_five/ui/users_list/users_list_state.dart';

class UsersListCubit extends Cubit<UsersListState> {
  final UsersRepository usersRepository;

  UsersListCubit(this.usersRepository) : super(UsersListState.initial());

  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true, error: null));
    final usersResponse = await usersRepository.getUsers();
    usersResponse.fold(
      (error) {
        // show dialog error on UI
        // after we add navigation layer
        emit(state.copyWith(error: error.error));
      },
      (users) {
        emit(state.copyWith(users: users, isLoading: false));
      },
    );
  }
}
