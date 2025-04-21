class CategoryRepository {
  Future<List<String>> getCategories(String keyword) async {
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 1));
    List<String> dataList = [];
    for (int i = 0; i < 10; i++) {
      dataList.add('Category $i');
    }
    return dataList;
  }
}