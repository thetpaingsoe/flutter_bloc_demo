import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_bloc/bloc/basic_counter_with_bloc_event.dart';

import '../bloc/basic_counter_with_bloc.dart';
import '../bloc/basic_counter_with_bloc_state.dart';

class BasicCounterWithBlocWidget extends StatelessWidget {
  const BasicCounterWithBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text('Basic Counter with Bloc')
        ),
        body: BlocBuilder<BasicCounterWithBloc, BasicCounterWithBlocState>
          ( 
          builder: (context, state) { 
            return Center(child: Text("Counter Value : ${state.counter}"));
          }
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<BasicCounterWithBloc>(context).add(BasicCounterWithBlocIncreaseEvent());
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            SizedBox(height: 16,),
            FloatingActionButton(onPressed: () {
                BlocProvider.of<BasicCounterWithBloc>(context).add(BasicCounterWithBlocDecreaseEvent());
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      
    );
  }

}