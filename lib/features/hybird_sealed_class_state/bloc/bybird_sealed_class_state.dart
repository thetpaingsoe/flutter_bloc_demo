sealed class HybirdSealedClassState {}

final class HybirdSealedClassInitialState extends HybirdSealedClassState {
  HybirdSealedClassInitialState() : super();
}

final class HybirdSealedClassLoadingState extends HybirdSealedClassState {
  HybirdSealedClassLoadingState() : super();
}

final class HybirdSealedClassErrorState extends HybirdSealedClassState {
  final String errorMessage;
  HybirdSealedClassErrorState({required this.errorMessage}) : super();
}

class HybirdSealedClassSuccessState extends HybirdSealedClassState {
  final List<String> dataList; 
  final String keyword;
  HybirdSealedClassSuccessState({required this.keyword, required this.dataList}) : super();
}
