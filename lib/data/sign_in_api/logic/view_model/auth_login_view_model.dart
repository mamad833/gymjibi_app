import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../../../../config/hive_service/hive_service.dart';
import '../../../../config/setup.dart';
import '../../../../config/web_service.dart';
import '../state/auth_login_state.dart';

class LoginViewModel extends Cubit<LoginBaseState> {
  LoginViewModel() : super(LoginInitialState());

  void login({required String phone,required String pass}) async {
    emit(LoginLoadingState());

    try {
      var response =
          await inject<WebService>().dio.post("users/signin", data: {
            "phone":phone ,
            "password": pass
          });

      emit(LoginSuccessState());
      inject<WebService>().initialOrUpdate(
        header: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "accept": "application/json",
          if (HiveServices.getToken != null)
            HttpHeaders.authorizationHeader: "Bearer ${HiveServices.getToken}"
        },
      );
      HiveServices.addToken(response.data["token"]);
      print("03");
    } on DioException catch (e) {
      emit(LoginFailState(message: e.message.toString()));
    } catch (e) {
      emit(LoginFailState(message: e.toString()));
    }
  }
}
