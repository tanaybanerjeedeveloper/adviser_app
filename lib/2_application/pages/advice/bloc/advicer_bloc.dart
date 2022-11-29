import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../1_domain/usecases/advice_usecases.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    AdviceUseCases adviceUseCases = AdviceUseCases();
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      final failureOrAdvice = await adviceUseCases.getAdvice();

      failureOrAdvice.fold(
          (failure) => emit(AdvicerStateError(message: 'error message')),
          (advice) => emit(AdvicerStateLoaded(advice: advice.advice)));
    });
  }
}
