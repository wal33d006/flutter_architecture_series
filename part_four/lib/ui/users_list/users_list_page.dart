import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_four/ui/users_list/users_list_cubit.dart';
import 'package:part_four/ui/users_list/users_list_initial_params.dart';
import 'package:part_four/ui/users_list/users_list_state.dart';
import 'package:part_four/ui/widgets/user_card.dart';

class UsersListPage extends StatefulWidget {
  final UsersListInitialParams initialParams;

  const UsersListPage({super.key, required this.initialParams});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  late UsersListCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<UsersListCubit>(context);
    // TODO: Improve this
    cubit.navigator.context = context;
  }

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
                    children: userState.users
                        .map(
                          (user) => UserCard(
                            user: user,
                            onTap: () => cubit.onTapUser(user),
                          ),
                        )
                        .toList(),
                  );
          },
        ),
      ),
    );
  }
}
