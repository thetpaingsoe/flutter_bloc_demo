import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/cateogry/bloc/category_list_event.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/cateogry/bloc/category_list_state.dart';
import 'package:flutter_bloc_demo/features/share_repository/repository/category_repository.dart';

class CategoryListBloc extends Bloc<CategoryListEvent, CategoryListState>{
  final CategoryRepository categoryRepository;
  CategoryListBloc({required this.categoryRepository}) : super(CategoryListInitialState()) {
    on<CategoryFetchDataEvent>((event, emit) async {
      emit(CategoryListLoadingState());

      final result = await categoryRepository.getCategories(event.keyword);
      String errorMessage = '';
      if (result.isEmpty) {
        errorMessage = 'No data found';
        emit(CategoryListErrorState(errorMessage: errorMessage));
      } else {
        emit(CategoryListSuccessState(keyword: event.keyword, categoryList: result));
      }
    });
  }
}