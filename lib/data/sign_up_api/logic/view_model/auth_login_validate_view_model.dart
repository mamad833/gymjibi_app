import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../config/hive_service/hive_service.dart';
import '../../../../config/setup.dart';
import '../../../../config/web_service.dart';
import '../state/auth_register_state.dart';

class SignUpViewModel extends Cubit<SignUpBaseState> {
  SignUpViewModel() : super(SignUpInitialState());

  void signUp({required String phone}) async {
    emit(SignUpLoadingState());

    try {
      var response = await inject<WebService>().dio.post("users/signup", data: {
        "phone": phone,
      });

      emit(SignUpSuccessState());

      print("03");
    } on DioException catch (e) {
      emit(SignUpFailState(message: e.message.toString()));
    } catch (e) {
      emit(SignUpFailState(message: e.toString()));
    }
  }
}
