import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_three_dot_five/ui/users_list/users_list_cubit.dart';
import 'package:part_three_dot_five/ui/users_list/users_list_state.dart';
import 'package:part_three_dot_five/ui/widgets/user_card.dart';

class UsersListPage extends StatefulWidget {
  const UsersListPage({super.key});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: BlocProvider.of<UsersListCubit>(context),
          builder: (context, state) {
            final userState = state as UsersListState;
            if (userState.error != null) {
              return Center(child: Text(userState.error!));
            }
            return userState.isLoading
                ? const CircularProgressIndicator()
                : ListView(
                    children: userState.users.map((user) => UserCard(user: user)).toList(),
                  );
          },
        ),
      ),
    );
  }
}
