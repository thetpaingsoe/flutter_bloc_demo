
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/bloc/basic_counter_with_cubit.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/ui/basic_counter_with_cubit_screen.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_cubit/ui/widgets/count_button_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  Future<void> initPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => BasicCounterWithCubit(),
          child: Scaffold(
            body: BasicCounterWithCubitScreen(),
            floatingActionButton: CountButtonWidget(),
          ),
        )
      )
    );
  }
  group('Testing Basic Counter With Cubit Widget.', () {
    // Initial State Test
    testWidgets('Testing Initial State', (WidgetTester tester) async {
      await initPage(tester);

      expect(find.text('Counter Value : 0'), findsOneWidget);

      
    });

    // Increment State Test
    testWidgets('Testing Increasement Test', (WidgetTester tester) async {
      await initPage(tester);

      await tester.tap(find.byKey(const Key('increment-button')));
      await tester.pumpAndSettle();

      expect(find.text('Counter Value : 1'), findsOneWidget);

    });

    // Decrement State Test
    testWidgets('Testing Decrement Test', (WidgetTester tester) async {
      await initPage(tester);

      await tester.tap(find.byKey(const Key('decrement-button')));
      await tester.pumpAndSettle();

      expect(find.text('Counter Value : -1'), findsOneWidget);
    });
  });
}