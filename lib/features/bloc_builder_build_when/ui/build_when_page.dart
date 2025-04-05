import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_builder_build_when/bloc/build_when_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_builder_build_when/ui/widgets/count_button_widget.dart';

import 'build_when_screen.dart';

class BuildWhenPage extends StatelessWidget {
  const BuildWhenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuildWhenBloc(), 
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
            title: const Text('BlocBuilder: Build When')
        ),        
        body: const BuildWhenScreen(),
        floatingActionButton: CountButtonWidget(),
      )
    );
  }
}