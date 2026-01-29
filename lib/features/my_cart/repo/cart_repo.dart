import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/features/my_cart/models/cart_model.dart';

class CartRepo {
  final DioHelper dioHelper;
  CartRepo({required this.dioHelper});
  Future<Either<String, CartModel>> getUserCart() async {
    try {
      final response = await dioHelper.get(
        endPoint: '${ApiEndpoints.carts}/user/2',
      );
      if (response.statusCode == 200) {
        final cartModels = CartModel.fromJson(response.data);
        return Right(cartModels);
      }
      return const Left('Failed to load cart');
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CartModel>> addToCart({
    required String date,
    required Product product,
    required int quantity,
  }) async {
    try {
      // final token = await secureStorage.getToken();
      final response = await dioHelper.put(
        endPoint: '${ApiEndpoints.carts}/${product.id}',
        data: {
          'userId': product.id,
          'date': date,
          'products': [
            {'productId': product.id, 'quantity': quantity},
          ],
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Right(CartModel.fromJson(response.data));
      }

      return const Left('Failed to add product to cart');
    } on DioException catch (e) {
      return Left(e.response?.data?['message'] ?? 'Network error');
    } catch (e) {
      return Left(e.toString());
    }
  }
}
