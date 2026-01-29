import 'package:ecommerce_app/features/home_page_screen/models/products_model.dart';

abstract class ProductState {
  final String categoryKey;
  const ProductState(this.categoryKey);
}

class ProductLoading extends ProductState {
  const ProductLoading({required String categoryKey}) : super(categoryKey);
}

class ProductLoaded extends ProductState {
  final List<ProductModel> products;
  const ProductLoaded({required this.products, required String categoryKey})
    : super(categoryKey);
}

class ProductError extends ProductState {
  final String message;
  const ProductError({required this.message, required String categoryKey})
    : super(categoryKey);
}
