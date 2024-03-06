import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gymjibi/data/single_gym/model/response/respose_single_gym.dart';

import '../../../../config/hive_service/hive_service.dart';
import '../../../../config/setup.dart';
import '../../../../config/web_service.dart';
import '../state/booked_state.dart';

class BookedViewModel extends Cubit<BookedBaseState> {
  BookedViewModel() : super(BookedInitialState());

  void booked(
      {required String id,
      required String day,
      required String date,
      required String period,
      required int personsCount,
      List<AdditionalProducts>? additionalProduct}) async {
    emit(BookedLoadingState());

    try {
      var response =
          await inject<WebService>().dio.post("books/action/request/$id", data: {
        "day": day,
        "date": date,
        "period": period,
        "persons_count": personsCount,
        "additional_product": additionalProduct!.map((e)=>e.toJson()).toList() ?? [],
        //"discount_code": "test"
      });

      emit(BookedSuccessState());

      print("03");
    } on DioException catch (e) {
      emit(BookedFailState(message: e.message.toString()));
    } catch (e) {
      emit(BookedFailState(message: e.toString()));
    }
  }
}
