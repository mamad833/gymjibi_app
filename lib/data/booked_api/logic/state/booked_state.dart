import 'package:equatable/equatable.dart';

abstract class BookedBaseState extends Equatable {
  @override
  List<Object> get props => [];
}

class BookedInitialState extends BookedBaseState {}

class BookedLoadingState extends BookedBaseState {}

class BookedSuccessState extends BookedBaseState {}

class BookedFailState extends BookedBaseState {
  final String message;

  BookedFailState({required this.message});
}
