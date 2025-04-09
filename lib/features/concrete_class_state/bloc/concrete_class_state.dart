enum Status {
  initial,
  loading,
  loaded,
  error,
}

class ConcreteClassState {
  
  final Status status;
  final List<String> dataList;
  final String errorMessage;
  final String keyword;

  const ConcreteClassState({
    this.status = Status.initial,
    this.dataList = const [],
    this.errorMessage = '',
    this.keyword = '',
  });
}
