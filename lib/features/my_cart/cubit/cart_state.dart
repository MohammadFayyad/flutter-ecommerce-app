import 'package:ecommerce_app/features/my_cart/models/cart_model.dart';

abstract class CartState {
  final bool isAdded;
  const CartState(this.isAdded);
}

class CartInitial extends CartState {
  CartInitial(super.isAdded);
}

class CartLoading extends CartState {
  CartLoading(super.isAdded);
}

class CartLoaded extends CartState {
  final CartModel cartItems;
  CartLoaded(super.isAdded, {required this.cartItems});
}

class CartError extends CartState {
  final String message;
  CartError(super.isAdded, {required this.message});
}

class AddingToCartLoading extends CartState {
  AddingToCartLoading(super.isAdded);
}

class AddingToCartSuccess extends CartState {
  final String message;
  AddingToCartSuccess(super.isAdded, {required this.message});
}

class AddingToCartError extends CartState {
  final String message;
  AddingToCartError(super.isAdded, {required this.message});
}
