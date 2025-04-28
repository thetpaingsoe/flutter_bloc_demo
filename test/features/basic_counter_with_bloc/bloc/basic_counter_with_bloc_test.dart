import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_bloc/bloc/basic_counter_with_bloc.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_bloc/bloc/basic_counter_with_bloc_event.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_bloc/bloc/basic_counter_with_bloc_state.dart';
import 'package:test/test.dart';

void main() {
  group('Basic Counter With Bloc', () {
    test('Initial State Testing with no 10', () {
      final bloc = BasicCounterWithBloc();
      expect(bloc.state, isA<BasicCounterWithBlocInitial>());
      expect(bloc.state.counter, 10);
    });

    // Test Increment
    blocTest<BasicCounterWithBloc, BasicCounterWithBlocState>(
      'Testing Increment : Basic Counter ',
      build: () {
        return BasicCounterWithBloc();
      },
      act: (bloc) => bloc.add(BasicCounterWithBlocIncreaseEvent()),
      expect: () {        
        return [
          isA<BasicCounterWithBlocIncremented>()
              .having((state) => state.counter, 'counter', 11),
        ];
      },
    );

    // Test Decrement
    blocTest<BasicCounterWithBloc, BasicCounterWithBlocState> (
      'Testing Decrement : Basic Counter ',
      build: () => BasicCounterWithBloc(),
      act: (bloc) => bloc.add(BasicCounterWithBlocDecreaseEvent()),
      expect: () => [
        isA<BasicCounterWithBlocDecreaed>()
          .having((state) => state.counter, 'counter', 9)
      ]
    );

  });
}