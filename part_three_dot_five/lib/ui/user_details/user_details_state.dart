import 'package:part_three_dot_five/domain/entities/user.dart';

class UserDetailsState {
  final User user;

  const UserDetailsState({required this.user});

  factory UserDetailsState.initial() => const UserDetailsState(user: User.empty());

  UserDetailsState copyWith({User? user}) => UserDetailsState(user: user ?? this.user);
}
