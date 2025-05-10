
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_demo/features/bloc_selector/bloc/bloc_selector_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_selector/bloc/bloc_selector_event.dart';
import 'package:flutter_bloc_demo/features/bloc_selector/bloc/bloc_selector_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group("Testing Bloc Selector.", (){

    // Testing initial state
    test('Testing Initial State', () {
      final bloc = BlocSelectorBloc();
      expect(bloc.state, isA<BlocSelectorState>());
      expect(bloc.state.email, '');
      expect(bloc.state.emailError, '');
    });

    // Testing Email Empty State
    blocTest<BlocSelectorBloc, BlocSelectorState>(
      "Testing Email Empty State",
      build: () => BlocSelectorBloc(),
      act: (bloc) => bloc.add(BlocSelectorEmailCheckedEvent('')),
      expect: () => [
         isA<BlocSelectorState>()
          .having((state) => state.email, "Email should not set", '')        
          .having((state) => state.emailError, "Email Error should set", 'Invalid Email') 
      ]              
    );
    

    // Testing Email Invalid
    blocTest<BlocSelectorBloc, BlocSelectorState>(
      "Testing Email Invalid",
      build: () => BlocSelectorBloc(),
      act: (bloc) => bloc.add(BlocSelectorEmailCheckedEvent('232dsdf###')),
      expect: () => [
         isA<BlocSelectorState>()
          .having((state) => state.email, "Email should not set", '')        
          .having((state) => state.emailError, "Email Error should set", 'Invalid Email') 
      ]              
    );

    // Testing Email Success
    blocTest<BlocSelectorBloc, BlocSelectorState>(
      "Testing Email Success",
      build: () => BlocSelectorBloc(),
      act: (bloc) => bloc.add(BlocSelectorEmailCheckedEvent("abc@gmail.com")),
      expect: () => [
        isA<BlocSelectorState>()
          .having((state) => state.email, "Email Should Set", "abc@gmail.com")
          .having((state) => state.emailError, "Email Error Should not Set", "")
      ]
    );

  });
}