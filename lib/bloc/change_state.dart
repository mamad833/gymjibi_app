abstract class EditFiledBaseState {}

class EditFiledValueState extends EditFiledBaseState {
  final bool value;

  EditFiledValueState({required this.value});
}
