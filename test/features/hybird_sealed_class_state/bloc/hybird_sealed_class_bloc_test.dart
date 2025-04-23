
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_demo/features/hybird_sealed_class_state/bloc/hybird_sealed_class_bloc.dart';
import 'package:flutter_bloc_demo/features/hybird_sealed_class_state/bloc/hybird_sealed_class_event.dart';
import 'package:flutter_bloc_demo/features/hybird_sealed_class_state/bloc/hybird_sealed_class_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'hybird_sealed_class_bloc_test.mocks.dart';

// This will be used to mock the DataListRepository
// to avoid making actual network calls
// Inorder to do that, you need to use the mockito package.
// class MockDataListRepository extends Mock implements DataListRepository {}
@GenerateNiceMocks([MockSpec<DataListRepository>()])
import 'package:flutter_bloc_demo/features/hybird_sealed_class_state/repository/data_list_repository.dart';


void main() {

  late MockDataListRepository mockDataListRepository;

  setUp(() {
    mockDataListRepository = MockDataListRepository();
  });

  group('Hybird Sealed Class Bloc', () {

    test('Initial state should be HybirdSealedClassInitialState', () {
      final bloc = HybirdSealedClassBloc(dataListRepository: mockDataListRepository);
      expect(bloc.state, isA<HybirdSealedClassInitialState>());
    });

    blocTest<HybirdSealedClassBloc, HybirdSealedClassState>(
      'emits [HybirdSealedClassLoadingState, HybirdSealedClassSuccessState] when data is fetched successfully',
      build: () {
        when(mockDataListRepository.getItems('')).thenAnswer((_) async => ['Apple', 'Banana', 'Orange']);
        return HybirdSealedClassBloc(dataListRepository: mockDataListRepository);
      },
      act: (bloc) => bloc.add(HybirdSealedClassInitialEvent()),
      expect: () => [
        // expect(true,true)
        isA<HybirdSealedClassLoadingState>(),
        isA<HybirdSealedClassSuccessState>()
            .having((state) => state.dataList, 'dataList', ['Apple', 'Banana', 'Orange'])
            .having((state) => state.keyword, 'keyword', ''),
      ],
    );

    blocTest<HybirdSealedClassBloc, HybirdSealedClassState>(
      'emits [HybirdSealedClassLoadingState, HybirdSealedClassErrorState] when data fetch fails',
      build: () {
        when (mockDataListRepository.getItems(any)).thenAnswer((_) async => []);
        return HybirdSealedClassBloc(dataListRepository: mockDataListRepository);
      },
      act: (bloc) => bloc.add(HybirdSealedClassInitialEvent()),
      expect: () => [
        isA<HybirdSealedClassLoadingState>(),
        isA<HybirdSealedClassErrorState>()
            .having((state) => state.errorMessage, 'errorMessage', 'No data found'),
      ],
    );

    blocTest<HybirdSealedClassBloc, HybirdSealedClassState>(
      'emits [HybirdSealedClassLoadingState, HybirdSealedClassSuccessState] when data is fetched successfully with keyword',
      build: () {
        when(mockDataListRepository.getItems('App')).thenAnswer((_) async => ['Apple', 'Pineapple']);
        return HybirdSealedClassBloc(dataListRepository: mockDataListRepository);
      },
      act: (bloc) => bloc.add(HybirdSealedClassFetchDataEvent(keyword: 'App')),
      expect: () => [
        isA<HybirdSealedClassLoadingState>(),
        isA<HybirdSealedClassSuccessState>()
            .having((state) => state.dataList, 'dataList', ['Apple', 'Pineapple'])
            .having((state) => state.keyword, 'keyword', 'App'),
      ],
    );
    

  });
}