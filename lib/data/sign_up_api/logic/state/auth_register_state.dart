import 'package:equatable/equatable.dart';

abstract class SignUpSendPhoneBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpSendPhoneInitialState extends SignUpSendPhoneBaseState {}

class SignUpSendPhoneLoadingState extends SignUpSendPhoneBaseState {}

class SignUpSendPhoneSuccessState extends SignUpSendPhoneBaseState {}

class SignUpSendPhoneFailState extends SignUpSendPhoneBaseState {
  final String message;

  SignUpSendPhoneFailState({required this.message});
}




abstract class SignUpSendCodeBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpSendCodeInitialState extends SignUpSendPhoneBaseState {}

class SignUpSendCodeLoadingState extends SignUpSendPhoneBaseState {}

class SignUpSendCodeSuccessState extends SignUpSendPhoneBaseState {
  final String token;

  SignUpSendCodeSuccessState({required this.token});
}

class SignUpSendCodeFailState extends SignUpSendPhoneBaseState {
  final String message;

  SignUpSendCodeFailState({required this.message});
}




abstract class SignUpSendInfoBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class SignUpSendInfoInitialState extends SignUpSendInfoBaseState {}

class SignUpSendInfoLoadingState extends SignUpSendInfoBaseState {}

class SignUpSendInfoSuccessState extends SignUpSendInfoBaseState {}

class SignUpSendInfoFailState extends SignUpSendInfoBaseState {
  final String message;

  SignUpSendInfoFailState({required this.message});
}
