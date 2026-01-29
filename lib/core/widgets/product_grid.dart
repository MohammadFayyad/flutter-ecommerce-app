import 'package:ecommerce_app/core/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductGrid extends StatelessWidget {
  final List products;
  const ProductGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 19.w,
          childAspectRatio: 0.75,
        ),
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            columnCount: 2,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 100.0,
              child: FadeInAnimation(
                duration: const Duration(milliseconds: 500),
                child: ProductCard(product: products[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
