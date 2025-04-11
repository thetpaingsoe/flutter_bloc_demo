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



// enum Status {
//   initial,
//   loading,
//   loaded,
//   error,
// }

// class SealedClassState {
  
//   final Status status;
//   final List<String> dataList;
//   final String errorMessage;
//   final String keyword;

//   const SealedClassState({
//     this.status = Status.initial,
//     this.dataList = const [],
//     this.errorMessage = '',
//     this.keyword = '',
//   });
// }
