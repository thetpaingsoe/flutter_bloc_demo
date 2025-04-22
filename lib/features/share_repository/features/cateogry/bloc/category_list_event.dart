sealed class CategoryListEvent {}

final class CategoryFetchDataEvent extends CategoryListEvent {
  final String keyword;
  CategoryFetchDataEvent({required this.keyword}) : super();
}