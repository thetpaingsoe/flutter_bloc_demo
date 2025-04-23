
import 'package:flutter_bloc_demo/features/hybird_sealed_class_state/repository/data_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DataList Repository', () {
    
    final repository = DataListRepository();

    test('should return all items when keyword is empty', () async {
      final result = await repository.getItems('');
      expect(result.length, 10);      
    });

    test('should return filtered items when keyword is provided', () async {
      final result = await repository.getItems('App');
      expect(result.length, 2);
      expect(result, ['Apple', 'Pineapple']);
    });

    test('should return empty list when no items match the keyword', () async {
      final result = await repository.getItems('xyz');
      expect(result.length, 0);
    });

  });
}