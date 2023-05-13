import 'package:part_three_dot_five/domain/entities/user.dart';

class UsersListState {
  final List<User> users;
  final bool isLoading;
  final String? error;

  const UsersListState({
    required this.users,
    required this.isLoading,
    this.error,
  });

  factory UsersListState.initial() => const UsersListState(
        users: [],
        isLoading: false,
      );

  UsersListState copyWith({
    List<User>? users,
    bool? isLoading,
    String? error,
  }) =>
      UsersListState(
        users: users ?? this.users,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );
}
