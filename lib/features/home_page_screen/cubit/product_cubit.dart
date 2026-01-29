import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/features/home_page_screen/cubit/product_state.dart';
import 'package:ecommerce_app/features/home_page_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.repo) : super(const ProductLoading(categoryKey: 'all'));

  final HomeRepo repo;
  String currentKey = 'all';

  Future<void> selectCategory(String key) async {
    currentKey = key;

    emit(ProductLoading(categoryKey: key));

    final endpoint = _mapKeyToEndpoint(key);
    final products = await repo.getProducts(category: endpoint);
    if (isClosed) return;

    products.fold(
      (e) => emit(ProductError(message: e, categoryKey: key)),
      (list) => emit(ProductLoaded(products: list, categoryKey: key)),
    );
  }

  Future<void> refresh() {
    repo.clearCache();
    return selectCategory('all');
  }

  String _mapKeyToEndpoint(String key) {
    if (key == 'all') return ApiEndpoints.allProducts;
    return '${ApiEndpoints.categoryProducts}$key';
  }
}
