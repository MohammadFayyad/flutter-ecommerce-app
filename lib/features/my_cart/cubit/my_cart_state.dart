import 'package:ecommerce_app/features/my_cart/models/cart_item_model.dart';

abstract class MyCartState {}

class MyCartLoading extends MyCartState {}

class MyCartLoaded extends MyCartState {
  final List<CartItemModel> items;
  MyCartLoaded(this.items);
  int get subTotal =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);
  int get shipping => 80;
  int get total => subTotal + shipping;
}
