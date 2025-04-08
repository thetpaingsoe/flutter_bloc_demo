import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/repository_provider/bloc/repository_provider_bloc.dart';
import 'package:flutter_bloc_demo/features/repository_provider/repository/repository_provider_repository.dart';
import 'package:flutter_bloc_demo/features/repository_provider/ui/repository_provider_screen.dart';

class RepositoryProviderPage extends StatelessWidget {
  const RepositoryProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositoryProviderRepository(),
      child: BlocProvider(
        create: (context) => RepositoryProviderBloc(repository: context.read<RepositoryProviderRepository>()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            title: const Text("Simple RepositoryProvider"),
          ),
          body: RepositoryProviderScreen(
            key: const Key("repository_provider_screen"),
          ),
        ),
      ),
    );
  }
}