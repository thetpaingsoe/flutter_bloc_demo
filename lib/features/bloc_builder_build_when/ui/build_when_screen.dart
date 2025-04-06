import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/build_when_bloc.dart';
import '../bloc/build_when_state.dart';

class BuildWhenScreen extends StatelessWidget {
  const BuildWhenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuildWhenBloc, BuildWhenState>(      
      buildWhen: (previous, current) {
        // Only rebuild when the counter is even
        // This is useful when you want to avoid unnecessary rebuilds
        // and only want to update the UI when certain conditions are met
        return current.counter % 2 == 0;
      },
      builder: (context, state) {
        return Center(
          child: Text(
            'It will only rebuild the UI for even number \n Counter: ${state.counter}', 
            textAlign: TextAlign.center,           
          ),
        );
      },
    );
  }
}