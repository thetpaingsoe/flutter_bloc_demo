import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/repository_provider/bloc/repository_provider_bloc.dart';

import '../bloc/repository_provider_event.dart';
import '../bloc/repository_provider_state.dart';

class RepositoryProviderScreen extends StatelessWidget {
  const RepositoryProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FilledButton(
            onPressed: () {
              BlocProvider.of<RepositoryProviderBloc>(context)
                  .add(RepositoryProviderFetchDataEvent());
            }, 
            child: const Text("Fetch Data")),

          const SizedBox(height: 16,),
          BlocBuilder<RepositoryProviderBloc, RepositoryProviderState>(builder:(context, state) {
            if (state.isLoading) {
              return const CircularProgressIndicator();
            } else if (state.data != '') {
              return Text(state.data);
            } else {
              return const Text("No data");
            }
          })
        ],
      ),
    );
  }
}
