import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/bloc/bloc_consumer_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/bloc/bloc_consumer_event.dart';

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
            key: const Key('increment'),
            heroTag: "increment",
            onPressed: () {
              BlocProvider.of<BlocConsumerBloc>(context)
                  .add(BlocConsumerIncrementEvent());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            key: const Key('decrement'),
            heroTag: "decrement",
            onPressed: () {
              BlocProvider.of<BlocConsumerBloc>(context)
                  .add(BlocConsumerDecrementEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            key: const Key('show-msg'),
            heroTag: "show-msg",
            onPressed: () {
              BlocProvider.of<BlocConsumerBloc>(context)
                  .add(BlocConsumerDumpEvent());
            },
            tooltip: 'Show',
            child: const Icon(Icons.question_mark),
          )
        ]);  
  }
}