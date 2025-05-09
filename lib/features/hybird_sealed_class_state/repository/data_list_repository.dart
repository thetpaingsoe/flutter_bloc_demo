class DataListRepository {

  // random strings 10 lines
  List<String> dataList = [
    "Apple",
    "Banana",
    "Orange",
    "Mango",
    "Pineapple",
    "Watermelon",
    "Strawberry",
    "Grape",
    "Kiwi",
    "Peach"
  ];

  Future<List<String>> getItems(String keyword) async{
    // Simulate a network call
    await Future.delayed(const Duration(milliseconds: 200));
    if (keyword.isEmpty) {
      return dataList;
    }

    // Filter the list based on the keyword
    return dataList.where((item) => item.toLowerCase().contains(keyword.toLowerCase())).toList();    
  }
}