import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sealed_class_bloc.dart';
import '../repository/data_list_repository.dart';
import 'sealed_class_screen.dart';

class SealedClassPage extends StatelessWidget {
  const SealedClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataListRepository(),
      child: BlocProvider(
        create: (context) => SealedClassBloc(dataListRepository: context.read<DataListRepository>()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Sealed Class State'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          body: SealedClassScreen()
        )
      ),
    );
  }
}