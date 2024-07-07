import 'dart:convert';
import 'package:timbu_stage2/utilities/constants.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;

class Network {
  static const String _baseUrl = 'https://api.timbu.cloud/products';

  static const String _orgId = TimbuConstants.organizationId;
  static const String _appid = TimbuConstants.appId;
  static const String _appKey = TimbuConstants.appKey;

  Future<List<Product>> fetchProducts() async {
    var url = Uri.parse(
        '$_baseUrl?organization_id=$_orgId&Appid=$_appid&Apikey=$_appKey&page=1&reverse_sort=false&size=20');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['items'] != null && data['items'] is List) {
        List<Product> products = (data['items'] as List<dynamic>)
            .map((product) => Product.fromJson(product as Map<String, dynamic>))
            .toList();
        return products;
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load products');
    }
  }
}
