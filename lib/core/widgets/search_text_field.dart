import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.fieldWidth,
    this.fieldHeight,
    this.hintText,
    this.isPassword,
    this.suffixIcon,
    required this.onSubmitted,
  });

  final double? fieldHeight;
  final double? fieldWidth;
  final String? hintText;
  final bool? isPassword;
  final Widget? suffixIcon;

  final ValueChanged<String>? onSubmitted;

  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 52.h,
            child: TextField(
              onSubmitted: onSubmitted,
              decoration: InputDecoration(
                fillColor: AppColors.whiteColor,
                hintText: 'Search for clothes...',
                hintStyle: TextStyle(
                  fontFamily: GoogleFonts.readexPro().fontFamily,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary400Color,
                ),
                prefixIcon: const Icon(Icons.search, color: Color(0xffB3B3B3)),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: AppColors.primary100Color,
                    width: 1.w,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(
                    color: AppColors.primary100Color,
                    width: 1.w,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          height: 52.h,
          width: 52.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: const Icon(Icons.tune, color: Colors.white),
        ),
      ],
    );
  }
}
