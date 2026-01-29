import 'package:ecommerce_app/features/my_cart/cubit/my_cart_cubit.dart';
import 'package:ecommerce_app/features/my_cart/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.item});

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(item.image, width: 80, height: 80, fit: BoxFit.cover),
        const SizedBox(width: 12),

        Expanded(
          child: Text(
            item.title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),

        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () => context.read<MyCartCubit>().decrement(item.id),
        ),

        Text(
          item.quantity.toString(),
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),

        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => context.read<MyCartCubit>().increment(item.id),
        ),
      ],
    );
  }
}
