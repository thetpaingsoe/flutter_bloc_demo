import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/concrete_class_state/repository/data_list_repository.dart';
import 'package:flutter_bloc_demo/features/concrete_class_state/ui/concrete_class_screen.dart';

import '../bloc/concrete_class_bloc.dart';

class ConcreteClassPage extends StatelessWidget {
  const ConcreteClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataListRepository(),
      child: BlocProvider(
        create: (context) => ConcreteClassBloc(dataListRepository: context.read<DataListRepository>()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Concrete Class State'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          body: ConcreteClassScreen()
        )
      ),
    );
  }
}