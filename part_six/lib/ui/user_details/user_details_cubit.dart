import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:part_six/ui/user_details/user_details_initial_params.dart';
import 'package:part_six/ui/user_details/user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsState.initial());

  void onInit(UserDetailsInitialParams initialParams) => emit(state.copyWith(user: initialParams.user));
}
