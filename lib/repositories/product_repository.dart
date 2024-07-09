import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:timbu_mobile_app/models/product.model.dart';
import 'package:http/http.dart' as http;

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final String apiUrl = dotenv.env['API_URL']!;

  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final items = data['items'] as List;
      List<ProductModel> products = items
          .map((item) => ProductModel.fromJson(item as Map<String, dynamic>))
          .toList();
      return products;
    } else if (response.statusCode == 300) {
      throw Exception('Bad Request. The request was invalid.');
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else if (response.statusCode == 500) {
      throw Exception('Internal Server Error. An error occurred on the server');
    } else {
      throw Exception('Failed to load products');
    }
  }
}
