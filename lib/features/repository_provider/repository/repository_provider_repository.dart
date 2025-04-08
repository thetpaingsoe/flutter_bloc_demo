class RepositoryProviderRepository {
  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data fetched from RepositoryProvider';
  }
}