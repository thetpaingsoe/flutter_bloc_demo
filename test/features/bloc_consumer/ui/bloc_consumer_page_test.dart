import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/bloc/bloc_consumer_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/ui/bloc_consumer_screen.dart';
import 'package:flutter_bloc_demo/features/bloc_consumer/ui/widgets/count_button_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing Bloc Consumer', () {
    // Testing the initial state
    testWidgets('Testing the initial state.', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider(
        create: (context) => BlocConsumerBloc(),
        child: Scaffold(
          body: BlocConsumerScreen(),
          floatingActionButton: CountButtonWidget(),
        ),
      )));

      expect(find.text('Counter: 0'), findsOneWidget);
      expect(find.byKey(const Key('increment')), findsOneWidget);
      expect(find.byKey(const Key('decrement')), findsOneWidget);
      expect(find.byKey(const Key('show-msg')), findsOneWidget);
    });

    // Testing the BlocConsumer State
    testWidgets('Testing the BlocConsumer Increment state.', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider(
        create: (context) => BlocConsumerBloc(),
        child: Scaffold(
          body: BlocConsumerScreen(),
          floatingActionButton: CountButtonWidget(),
        ),
      )));

      expect(find.text('Counter: 0'), findsOneWidget);
      await tester.tap(find.byKey(const Key('increment')));
      await tester.tap(find.byKey(const Key('increment')));
      await tester.pump();

      await tester.tap(find.byKey(const Key('show-msg')));
      await tester.pump();
      expect(find.text('Current Count is : 2'), findsOneWidget);

    });

    testWidgets('Testing the BlocConsumer Decrement state.', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider(
        create: (context) => BlocConsumerBloc(),
        child: Scaffold(
          body: BlocConsumerScreen(),
          floatingActionButton: CountButtonWidget(),
        ),
      )));

      expect(find.text('Counter: 0'), findsOneWidget);
      await tester.tap(find.byKey(const Key('increment')));
      await tester.tap(find.byKey(const Key('increment')));
      await tester.tap(find.byKey(const Key('decrement')));
      await tester.pump();

      await tester.tap(find.byKey(const Key('show-msg')));
      await tester.pump();
      expect(find.text('Current Count is : 1'), findsOneWidget);
    });
  });
}
