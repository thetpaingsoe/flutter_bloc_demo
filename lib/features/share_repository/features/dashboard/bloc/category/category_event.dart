sealed class CategoryEvent {}

final class CategoryFetchDataEvent extends CategoryEvent {
  final String keyword;
  CategoryFetchDataEvent({required this.keyword}) : super();
}