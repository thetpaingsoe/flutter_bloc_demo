
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_builder_build_when/bloc/build_when_event.dart';
import 'package:flutter_bloc_demo/features/bloc_builder_build_when/bloc/build_when_state.dart';

class BuildWhenBloc extends Bloc<BuildWhenEvent, BuildWhenState> {
  BuildWhenBloc() : super(const BuildWhenInitial(0)) {
    on<BuildWhenIncreaseEvent>((event, emit) {
      emit(BuildWhenIncreased(state.counter + 1));
    });
    on<BuildWhenDecreaseEvent>((event, emit){
      emit(BuildWhenDecreased(state.counter - 1));
    });
  }
}