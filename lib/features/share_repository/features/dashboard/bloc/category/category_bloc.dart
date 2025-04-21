
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/dashboard/bloc/category/category_event.dart';
import 'package:flutter_bloc_demo/features/share_repository/features/dashboard/bloc/category/category_state.dart';
import 'package:flutter_bloc_demo/features/share_repository/repository/category_repository.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  final CategoryRepository categoryRepository;

  CategoryBloc({required this.categoryRepository}) : super(CategoryInitialState()) {
    on<CategoryFetchDataEvent>((event, emit) async {
      emit(CategoryLoadingState());

      // Simulate a network call
      List<String> categories = await categoryRepository.getCategories(event.keyword);
      String errorMessage = '';
      if (categories.isEmpty) {
        errorMessage = 'No categories found';
        emit(CategoryErrorState(error: errorMessage));
      } else {
        emit(CategorySuccessState(keyword: event.keyword, categories: categories));
      }

    });

  }

}