import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc_selector_bloc.dart';
import 'bloc_selector_screen.dart';

class BlocSelectorPage extends StatelessWidget {
  const BlocSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BlocSelectorBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text('Bloc Selector'),
        ),
        body: const BlocSelectorScreen()
      ),
    );
  }
}