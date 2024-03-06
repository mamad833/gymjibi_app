
import '../../model/response/respose_panel_user.dart';

abstract class ProfileUserBaseState {}

class ProfileUserInitialState extends ProfileUserBaseState {}

class ProfileUserLoadingState extends ProfileUserBaseState {}

class ProfileUserSuccessState extends ProfileUserBaseState {
  final PanelProfileUserResponse response;

  ProfileUserSuccessState({required this.response});
}

class ProfileUserFailedState extends ProfileUserBaseState {
  final String message;

  ProfileUserFailedState({required this.message});
}
