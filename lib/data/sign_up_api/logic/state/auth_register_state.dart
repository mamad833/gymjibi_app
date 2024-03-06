import 'package:equatable/equatable.dart';

abstract class SignUpBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpInitialState extends SignUpBaseState {}

class SignUpLoadingState extends SignUpBaseState {}

class SignUpSuccessState extends SignUpBaseState {}

class SignUpFailState extends SignUpBaseState {
  final String message;

  SignUpFailState({required this.message});
}
