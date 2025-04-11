import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/sealed_class_bloc.dart';
import '../bloc/sealed_class_event.dart';
import '../bloc/sealed_class_state.dart';

class SealedClassScreen extends StatefulWidget {
  const SealedClassScreen({super.key});

  @override
  State<SealedClassScreen> createState() => _SealedClassScreenState();
}

class _SealedClassScreenState extends State<SealedClassScreen> {

  @override
  void initState() {
    super.initState();
    // Dispatch initial event ONCE when the screen loads
    BlocProvider.of<SealedClassBloc>(context).add(SealedClassInitialEvent());
  }

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
              BlocProvider.of<SealedClassBloc>(context)
                  .add(SealedClassFetchDataEvent(keyword: value));
            },
          ),
          
          const SizedBox(height: 16),
          BlocBuilder<SealedClassBloc, SealedClassState>(
            builder: (context, state) {
              if (state is SealedClassLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is SealedClassErrorState) {
                return Text(state.errorMessage);
              } else if (state is SealedClassSuccessState) {
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
              } else {
                return const Text("N.A");
              }
            },
          ),
        ],
      ),
    );
  }
}