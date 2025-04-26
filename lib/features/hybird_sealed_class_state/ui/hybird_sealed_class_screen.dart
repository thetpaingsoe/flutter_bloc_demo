import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/hybird_sealed_class_bloc.dart';
import '../bloc/hybird_sealed_class_event.dart';
import '../bloc/hybird_sealed_class_state.dart';

class HybirdSealedClassScreen extends StatefulWidget {
  const HybirdSealedClassScreen({super.key});

  @override
  State<HybirdSealedClassScreen> createState() => _HybirdSealedClassScreenState();
}

class _HybirdSealedClassScreenState extends State<HybirdSealedClassScreen> {

  @override
  void initState() {
    super.initState();
    // Dispatch initial event ONCE when the screen loads
    BlocProvider.of<HybirdSealedClassBloc>(context).add(HybirdSealedClassInitialEvent());
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
            key: const Key('seach_text_field'),
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
              BlocProvider.of<HybirdSealedClassBloc>(context)
                  .add(HybirdSealedClassFetchDataEvent(keyword: value));
            },
          ),
          
          const SizedBox(height: 16),
          BlocBuilder<HybirdSealedClassBloc, HybirdSealedClassState>(
            builder: (context, state) {
              if (state is HybirdSealedClassLoadingState) {
                return const CircularProgressIndicator();
              } else if (state is HybirdSealedClassErrorState) {
                return Text(state.errorMessage);
              } else if (state is HybirdSealedClassSuccessState) {
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