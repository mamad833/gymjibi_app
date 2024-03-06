import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../config/hive_service/hive_service.dart';
import '../../../../config/setup.dart';
import '../../../../config/web_service.dart';
import '../state/auth_login_validate_state.dart';

class LoginValidateViewModel extends Cubit<LoginValidateBaseState> {
  LoginValidateViewModel() : super(LoginValidateInitialState());

  void loginValidate({required String phone,required String code}) async {
    emit(LoginValidateLoadingState());

    try {
      var response =
          await inject<WebService>().dio.post("users/signin/validate", data: {
            "phone": phone,
            "code": code
          });

      emit(LoginValidateSuccessState());

      print("03");
    } on DioException catch (e) {
      emit(LoginValidateFailState(message: e.message.toString()));
    } catch (e) {
      emit(LoginValidateFailState(message: e.toString()));
    }
  }
}
