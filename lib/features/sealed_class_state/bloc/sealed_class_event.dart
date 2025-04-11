sealed class SealedClassEvent {}

final class SealedClassFetchDataEvent extends SealedClassEvent {
  final String keyword;
  SealedClassFetchDataEvent({required this.keyword}) : super();
}

final class SealedClassInitialEvent extends SealedClassEvent {
  SealedClassInitialEvent() : super();
}