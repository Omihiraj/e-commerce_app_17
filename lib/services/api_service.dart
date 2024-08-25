import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<List> getCategories() async {
    var url = Uri.https('fakestoreapi.com', 'products/categories');
    var response = await http.get(url);
    List categoryList = jsonDecode(response.body);
    return categoryList;
  }

  static getProducts() async {
    var url = Uri.https('fakestoreapi.com', 'products');
    var response = await http.get(url);
    print(response.body);
  }

  static getProductById({required String productId}) async {
    Uri url = Uri.https('fakestoreapi.com', 'products/$productId');
    http.Response response = await http.get(url);

    print(response.statusCode);
    print(response.body);
  }
}
