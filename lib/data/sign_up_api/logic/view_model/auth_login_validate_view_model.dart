import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../config/hive_service/hive_service.dart';
import '../../../../config/setup.dart';
import '../../../../config/web_service.dart';
import '../state/auth_register_state.dart';

class SignUpSendPhoneViewModel extends Cubit<SignUpSendPhoneBaseState> {
  SignUpSendPhoneViewModel() : super(SignUpSendPhoneInitialState());

  void signUp({required String phone}) async {
    emit(SignUpSendPhoneLoadingState());

    try {
      var response = await inject<WebService>().dio.post("users/signup", data: {
        "phone": phone,
      });
      print("****************");
      print(response.statusCode);
      emit(SignUpSendPhoneSuccessState());

      print("03");
    } on DioException catch (e) {
      emit(SignUpSendPhoneFailState(message: e.message.toString()));
    } catch (e) {
      emit(SignUpSendPhoneFailState(message: e.toString()));
    }
  }
}

class SignUpSendCodeViewModel extends Cubit<SignUpSendPhoneBaseState> {
  SignUpSendCodeViewModel() : super(SignUpSendPhoneInitialState());

  void signUpCode({required String code, required String phone}) async {
    emit(SignUpSendCodeLoadingState());

    try {
      var response =
          await inject<WebService>().dio.post("users/signup/validate", data: {
        "phone": phone,
        "code": code,
      });

      emit(SignUpSendCodeSuccessState(token: response.data['token']));

      print("03");
    } on DioException catch (e) {
      emit(SignUpSendCodeFailState(message: e.message.toString()));
    } catch (e) {
      emit(SignUpSendCodeFailState(message: e.toString()));
    }
  }
}

class SignUpSendInfoViewModel extends Cubit<SignUpSendInfoBaseState> {
  SignUpSendInfoViewModel() : super(SignUpSendInfoInitialState());

  void signUpFinish({
    required String name,
    required String pass,
    required String token,
  }) async {
    emit(SignUpSendInfoLoadingState());

    try {
      var response =
          await inject<WebService>().dio.post("users/signup/$token", data: {
        "fullname": name,
        "password": pass,
        "role": "customer",
      });
      print("****************");
      print(response.statusCode);
      emit(SignUpSendInfoSuccessState());
      HiveServices.addToken(response.data['token']);
      print("03");
    } on DioException catch (e) {
      emit(SignUpSendInfoFailState(message: e.message.toString()));
    } catch (e) {
      emit(SignUpSendInfoFailState(message: e.toString()));
    }
  }
}
