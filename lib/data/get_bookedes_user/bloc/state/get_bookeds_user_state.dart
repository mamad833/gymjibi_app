
import '../../model/response/respose_get_bookeds_user.dart';

abstract class GetBookedsBaseState {}

class GetBookedsInitialState extends GetBookedsBaseState {}

class GetBookedsLoadingState extends GetBookedsBaseState {}

class GetBookedsSuccessState extends GetBookedsBaseState {
  final List<BookesUser> response;

  GetBookedsSuccessState({required this.response});
}

class GetBookedsFailedState extends GetBookedsBaseState {
  final String message;

  GetBookedsFailedState({required this.message});
}
