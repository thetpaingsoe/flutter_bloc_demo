import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_bloc/bloc/basic_counter_with_bloc.dart';

import '../../bloc/basic_counter_with_bloc_event.dart';

class CountButtonWidget extends StatelessWidget {
  const CountButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: "increment",
            onPressed: () {
              BlocProvider.of<BasicCounterWithBloc>(context)
                  .add(BasicCounterWithBlocIncreaseEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: "decrement",
            onPressed: () {
              BlocProvider.of<BasicCounterWithBloc>(context)
                  .add(BasicCounterWithBlocDecreaseEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ]);
  }
}
