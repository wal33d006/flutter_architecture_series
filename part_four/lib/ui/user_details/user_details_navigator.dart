import 'package:flutter/material.dart';
import 'package:part_four/navigation/app_navigator.dart';
import 'package:part_four/ui/user_details/user_details_initial_params.dart';
import 'package:part_four/ui/user_details/user_details_page.dart';

class UserDetailsNavigator {}

mixin UserDetailsRoute {
  openUserDetails(UserDetailsInitialParams initialParams) {
    navigator.push(
      context,
      UserDetailsPage(initialParams: initialParams),
    );
  }

  AppNavigator get navigator;

  BuildContext get context;
}
