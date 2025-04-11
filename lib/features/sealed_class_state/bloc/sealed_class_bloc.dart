import 'package:flutter_bloc/flutter_bloc.dart';


import '../repository/data_list_repository.dart';
import 'sealed_class_event.dart';
import 'sealed_class_state.dart';

class SealedClassBloc extends Bloc<SealedClassEvent, SealedClassState>{
  
  final DataListRepository dataListRepository;
  
  SealedClassBloc({required this.dataListRepository}) : super(SealedClassInitialState()) {

    on<SealedClassInitialEvent>((event, emit) async{
    
      emit(SealedClassLoadingState());

      // Simulate a network call
      List<String> dataList = await dataListRepository.getItems('');
      String errorMessage = '';
      if(dataList.isEmpty){
        errorMessage = 'No data found';
        emit(SealedClassErrorState(errorMessage: errorMessage));
      } else {
        emit(SealedClassSuccessState(dataList: dataList));
      }
            
    });
    
    on<SealedClassFetchDataEvent>((event, emit) async {

      emit(SealedClassLoadingState());

      // Simulate a network call
      List<String> dataList = await dataListRepository.getItems(event.keyword);
      String errorMessage = '';
      if(dataList.isEmpty){
        errorMessage = 'No data found';
        emit(SealedClassErrorState(errorMessage: errorMessage));
      } else {
        emit(SealedClassSearchState(dataList: dataList, keyword: event.keyword));
      }

    });
  }
}