import 'package:dio/dio.dart';
import 'package:fire_base_project2/posts/models/products_data.dart';

class MyApiServices {
  static final baseUrl = 'https://dummyjson.com';
  // static final baseUrl = 'https://fakestoreapi.com';
  //https://fakestoreapi.com
  final Dio dio = Dio();
  MyApiServices() {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json,
    );
  }

  Future<List<ProductsData>> getProducts() async {
    try {
      final response = await dio.get('/products');

      if (response.statusCode == 200) {
        var data = response.data;
        var json = data['products'];
        final product = json.map<ProductsData>((json) {
          return ProductsData.fromJson(json as Map<String, dynamic>);
        }).toList();
        return product;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
