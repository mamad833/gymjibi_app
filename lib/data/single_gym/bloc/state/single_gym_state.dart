import 'package:gymjibi/data/single_gym/model/response/respose_single_gym.dart';

abstract class SingleGymBaseState {}

class SingleGymInitialState extends SingleGymBaseState {}

class SingleGymLoadingState extends SingleGymBaseState {}

class SingleGymSuccessState extends SingleGymBaseState {
  final ResponseGetSingelGym response;

  SingleGymSuccessState({required this.response});
}

class SingleGymFailedState extends SingleGymBaseState {
  final String message;

  SingleGymFailedState({required this.message});
}
