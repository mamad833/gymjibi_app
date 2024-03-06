import 'package:gymjibi/data/get_all_gym/model/response/respose_get_all_gym.dart';

abstract class GetAllGymBaseState {}

class GetAllInitialState extends GetAllGymBaseState {}

class GetAllLoadingState extends GetAllGymBaseState {}

class GetAllSuccessState extends GetAllGymBaseState {
  final List<ResponseGetGymModel> response;

  GetAllSuccessState({required this.response});
}

class GetAllFailedState extends GetAllGymBaseState {
  final String message;

  GetAllFailedState({required this.message});
}
