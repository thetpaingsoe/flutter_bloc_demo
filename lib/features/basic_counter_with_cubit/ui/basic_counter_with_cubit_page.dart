import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/bloc/basic_counter_with_cubit.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/ui/basic_counter_with_cubit_screen.dart';

import 'widgets/count_button_widget.dart';

class BasicCounterWithCubitPage extends StatelessWidget {
  const BasicCounterWithCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BasicCounterWithCubit(),
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              title: const Text('Basic Counter with Cubit')),
          body: BasicCounterWithCubitScreen(),
          floatingActionButton: CountButtonWidget() 
      )
    );
  }
}