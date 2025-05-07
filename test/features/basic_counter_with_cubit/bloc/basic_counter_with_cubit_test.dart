
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/bloc/basic_counter_with_cubit.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/bloc/basic_counter_with_cubit_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Basic Counter With Cubit Test', (){
    // Test Initial State
    test('Initial State Testing, It must initialize with 0 ', (){
      final bloc = BasicCounterWithCubit();

      expect(bloc.state, isA<BasicCounterWithCubitInitial>());
      expect(bloc.state.counter, 0);
      
    });

    // Test Increment
    blocTest<BasicCounterWithCubit, BasicCounterWithCubitState>(
      "Testing Increment",
      build: () => BasicCounterWithCubit(),
      act: (bloc) => bloc.increment(),
      expect:() => [
        isA<BasicCounterWithCubitIncremented>()
          .having((state) => state.counter, 'counter', 1)
      ]
    );

    // Test Decrement
    blocTest<BasicCounterWithCubit, BasicCounterWithCubitState>(
      'Testing Decrement',
      build: () => BasicCounterWithCubit(),
      act: (bloc) { bloc.decrement(); },
      expect: () => [
        isA<BasicCounterWithCubitDecreaed>()
          .having( (state) => state.counter, 'Decreased', -1)
      ]
    );

  });
}