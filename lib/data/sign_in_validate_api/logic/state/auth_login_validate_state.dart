import 'package:equatable/equatable.dart';

abstract class LoginValidateBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginValidateInitialState extends LoginValidateBaseState {}

class LoginValidateLoadingState extends LoginValidateBaseState {}

class LoginValidateSuccessState extends LoginValidateBaseState {}

class LoginValidateFailState extends LoginValidateBaseState {
  final String message;

  LoginValidateFailState({required this.message});
}
