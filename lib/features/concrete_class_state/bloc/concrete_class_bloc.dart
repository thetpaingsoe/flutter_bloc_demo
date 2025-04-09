import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/concrete_class_state/bloc/concrete_class_event.dart';
import 'package:flutter_bloc_demo/features/concrete_class_state/bloc/concrete_class_state.dart';
import 'package:flutter_bloc_demo/features/concrete_class_state/repository/data_list_repository.dart';

class ConcreteClassBloc extends Bloc<ConcreteClassEvent, ConcreteClassState>{
  
  final DataListRepository dataListRepository;
  
  ConcreteClassBloc({required this.dataListRepository}) : super(ConcreteClassState()) {
    on<ConcreteClassFetchDataEvent>((event, emit) async {
      Status retrunStatus = Status.loading;

      emit(ConcreteClassState(status: retrunStatus));

      // Simulate a network call
      List<String> dataList = await dataListRepository.getItems(event.keyword);
      String errorMessage = '';
      if(dataList.isEmpty){
        errorMessage = 'No data found';
        retrunStatus = Status.error;
      } else {
        retrunStatus = Status.loaded;
      }
      
      emit(ConcreteClassState(
        status: retrunStatus, 
        dataList: dataList, 
        keyword: event.keyword, 
        errorMessage: errorMessage));
    });
  }
}