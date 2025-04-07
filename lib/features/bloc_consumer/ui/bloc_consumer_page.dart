import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/bloc/bloc_consumer_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/ui/bloc_consumer_screen.dart';

import 'widgets/count_button_widget.dart';



class BlocConsumerPage extends StatelessWidget {
  const BlocConsumerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocConsumerBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text('Bloc Consumer'),
        ),
        body: const BlocConsumerScreen(),
        floatingActionButton: const CountButtonWidget(),
      ),
    );
  }
}