import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomSheet extends StatelessWidget {
  final double? price;
  final String? text;
  final VoidCallback onPressed;
  const CustomBottomSheet({
    super.key,
    this.price,
    this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        padding: EdgeInsets.fromLTRB(25.w, 20.h, 25.w, 16.h),
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          border: Border(
            top: BorderSide(color: AppColors.primary100Color, width: 1),
          ),
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontFamily: GoogleFonts.readexPro().fontFamily,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary500Color,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary900Color,
                  ),
                ),
              ],
            ),

            SizedBox(width: 16.w),
            Expanded(
              child: PrimaryButtonWidget(
                text: text,
                height: 54.h,
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
