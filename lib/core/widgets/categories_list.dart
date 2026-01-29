import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesList extends StatelessWidget {
  final String title;
  final bool isSelected;

  final GestureTapCallback? onTap;
  const CategoriesList({
    super.key,
    required this.title,
    this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        radius: 10.r,
        onTap: onTap,
        child: Container(
          height: 36.h,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.primary100Color),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: GoogleFonts.readexPro().fontFamily,
              color: isSelected
                  ? AppColors.whiteColor
                  : AppColors.primary900Color,
              fontWeight: .w600,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
