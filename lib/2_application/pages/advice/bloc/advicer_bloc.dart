import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdviceRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      debugPrint('fake get advice triggered');
      await Future.delayed(const Duration(seconds: 3));
      emit(AdvicerStateLoaded(advice: 'fake advice to test bloc'));
    });
  }
}
