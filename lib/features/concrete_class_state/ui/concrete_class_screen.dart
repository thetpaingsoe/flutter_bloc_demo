import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/concrete_class_bloc.dart';
import '../bloc/concrete_class_event.dart';
import '../bloc/concrete_class_state.dart';

class ConcreteClassScreen extends StatelessWidget {
  const ConcreteClassScreen({super.key});

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
              // Trigger the event to fetch data
              BlocProvider.of<ConcreteClassBloc>(context)
                  .add(ConcreteClassFetchDataEvent(keyword: ''));
            },
            child: const Text("Fetch Data"),
          ),
          const SizedBox(height: 16),
          BlocBuilder<ConcreteClassBloc, ConcreteClassState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return const CircularProgressIndicator();
              } else if (state.status == Status.loaded) {
                return Text("Got Data: ${state.dataList.length}");
              } else {
                return const Text("No data");
              }
            },
          ),
        ],
      ),
    );
  }
}