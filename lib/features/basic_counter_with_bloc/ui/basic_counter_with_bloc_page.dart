import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_bloc/ui/basic_counter_with_bloc_screen.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_bloc/ui/widgets/count_button_widget.dart';

import '../bloc/basic_counter_with_bloc.dart';

class BasicCounterWithBlocPage extends StatelessWidget {
  const BasicCounterWithBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BasicCounterWithBloc(),
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
              title: const Text('Basic Counter with Bloc')),
          body: BasicCounterWithBlocScreen(),
          floatingActionButton: CountButtonWidget() 
      )
    );
  }
}
