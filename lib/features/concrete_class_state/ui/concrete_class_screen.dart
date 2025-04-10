import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/concrete_class_bloc.dart';
import '../bloc/concrete_class_event.dart';
import '../bloc/concrete_class_state.dart';

class ConcreteClassScreen extends StatelessWidget {
  const ConcreteClassScreen({super.key});

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<ConcreteClassBloc>(context)
                  .add(ConcreteClassInitialEvent());

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Search TextField with a search icon
          TextField(
            decoration: InputDecoration(
              labelText: 'Search',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            onChanged: (value) {
              // Trigger the event to fetch data
              BlocProvider.of<ConcreteClassBloc>(context)
                  .add(ConcreteClassFetchDataEvent(keyword: value));
            },
          ),
          
          const SizedBox(height: 16),
          BlocBuilder<ConcreteClassBloc, ConcreteClassState>(
            builder: (context, state) {
              if (state.status == Status.loading) {
                return const CircularProgressIndicator();
              } else if (state.status == Status.error) {
                return const Text("No data");
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.dataList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(state.dataList[index]),
                        ),
                      );
                    },
                  ),
                );
                
              }
            },
          ),
        ],
      ),
    );
  }
}