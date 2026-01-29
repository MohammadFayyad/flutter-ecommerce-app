import 'package:ecommerce_app/features/mycart/cubit/my_cart_state.dart';
import 'package:ecommerce_app/features/mycart/models/cart_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCartCubit extends Cubit<MyCartState> {
  MyCartCubit() : super(MyCartLoading()) {
    loadCart();
  }

  void loadCart() {
    emit(
      MyCartLoaded([
        CartItemModel(
          id: '1',
          title: 'Product 1',
          price: 100,
          image:
              'https://images.unsplash.com/photo-1511485977113-f34c92461ad9?w=500',
        ),
        CartItemModel(
          id: '2',
          title: 'Product 4',
          price: 100,
          image:
              'https://images.unsplash.com/photo-1511485977113-f34c92461ad9?w=500',
        ),
      ]),
    );
  }

  void increment(String id) {
    final state = this.state as MyCartLoaded;
    final items = [...state.items];

    final index = items.indexWhere((e) => e.id == id);
    items[index].quantity++;

    emit(MyCartLoaded(items));
  }

  void decrement(String id) {
    final state = this.state as MyCartLoaded;
    final items = [...state.items];

    final index = items.indexWhere((e) => e.id == id);
    if (items[index].quantity > 1) {
      items[index].quantity--;
      emit(MyCartLoaded(items));
    }
  }

  void removeItem(String id) {
    final state = this.state as MyCartLoaded;
    emit(MyCartLoaded(state.items.where((e) => e.id != id).toList()));
  }
}
