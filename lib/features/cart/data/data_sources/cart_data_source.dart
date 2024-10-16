import 'package:meem/core/api/api_consumer.dart';
import 'package:meem/core/api/endpoints.dart';
import 'package:meem/core/utils/models/product_model/product_model.dart';
import 'package:meem/features/cart/data/models/operation_cart_response.dart';

abstract class CartRemoteDataSource {
  Future<List<ProductModel>> getCartProducts();
  Future<OperationCartResponse> addOrRemoveFromCart({required String id});
}

class MyCartRemoteDataSourceImpl implements CartRemoteDataSource {
  final ApiConsumer apiConsumer;

  MyCartRemoteDataSourceImpl({required this.apiConsumer});
  @override
  Future<OperationCartResponse> addOrRemoveFromCart(
      {required String id}) async {
    Map<String, dynamic> jsonData = await apiConsumer
        .post(endPoint: EndPoints.carts, isFormData: true, bodyData: {
      'product_id': id,
    });
    return OperationCartResponse.fromJson(jsonData);
  }

  @override
  Future<List<ProductModel>> getCartProducts() async {
    Map<String, dynamic> jsonData =
        await apiConsumer.get(endPoint: EndPoints.carts);
    List<dynamic> results = jsonData["data"]["cart_items"];
    List<ProductModel> products = [];
    for (var item in results) {
      products.add(ProductModel.fromJson(item));
    }
   
    return products;
  }
}
