import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_six/ui/users_list/users_list_cubit.dart';
import 'package:part_six/ui/users_list/users_list_state.dart';
import 'package:part_six/ui/widgets/user_card.dart';

class UsersListPage extends StatefulWidget {
  final UsersListCubit cubit;

  const UsersListPage({super.key, required this.cubit});

  @override
  State<UsersListPage> createState() => _UsersListPageState();
}

class _UsersListPageState extends State<UsersListPage> {
  UsersListCubit get cubit => widget.cubit;

  @override
  void initState() {
    super.initState();
    // TODO: Improve this
    cubit.navigator.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
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
