import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/hybird_sealed_class_bloc.dart';
import '../repository/data_list_repository.dart';
import 'hybird_sealed_class_screen.dart';

class HybirdSealedClassPage extends StatelessWidget {
  const HybirdSealedClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DataListRepository(),
      child: BlocProvider(
        create: (context) => HybirdSealedClassBloc(dataListRepository: context.read<DataListRepository>()),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('HybirdSealed Class State'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          body: HybirdSealedClassScreen()
        )
      ),
    );
  }
}