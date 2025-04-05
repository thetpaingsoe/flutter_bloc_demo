import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_builder_build_when/bloc/build_when_event.dart';

import '../../bloc/build_when_bloc.dart';

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
              BlocProvider.of<BuildWhenBloc>(context)
                  .add(BuildWhenIncreaseEvent());
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
              BlocProvider.of<BuildWhenBloc>(context)
                  .add(BuildWhenDecreaseEvent());
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ]);
  }
}
