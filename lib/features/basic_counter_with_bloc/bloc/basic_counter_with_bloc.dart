import 'package:flutter_bloc/flutter_bloc.dart';

import 'basic_counter_with_bloc_event.dart';
import 'basic_counter_with_bloc_state.dart';

class BasicCounterWithBloc extends Bloc<BasicCounterWithBlocEvent, BasicCounterWithBlocState> {
  BasicCounterWithBloc() : super(BasicCounterWithBlocInitial(10)) {
    on<BasicCounterWithBlocIncreaseEvent>((event, emit) {
      emit(BasicCounterWithBlocIncremented(state.counter + 1));
    });
    on<BasicCounterWithBlocDecreaseEvent>((event, emit) {
      emit(BasicCounterWithBlocDecreaed(state.counter - 1));
    });
  }

}