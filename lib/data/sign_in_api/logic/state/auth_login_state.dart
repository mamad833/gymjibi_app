import 'package:equatable/equatable.dart';

abstract class LoginBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginBaseState {}

class LoginLoadingState extends LoginBaseState {}

class LoginSuccessState extends LoginBaseState {}

class LoginFailState extends LoginBaseState {
  final String message;

  LoginFailState({required this.message});
}
