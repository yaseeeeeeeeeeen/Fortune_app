part of 'fortune_bloc.dart';

abstract class FortuneEvent {}
class FetchDataEvent extends FortuneEvent {}

class ButtonClickedEvent extends FortuneEvent {
  

  ButtonClickedEvent();
}

class ResetCountDownClickedEvent extends FortuneEvent {
  
  ResetCountDownClickedEvent();
}

class ResetCountDownNotClickedEvent extends FortuneEvent {
  ResetCountDownNotClickedEvent();
}