import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:adviser/1_domain/failures/advice_failures.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../1_domain/usecases/advice_usecases.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    AdviceUseCases adviceUseCases = AdviceUseCases();

    String _mapFailureObjectToText(Failure failure) {
      switch (failure.runtimeType) {
        case ServerError:
          return 'Server Error.Please try again!';
        case CacheError:
          return 'Cache Error.Please try again!';

        default:
          return 'Something went wrong, try again';
      }
    }

    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());

      final failureOrAdvice = await adviceUseCases.getAdvice();

      failureOrAdvice.fold(
          (failure) => emit(
              AdvicerStateError(message: _mapFailureObjectToText(failure))),
          (advice) => emit(AdvicerStateLoaded(advice: advice.advice)));

      // String _mapFailureObjectToText(Failure failure) {
      //   switch (failure.runtimeType) {
      //     case ServerError:
      //       return 'Server Error.Please try again!';
      //     case CacheError:
      //       return 'Cache Error.Please try again!';

      //     default:
      //       return 'Something went wrong, try again';
      //   }
      // }
    });
  }
}
