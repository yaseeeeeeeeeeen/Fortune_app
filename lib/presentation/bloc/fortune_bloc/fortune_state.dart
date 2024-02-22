part of 'fortune_bloc.dart';

abstract class FortuneState {}

final class FortuneInitial extends FortuneState {}

final class ValueGeneratedState extends FortuneState {
  DataModel datamodel;
  final bool ismatched;

  ValueGeneratedState({required this.ismatched, required this.datamodel});
}

final class ResetCountDownClickedState extends FortuneState {
  bool isClicked;
  ResetCountDownClickedState({required this.isClicked});
}

final class ResetCountDownNotClickedState extends FortuneState {}