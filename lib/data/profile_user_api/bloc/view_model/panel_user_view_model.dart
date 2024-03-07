import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymjibi/config/hive_service/hive_service.dart';
import 'package:gymjibi/data/profile_user_api/bloc/state/profile_user_state.dart';
import 'package:gymjibi/data/profile_user_api/model/response/respose_panel_user.dart';

import 'package:gymjibi/data/single_gym/model/response/respose_single_gym.dart';

import '../../../../config/service/global.dart';
import '../../../../config/setup.dart';
import '../../../../config/web_service.dart';



class GetPanelUserViewModel extends Cubit<ProfileUserBaseState> {
  GetPanelUserViewModel() : super(ProfileUserInitialState());

  Future getProfileUser() async {
    print("1");
    emit(ProfileUserLoadingState());
    print("3");
    try {

      print("4");
      print("#############");
      print(HiveServices.getToken);
      print("#############");
      var response =
      await inject<WebService>().dio.get("users/panel");
      PanelProfileUserResponse profileUser=PanelProfileUserResponse.fromJson(response.data);
      print("5");
      print("6");

      print("7");
      emit(ProfileUserSuccessState(response:profileUser));
      print("8");
    }on DioException catch(e){
      emit(ProfileUserFailedState(message: e.message.toString()));
      GEasyHelper.retry(e.message.toString(), () =>GetPanelUserViewModel());
    } catch (e) {
      print("9");
      emit(ProfileUserFailedState(message: e.toString()));
      GEasyHelper.retry(e.toString(), () =>GetPanelUserViewModel());
      print("10");
    }
  }
}