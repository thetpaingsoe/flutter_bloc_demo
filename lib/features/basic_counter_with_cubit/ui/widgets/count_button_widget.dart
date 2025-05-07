import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/bloc/basic_counter_with_cubit.dart';

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
            key: const Key('increment-button'),
            heroTag: "increment",
            onPressed: () {
              BlocProvider.of<BasicCounterWithCubit>(context).increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            key: const Key('decrement-button'),
            heroTag: "decrement",
            onPressed: () {
              BlocProvider.of<BasicCounterWithCubit>(context).decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ]);
  }
}
