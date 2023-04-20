import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_one/users_list_cubit.dart';
import 'package:part_one/users_list_page.dart';

void main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UsersListCubit()..fetchUsers())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UsersListPage(),
    );
  }
}
