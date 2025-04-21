import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/dashboard/bloc/category/category_bloc.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/dashboard/ui/dashboard_screen.dart';
import 'package:flutter_bloc_demo/features/share_repository/repository/category_repository.dart';


class ShareRepositoryPage extends StatelessWidget {
  const ShareRepositoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => CategoryRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryBloc(categoryRepository: context.read<CategoryRepository>()),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Share Repository'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          body: const DashboardScreen()
        ),
      ),
    );
  }
}