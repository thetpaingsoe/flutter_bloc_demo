import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/bloc/bloc_consumer_state.dart';

import '../bloc/bloc_consumer_bloc.dart';

class BlocConsumerScreen extends StatelessWidget {
  const BlocConsumerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocConsumerBloc, BlocConsumerState> (
      listener: (context, state) {
        if (state is BlocConsumerDumpState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Counter: ${state.counter}'),
              duration: const Duration(seconds: 1),
            ),
          );
        }
      },
      builder: (context, state) {
        return Center(
          child: Text(
            'Counter: ${state.counter}',            
          ),
        );
      },
    );
  }
}