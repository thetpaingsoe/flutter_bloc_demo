sealed class CategoryListState {}

final class CategoryListInitialState extends CategoryListState {
  CategoryListInitialState() : super();
}

final class CategoryListLoadingState extends CategoryListState {
  CategoryListLoadingState() : super();
}

final class CategoryListErrorState extends CategoryListState {
  final String errorMessage;
  CategoryListErrorState({required this.errorMessage}) : super();
}

final class CategoryListSuccessState extends CategoryListState {
  final String keyword;
  final List<String> categoryList;
  CategoryListSuccessState({required this.keyword, required this.categoryList}) : super();
}