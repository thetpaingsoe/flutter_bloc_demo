import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/bloc/bloc_consumer_event.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/bloc/bloc_consumer_state.dart';

class BlocConsumerBloc extends Bloc<BlocConsumerEvent, BlocConsumerState> {
  BlocConsumerBloc() : super(BlocConsumerState()) {
    on<BlocConsumerIncrementEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });
    on<BlocConsumerDecrementEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
    on<BlocConsumerDumpEvent>((event, emit) {
      emit(BlocConsumerDumpState(counter: state.counter));
    });
  }
}