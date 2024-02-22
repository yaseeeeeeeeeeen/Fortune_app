import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:fortune/data/reposetory/fortune_repo.dart';
import 'package:fortune/domin/model/data_model.dart';

part 'fortune_event.dart';
part 'fortune_state.dart';

class FortuneBloc extends Bloc<FortuneEvent, FortuneState> {
  final FortuneRepo repo;
  late DataModel dataModel;
  FortuneBloc(this.repo) : super(FortuneInitial()) {
    on<ButtonClickedEvent>(buttonClickedEvent);
    on<FetchDataEvent>(fetchDataEvent);
    on<ResetCountDownNotClickedEvent>(resetCountDownNotClickedEvent);
  }

  FutureOr<void> buttonClickedEvent(
      ButtonClickedEvent event, Emitter<FortuneState> emit) async {
    emit(FortuneInitial());

    dataModel.randomNumber = Random().nextInt(60);
    dataModel.currentSecond = DateTime.now().second;
    dataModel.valueGenerated = true;
    dataModel.randomNumber == dataModel.currentSecond
        ? dataModel.successCount++
        : dataModel.failureCount++;
    dataModel.attempts++;

    emit(ResetCountDownClickedState(isClicked: true));

    await repo.saveData(dataModel);
    bool isMatched = dataModel.valueGenerated && true
        ? dataModel.currentSecond == dataModel.randomNumber
        : false;

    emit(ValueGeneratedState(ismatched: isMatched, datamodel: dataModel));
  }

  FutureOr<void> fetchDataEvent(
      FetchDataEvent event, Emitter<FortuneState> emit) async {
    dataModel = await repo.getData();

    bool isMatched = dataModel.valueGenerated
        ? dataModel.currentSecond == dataModel.randomNumber
        : false;

    emit(ValueGeneratedState(ismatched: isMatched, datamodel: dataModel));
  }

  FutureOr<void> resetCountDownNotClickedEvent(
      ResetCountDownNotClickedEvent event, Emitter<FortuneState> emit) async {
    dataModel.failureCount++;
    dataModel.attempts++;

    emit(ResetCountDownNotClickedState());
    emit(ValueGeneratedState(ismatched: false, datamodel: dataModel));

    await repo.saveData(dataModel);
  }
}
