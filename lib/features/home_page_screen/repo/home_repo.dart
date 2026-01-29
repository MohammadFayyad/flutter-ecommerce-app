import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/utils/connectivity_service.dart';
import 'package:ecommerce_app/features/home_page_screen/models/products_model.dart';

class HomeRepo {
  HomeRepo({required this.dioHelper, required this.networkService});

  final DioHelper dioHelper;
  final NetworkService networkService;

  List<String>? _categoriesCache;
  final Map<String, List<ProductModel>> _productsCache = {};

  Future<Either<String, List<String>>> getCategories() async {
    try {
      if (_categoriesCache != null) {
        return Right(_categoriesCache!);
      }

      final response = await dioHelper.get(
        endPoint: ApiEndpoints.allCategories,
      );
      _categoriesCache = ['all', ...List<String>.from(response.data)];

      return Right(_categoriesCache!);
    } catch (e) {
      if (!await networkService.isConnected()) {
        if (_categoriesCache != null) {
          return Right(_categoriesCache!);
        }
        return const Left('No internet connection');
      }

      return const Left('Failed to load categories');
    }
  }

  Future<Either<String, List<ProductModel>>> getProducts({
    required String category,
  }) async {
    try {
      if (_productsCache.containsKey(category)) {
        return Right(_productsCache[category]!);
      }

      final response = await dioHelper.get(endPoint: category);
      final products = productModelFromJson(response.data);

      _productsCache[category] = products;
      return Right(products);
    } catch (e) {
      if (!await networkService.isConnected()) {
        if (_productsCache.containsKey(category)) {
          return Right(_productsCache[category]!);
        }
        return const Left('No internet connection');
      }

      return const Left('Failed to load products');
    }
  }

  void clearCache() {
    _productsCache.clear();
    _categoriesCache = null;
  }
}
