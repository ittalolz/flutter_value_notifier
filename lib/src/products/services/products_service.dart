import 'package:flutter_value_notifier/src/products/models/product_model.dart';
import 'package:uno/uno.dart';

class ProductService {
  final Uno uno;

  ProductService(this.uno);

  Future<List<ProductModel>> fetchProducts() async {
    final response = await uno.get('http://localhost:3031/products');

    final list = response.data as List;

    final products = list.map((e) => ProductModel.fromMap(e)).toList();

    return products;
  }
}
