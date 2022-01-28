import 'dart:convert';

import 'package:flutter_value_notifier/src/products/services/products_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

class UnoMock extends Mock implements Uno {}
class RequestMock extends Mock implements Request {}

void main() {
  final unoMock = UnoMock();

  final service = ProductService(unoMock);

  test('should get all products', () async {
    when(() => unoMock.get(any())).thenAnswer((_) async =>
        Response(
            headers: {}, request: RequestMock(), status: 200, data: jsonResponse
        ),
    );
    final products = await service.fetchProducts();
    expect(products[0].title, 'Flutter 2');
  });
}


final jsonResponse = jsonDecode('''
[
  {
    "id": "0",
    "title": "Flutter 2"
  },
  {
    "id": "1",
    "title": "React Native"
  },
  {
    "title": "Ionic",
    "id": "2"
  }
]''');