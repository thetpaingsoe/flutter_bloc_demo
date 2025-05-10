import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_selector/bloc/bloc_selector_event.dart';

import '../bloc/bloc_selector_bloc.dart';
import '../bloc/bloc_selector_state.dart';

class BlocSelectorScreen extends StatelessWidget {
  const BlocSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Container(
        margin: const EdgeInsets.all(36),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisSize: MainAxisSize.max, children: [
              Expanded(
                child: TextField(
                  key: const Key('email-input'),
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              FilledButton(
                  key: const Key('submit'),
                  onPressed: () {
                    BlocProvider.of<BlocSelectorBloc>(context)
                        .add(BlocSelectorEmailCheckedEvent(emailController.text));
                  },
                  child: const Text('Check Email')),
            ]),
            BlocSelector<BlocSelectorBloc, BlocSelectorState, String>(
                selector: (state) {
              return state.emailError;
            }, builder: (context, state) {
              if (state.isEmpty) {
                return const SizedBox();
              }
              return Text(state, style: TextStyle(fontSize: 12, color: Colors.red),);
            }),
          ],
        ));
  }
}
