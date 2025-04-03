import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/bloc/basic_counter_with_cubit_state.dart';

import '../bloc/basic_counter_with_cubit.dart';

class BasicCounterWithCubitScreen extends StatelessWidget {
  const BasicCounterWithCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicCounterWithCubit, BasicCounterWithCubitState>(
        builder: (context, state) {
      return Center(child: Text("Counter Value : ${state.counter}"));
    });
  }
}