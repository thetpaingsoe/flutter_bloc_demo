sealed class CategoryState {}

final class CategoryInitialState extends CategoryState {
  CategoryInitialState() : super();
}

final class CategoryLoadingState extends CategoryState {
  CategoryLoadingState() : super();
}

final class CategoryErrorState extends CategoryState {
  final String error;
  CategoryErrorState({required this.error}) : super();
}

final class CategorySuccessState extends CategoryState {
  final List<String> categories;
  final String? keyword;
  CategorySuccessState({required this.categories, this.keyword  = ''}) : super();
}

