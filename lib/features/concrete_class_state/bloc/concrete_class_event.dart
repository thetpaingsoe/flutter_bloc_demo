sealed class ConcreteClassEvent {}

final class ConcreteClassFetchDataEvent extends ConcreteClassEvent {
  final String keyword;

  ConcreteClassFetchDataEvent({required this.keyword}) : super();
}