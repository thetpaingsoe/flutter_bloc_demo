import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_builder_build_when/bloc/build_when_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_builder_build_when/ui/build_when_screen.dart';
import 'package:flutter_bloc_demo/features/bloc_builder_build_when/ui/widgets/count_button_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing Build When Page.', () {
    // Testing the initial stage
    testWidgets('Testing the initial', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
            create: (context) => BuildWhenBloc(), child: BuildWhenScreen()),
      ));

      expect(
          find.text(
              'It will only rebuild the UI for even number \n Counter: 0'),
          findsOneWidget);
    });

    // Testing Increasement only increase after 2 time press
    testWidgets('Testing the Increment', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (context) => BuildWhenBloc(),
          child: Scaffold(
            body: BuildWhenScreen(),
            floatingActionButton: CountButtonWidget(),
          ),
        ),
      ));

      // 1st time tap
      await tester.tap(find.byKey(const Key('increment')));
      await tester.pumpAndSettle();
      expect(find.textContaining('Counter: 0'), findsOneWidget);

      // 2nd time tap
      await tester.tap(find.byKey(const Key('increment')));
      await tester.pumpAndSettle();
      expect(find.textContaining('Counter: 2'), findsOneWidget);
    });

    // Testing decrement only decrease after 2 time press
    testWidgets('Testing the decrement', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (context) => BuildWhenBloc(),
          child: Scaffold(
            body: BuildWhenScreen(),
            floatingActionButton: CountButtonWidget(),
          ),
        ),
      ));

      // 1st time tap
      await tester.tap(find.byKey(const Key('decrement')));
      await tester.pumpAndSettle();
      expect(find.textContaining('Counter: 0'), findsOneWidget);

      // 2nd time tap
      await tester.tap(find.byKey(const Key('decrement')));
      await tester.pumpAndSettle();
      expect(find.textContaining('Counter: -2'), findsOneWidget);
    });

  });
}
