
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_bloc/bloc/basic_counter_with_bloc.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_bloc/ui/basic_counter_with_bloc_screen.dart';
import 'package:flutter_bloc_demo/features/basic_counter_with_bloc/ui/widgets/count_button_widget.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  Future<void> initPage(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider(
          create: (context) => BasicCounterWithBloc(),
          child: const Scaffold(
            body: BasicCounterWithBlocScreen(),
            floatingActionButton: CountButtonWidget() 
          )
        )
      )
    );
  }

  testWidgets('Testing basic counter init, increment and decrement', (WidgetTester tester) async {
    await initPage(tester);

    await tester.pumpAndSettle();
    expect(find.text("Counter Value : 10"), findsOneWidget);

    await tester.tap(find.byKey(Key('increment')));
    await tester.pumpAndSettle();
    expect(find.text("Counter Value : 11"), findsOneWidget);

    await tester.tap(find.byKey(Key('decrement')));
    await tester.tap(find.byKey(Key('decrement')));
    await tester.pumpAndSettle();
    expect(find.text("Counter Value : 9"), findsOneWidget);

  });
}