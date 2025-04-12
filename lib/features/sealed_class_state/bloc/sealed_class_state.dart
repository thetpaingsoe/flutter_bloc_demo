sealed class SealedClassState {}

final class SealedClassInitialState extends SealedClassState {
  SealedClassInitialState() : super();
}

final class SealedClassLoadingState extends SealedClassState {
  SealedClassLoadingState() : super();
}

final class SealedClassErrorState extends SealedClassState {
  final String errorMessage;
  SealedClassErrorState({required this.errorMessage}) : super();
}

class SealedClassSuccessState extends SealedClassState {
  final List<String> dataList; 
  SealedClassSuccessState({required this.dataList}) : super();
}

final class SealedClassSearchState extends SealedClassSuccessState {
  final String keyword;
  SealedClassSearchState({required this.keyword, required super.dataList}) : super();
}
