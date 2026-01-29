import 'dart:ui';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/utils/animate_snack_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_bottom_sheet.dart';
import 'package:ecommerce_app/features/mycart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/mycart/cubit/cart_state.dart';
import 'package:ecommerce_app/features/mycart/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final dynamic product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        surfaceTintColor: AppColors.whiteColor,
        leadingWidth: 70.w,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.readexPro().fontFamily,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primary900Color,
        ),
        toolbarHeight: 88.h,
        backgroundColor: AppColors.whiteColor,
        centerTitle: true,
        title: const Text('Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 20.h),
              InteractiveViewer(
                maxScale: 2,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Hero(
                    tag: product.id,
                    child: CachedNetworkImage(
                      height: 368.53.h,
                      width: 341.w,
                      fit: BoxFit.fill,
                      imageUrl: product.image,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              SelectableText(
                selectionColor: AppColors.primaryColor.withAlpha(120),
                selectionHeightStyle: BoxHeightStyle.max,
                cursorColor: AppColors.primaryColor.withAlpha(120),
                product.title,
                style: TextStyle(
                  fontFamily: GoogleFonts.readexPro().fontFamily,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary900Color,
                ),
              ),
              SizedBox(height: 13.h),
              Row(
                children: [
                  const Icon(Icons.star, color: AppColors.primaryColor),
                  SizedBox(width: 6.w),
                  Text(
                    '${product.rating.rate} (${product.rating.count})',
                    style: TextStyle(
                      fontFamily: GoogleFonts.readexPro().fontFamily,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary900Color,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 13.h),
              SelectableText(
                selectionColor: AppColors.primaryColor.withAlpha(120),
                selectionHeightStyle: BoxHeightStyle.max,
                cursorColor: AppColors.primaryColor.withAlpha(120),
                product.description,
                style: TextStyle(
                  fontFamily: GoogleFonts.readexPro().fontFamily,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary500Color,
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
      bottomSheet: BlocConsumer<CartCubit, CartState>(
        builder: (context, state) {
          return CustomBottomSheet(
            price: product.price,
            text: state.isAdded ? null : 'Add to cart',
            onPressed: () {
              context.read<CartCubit>().addToCart(
                product: Product(
                  id: product.id,
                  title: product.title,
                  image: product.image,
                  price: product.price,
                ),
                quantity: 1,
              );
              context.pop();
            },
          );
        },
        listener: (BuildContext context, CartState state) {
          if (state is AddingToCartSuccess) {
            showAnimatedSnackBar(
              context,
              message: state.message,
              type: AnimatedSnackBarType.success,
            );
          }
        },
      ),
    );
  }
}
