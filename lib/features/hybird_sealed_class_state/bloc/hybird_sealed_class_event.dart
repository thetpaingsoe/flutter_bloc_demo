sealed class HybirdSealedClassEvent {}

final class HybirdSealedClassFetchDataEvent extends HybirdSealedClassEvent {
  final String keyword;
  HybirdSealedClassFetchDataEvent({required this.keyword}) : super();
}

final class HybirdSealedClassInitialEvent extends HybirdSealedClassEvent {
  HybirdSealedClassInitialEvent() : super();
}