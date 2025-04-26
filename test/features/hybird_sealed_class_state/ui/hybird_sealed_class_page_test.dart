import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/hybird_sealed_class_state/bloc/hybird_sealed_class_bloc.dart';
import 'package:flutter_bloc_demo/features/hybird_sealed_class_state/bloc/hybird_sealed_class_event.dart';
import 'package:flutter_bloc_demo/features/hybird_sealed_class_state/repository/data_list_repository.dart';
import 'package:flutter_bloc_demo/features/hybird_sealed_class_state/ui/hybird_sealed_class_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hybird_sealed_class_page_test.mocks.dart';

@GenerateNiceMocks([MockSpec<DataListRepository>()])
void main() {
  late MockDataListRepository mockDataListRepository;

  late HybirdSealedClassBloc bloc;
  
  setUp(() {
    mockDataListRepository = MockDataListRepository();

    when(mockDataListRepository.getItems(''))
        .thenAnswer((_) async => ['Apple', 'Banana', 'Orange']);

    bloc = HybirdSealedClassBloc(
              dataListRepository: mockDataListRepository);

  });

  
  Future<void> initPage(WidgetTester tester ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RepositoryProvider(
          create: (context) => mockDataListRepository,
          child: BlocProvider(
            create: (context) => bloc ,
            child: const HybirdSealedClassPage(),
          ),
        ),
      ),
    );
  }

  testWidgets('shows loading indicator and then data list',
      (WidgetTester tester) async {
    
    // Initialize the main page to test
    // We can reuse the initPage in every test 
    await initPage(tester);
    
    bloc.add(HybirdSealedClassInitialEvent());

    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('Apple'), findsOneWidget);
    expect(find.text('Banana'), findsOneWidget);
    expect(find.text('Orange'), findsOneWidget);
  });

  testWidgets('seach Apple and we should not see Banana and Orange in the result', (WidgetTester tester) async {
    // Initialize the main page to test
    await initPage(tester);

    // Trigger the event to fetch data
    bloc.add(HybirdSealedClassInitialEvent());

    await tester.pumpAndSettle();

    // Input the search keyword "Apple"
    await tester.enterText(find.byKey(Key('seach_text_field')), 'Apple');
    await tester.pumpAndSettle();

    // Check the search result and make sure "Banana" and "Orange" are not in the result
    // And also seach input box has the keyword "Apple"
    expect(find.descendant(of: find.byType(ListView), matching: find.text('Apple')), findsOneWidget);
    expect(find.descendant(of: find.byType(ListView), matching: find.text('Banana')), findsNothing);
    expect(find.descendant(of: find.byType(ListView), matching: find.text('Orange')), findsNothing);
    expect(find.descendant(of: find.byKey(const Key('seach_text_field')), matching: find.text('Apple')), findsOneWidget);
    
  });
}
