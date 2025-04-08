class RepositoryProviderState {
  bool isLoading;
  String data;
  
  RepositoryProviderState({
    this.isLoading = false,
    this.data = '',
  });

  RepositoryProviderState copyWith({
    bool? isLoading,
    String? data     
  }) {
    return RepositoryProviderState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data
    );
  }
}