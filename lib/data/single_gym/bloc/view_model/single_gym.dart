import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymjibi/data/single_gym/bloc/state/single_gym_state.dart';
import 'package:gymjibi/data/single_gym/model/response/respose_single_gym.dart';

import '../../../../config/service/global.dart';
import '../../../../config/setup.dart';
import '../../../../config/web_service.dart';

// class SingleGymViewModel extends Cubit<SingleGymBaseState> {
//   SingleGymViewModel() : super(SingleGymInitialState());
//
//   void getSingleGym({required String id}) async {
//     emit(SingleGymLoadingState());
//     try {
//       var response = await inject<WebService>().dio.get("gyms/$id");
//       ResponseGetSingelGym responseSingleGym = ResponseGetSingelGym.fromJson(response.data);
//
//       emit(SingleGymSuccessState(response: responseSingleGym));
//     } on DioException catch (e) {
//       emit(SingleGymFailedState(message: e.message.toString()));
//       GEasyHelper.retry(e.message.toString(), () => getSingleGym(id:id));
//     } catch (e) {
//       emit(SingleGymFailedState(message: e.toString()));
//       GEasyHelper.retry(e.toString(), () => getSingleGym(id:id));
//     }
//   }
// }


class GetEventViewModel extends Cubit<SingleGymBaseState> {
  GetEventViewModel() : super(SingleGymInitialState());

  Future getEvent({required String id}) async {
    print("1");
    emit(SingleGymLoadingState());
    print("3");
    try {

      print("4");
      var response =
      await inject<WebService>().dio.get("gyms/$id");
      ResponseGetSingelGym getEventModel=ResponseGetSingelGym.fromJson(response.data);
      print("5");
      print("6");

      print("7");
      emit(SingleGymSuccessState(response:getEventModel));
      print("8");
    }on DioException catch(e){
      emit(SingleGymFailedState(message: e.message.toString()));
      GEasyHelper.retry(e.message.toString(), () =>GetEventViewModel());
    } catch (e) {
      print("9");
      emit(SingleGymFailedState(message: e.toString()));
      GEasyHelper.retry(e.toString(), () =>GetEventViewModel());
      print("10");
    }
  }
}