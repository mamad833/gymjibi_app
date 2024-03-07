import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymjibi/data/get_bookedes_user/bloc/state/get_bookeds_user_state.dart';
import 'package:gymjibi/data/get_bookedes_user/model/response/respose_get_bookeds_user.dart';
import '../../../../config/service/global.dart';
import '../../../../config/setup.dart';
import '../../../../config/web_service.dart';

class GetBookedUserViewModel extends Cubit<GetBookedsBaseState> {
  GetBookedUserViewModel() : super(GetBookedsInitialState());

  void getBookedUser() async {
    emit(GetBookedsLoadingState());
    try {
      var response = await inject<WebService>().dio.get("users/bookeds");
      List<BookesUser> responsegetBookedUser=[] ;
      for(var it in response.data){
        BookesUser responseGetGymModelConvert =BookesUser.fromJson(it);
        responsegetBookedUser.add(responseGetGymModelConvert);
      }
      emit(GetBookedsSuccessState(response: responsegetBookedUser));
    } on DioException catch (e) {
      emit(GetBookedsFailedState(message: e.message.toString()));
      GEasyHelper.retry(e.message.toString(), () => getBookedUser());
    } catch (e) {
      emit(GetBookedsFailedState(message: e.toString()));
      GEasyHelper.retry(e.toString(), () => getBookedUser());
    }
  }
}
