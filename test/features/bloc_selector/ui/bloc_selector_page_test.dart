import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_selector/bloc/bloc_selector_bloc.dart';
import 'package:flutter_bloc_demo/features/bloc_selector/ui/bloc_selector_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Testing Bloc Selector Page", () {
    // Testing Initial State
    testWidgets("Testing Initial State", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (context) => BlocSelectorBloc(),
          child: BlocSelectorPage(),
        ),
      ));

      expect(find.byKey(const Key('email-input')), findsOneWidget);
      expect(find.byKey(const Key('submit')), findsOneWidget);
    });

    // Testing Blank Email State
    testWidgets("Testing Blank Email State", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (context) => BlocSelectorBloc(),
          child: BlocSelectorPage(),
        ),
      ));

      await tester.enterText(find.byKey(const Key('email-input')), "");
      await tester.pump();

      await tester.tap(find.byKey(const Key('submit')));
      await tester.pumpAndSettle();

      expect(find.text("Invalid Email"), findsOneWidget);
    });

    // Testing Invalid Email
    testWidgets("Testing Invalid Email", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (context) => BlocSelectorBloc(),
          child: BlocSelectorPage(),
        ),
      ));

      await tester.enterText(find.byKey(const Key('email-input')), "abcdef");
      await tester.pump();

      await tester.tap(find.byKey(const Key('submit')));
      await tester.pumpAndSettle();

      expect(find.text("Invalid Email"), findsOneWidget);
      expect(find.text("abcdef"), findsOneWidget);
    });

    // Testing Success Email
    testWidgets("Testing Success Email", (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: BlocProvider(
          create: (context) => BlocSelectorBloc(),
          child: BlocSelectorPage(),
        ),
      ));

      await tester.enterText(find.byKey(const Key('email-input')), "abc@gmail.com");
      await tester.pump();

      await tester.tap(find.byKey(const Key('submit')));
      await tester.pumpAndSettle();

      expect(find.text("Invalid Email"), findsNothing);
      expect(find.text("abc@gmail.com"), findsOneWidget);
    });
  });
}
