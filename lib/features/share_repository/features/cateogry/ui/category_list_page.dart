import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/cateogry/ui/category_list_screen.dart';
import 'package:flutter_bloc_demo/features/share_repository/repository/category_repository.dart';

import '../bloc/category_list_bloc.dart';

class CategoryListPage extends StatelessWidget {
  final CategoryRepository? categoryRepository;
  const CategoryListPage({super.key, this.categoryRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => categoryRepository ?? CategoryRepository(),
      child: BlocProvider(
        create: (context) => CategoryListBloc(
            categoryRepository: context.read<CategoryRepository>()),
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Category List'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            body: const CategoryListScreen()),
      ),
    );
  }
}
