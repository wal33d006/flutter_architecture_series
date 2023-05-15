import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_four/ui/user_details/user_details_cubit.dart';
import 'package:part_four/ui/user_details/user_details_initial_params.dart';
import 'package:part_four/ui/user_details/user_details_state.dart';

class UserDetailsPage extends StatefulWidget {
  final UserDetailsInitialParams initialParams;

  const UserDetailsPage({
    Key? key,
    required this.initialParams,
  }) : super(key: key);

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {

  late UserDetailsCubit cubit;

  @override
  void initState() {
    super.initState();
    // TODO: Fix this later
    cubit = BlocProvider.of<UserDetailsCubit>(context);
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder(
          bloc: cubit,
          builder: (context, state) {
            state as UserDetailsState;
            return ListTile(
              title: Text(state.user.name),
              subtitle: Text(state.user.email),
            );
          }
        ),
      ),
    );
  }
}
