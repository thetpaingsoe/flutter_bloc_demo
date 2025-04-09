class DataListRepository {

  // random strings 10 lines
  List<String> dataList = [
    "apple",
    "banana",
    "cherry",
    "date",
    "elderberry",
    "fig",
    "grape",
    "honeydew",
    "kiwi",
    "lemon"
  ];

  Future<List<String>> getItems(String keyword) async{
    // Simulate a network call
    await Future.delayed(const Duration(seconds: 2));
    if (keyword.isEmpty) {
      return dataList;
    }

    // Filter the list based on the keyword
    return dataList.where((item) => item.toLowerCase().contains(keyword.toLowerCase())).toList();    
  }
}