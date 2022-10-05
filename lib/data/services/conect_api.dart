import 'dart:convert';

import 'package:app_riveepod_example/data/models/product_model.dart';
import 'package:http/http.dart' as http;

class ConnectApi {
  final url = Uri.parse('https://5dvcoyvs40.execute-api.eu-west-1.amazonaws.com/dev1/v2/category/GNLnouveaute/products');
  Future<List<Product>> getProducts() async {
    final response = await http.get(url);
    final body = jsonDecode(response.body);

    if (response.statusCode != 200) return throw ("Hubo un error");
    if ((body['products'] as List).isEmpty) return [];

    late ProductoModel products;

    for (var i = 0; i < 25; i++) {
      products = ProductoModel.fromMap(body);
    }
    return products.products;
  }
}
