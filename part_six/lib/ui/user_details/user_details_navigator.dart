import 'package:flutter/material.dart';
import 'package:part_six/main.dart';
import 'package:part_six/navigation/app_navigator.dart';
import 'package:part_six/ui/user_details/user_details_initial_params.dart';
import 'package:part_six/ui/user_details/user_details_page.dart';

class UserDetailsNavigator {}

mixin UserDetailsRoute {
  openUserDetails(UserDetailsInitialParams initialParams) {
    navigator.push(
      context,
      UserDetailsPage(cubit: getIt(param1: initialParams)),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
