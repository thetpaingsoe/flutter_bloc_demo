import 'package:flutter_bloc/flutter_bloc.dart';


import '../repository/data_list_repository.dart';
import 'hybird_sealed_class_event.dart';
import 'hybird_sealed_class_state.dart';

class HybirdSealedClassBloc extends Bloc<HybirdSealedClassEvent, HybirdSealedClassState>{
  
  final DataListRepository dataListRepository;
  
  HybirdSealedClassBloc({required this.dataListRepository}) : super(HybirdSealedClassInitialState()) {

    on<HybirdSealedClassInitialEvent>((event, emit) async{
    
      emit(HybirdSealedClassLoadingState());

      // Simulate a network call
      List<String> dataList = await dataListRepository.getItems('');
      String errorMessage = '';
      if(dataList.isEmpty){
        errorMessage = 'No data found';
        emit(HybirdSealedClassErrorState(errorMessage: errorMessage));
      } else {
        emit(HybirdSealedClassSuccessState(keyword: '', dataList: dataList));
      }
            
    });
    
    on<HybirdSealedClassFetchDataEvent>((event, emit) async {

      emit(HybirdSealedClassLoadingState());

      // Simulate a network call
      List<String> dataList = await dataListRepository.getItems(event.keyword);
      String errorMessage = '';
      if(dataList.isEmpty){
        errorMessage = 'No data found';
        emit(HybirdSealedClassErrorState(errorMessage: errorMessage));
      } else {
        emit(HybirdSealedClassSuccessState(keyword: event.keyword, dataList: dataList));
      }

    });
  }
}