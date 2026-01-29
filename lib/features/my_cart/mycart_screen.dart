import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/widgets/cart_item.dart';
import 'package:ecommerce_app/core/widgets/loading_widget.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/features/my_cart/cart_summary.dart';
import 'package:ecommerce_app/features/my_cart/cubit/my_cart_cubit.dart';
import 'package:ecommerce_app/features/my_cart/cubit/my_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key, this.onTapBack});

  final VoidCallback? onTapBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: onTapBack == null
            ? null
            : IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primary900Color,
                ),
                onPressed: onTapBack,
              ),
        surfaceTintColor: AppColors.whiteColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.readexPro().fontFamily,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primary900Color,
        ),
        title: const Text('My Cart'),
      ),

      body: BlocBuilder<MyCartCubit, MyCartState>(
        builder: (context, state) {
          if (state is MyCartLoading) {
            return const LoadingWidget();
          }
          final cart = state as MyCartLoaded;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: cart.items.length,
                    separatorBuilder: (_, _) => SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      return CartItem(item: cart.items[index]);
                    },
                  ),
                ),

                CartSummary(
                  subTotal: cart.subTotal,
                  shipping: cart.shipping,
                  total: cart.total,
                ),

                SizedBox(height: 24.h),

                PrimaryButtonWidget(
                  height: 54.h,
                  width: double.infinity,
                  text: 'Go To Checkout',
                ),

                SizedBox(height: 32.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
