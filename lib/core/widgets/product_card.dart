import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/widgets/loading_widget.dart';
import 'package:ecommerce_app/features/home_page_screen/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {context.push(AppRouter.productDetails, extra: product)},
      child: SizedBox(
        height: 174.h,
        width: 161.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Hero(
                  tag: product.id,
                  child: CachedNetworkImage(
                    memCacheHeight: 174.h.toInt(),
                    memCacheWidth: 161.w.toInt(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) =>
                        const Center(child: LoadingWidget()),
                    imageUrl: product.image,
                    height: 174.h,
                    width: 161.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              maxLines: 2,
              product.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppColors.primary900Color,
              ),
            ),
            Text(
              '\$ ${product.price}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: AppColors.primary500Color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
