import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/my_cart/cubit/cart_state.dart';
import 'package:ecommerce_app/features/my_cart/models/cart_model.dart';
import 'package:ecommerce_app/features/my_cart/repo/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo repo;
  CartCubit(this.repo) : super(CartInitial(false));
  void fetchCart() async {
    emit(CartLoading(false));
    final Either<String, CartModel> cart = await repo.getUserCart();
    if (isClosed) return;

    cart.fold((e) => emit(CartError(true, message: e)), (cart) {
      print('ss ${cart.products![0]}');
      emit(CartLoaded(true, cartItems: cart));
    });
  }

  void addToCart({required Product product, required int quantity}) async {
    emit(AddingToCartLoading(true));
    final date = DateTime.now().toString();
    final response = await repo.addToCart(
      date: date,
      product: product,
      quantity: quantity,
    );
    if (isClosed) return;
    response.fold(
      (e) => emit(AddingToCartError(false, message: e)),
      (cart) =>
          emit(AddingToCartSuccess(false, message: 'Product added to cart')),
    );
  }
}
