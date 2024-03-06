import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymjibi/data/get_all_gym/bloc/state/get_all_gym_state.dart';
import 'package:gymjibi/data/get_all_gym/model/response/respose_get_all_gym.dart';

import '../../../../config/service/global.dart';
import '../../../../config/setup.dart';
import '../../../../config/web_service.dart';

class GetGymViewModel extends Cubit<GetAllGymBaseState> {
  GetGymViewModel() : super(GetAllInitialState());

  void getTopGym() async {
    emit(GetAllLoadingState());
    try {
      var response = await inject<WebService>().dio.get("gyms/all");
      List<ResponseGetGymModel> responseGetAllGym=[] ;
      for(var it in response.data){
        ResponseGetGymModel responseGetGymModelConvert =ResponseGetGymModel.fromJson(it);
        responseGetAllGym.add(responseGetGymModelConvert);
      }
      emit(GetAllSuccessState(response: responseGetAllGym));
    } on DioException catch (e) {
      emit(GetAllFailedState(message: e.message.toString()));
      GEasyHelper.retry(e.message.toString(), () => getTopGym());
    } catch (e) {
      emit(GetAllFailedState(message: e.toString()));
      GEasyHelper.retry(e.toString(), () => getTopGym());
    }
  }
}
