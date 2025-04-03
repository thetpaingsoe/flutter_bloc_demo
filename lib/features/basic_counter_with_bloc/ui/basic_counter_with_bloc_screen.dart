import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/basic_counter_with_bloc.dart';
import '../bloc/basic_counter_with_bloc_state.dart';

class BasicCounterWithBlocScreen extends StatelessWidget {
  const BasicCounterWithBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasicCounterWithBloc, BasicCounterWithBlocState>(
        builder: (context, state) {
      return Center(child: Text("Counter Value : ${state.counter}"));
    });
  }
}
