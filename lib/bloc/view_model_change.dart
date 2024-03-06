import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gymjibi/bloc/change_state.dart';

class ViewModelEditFiled extends Cubit<EditFiledBaseState> {
  ViewModelEditFiled() : super(EditFiledValueState(value:true));

  void editFiled(bool value) {
    emit(EditFiledValueState(value: value));
  }
}