import 'package:flutter_bloc/flutter_bloc.dart';

import 'basic_counter_with_cubit_state.dart';

class BasicCounterWithCubit extends Cubit<BasicCounterWithCubitState> {
  BasicCounterWithCubit() : super(const BasicCounterWithCubitInitial(0));

  void increment() {
    emit(BasicCounterWithCubitIncremented(state.counter + 1));
  }

  void decrement() {
    emit(BasicCounterWithCubitDecreaed(state.counter - 1));
  }

}