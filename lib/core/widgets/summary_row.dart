import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  final Color? color;

  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: GoogleFonts.readexPro().fontFamily,
              fontSize: 16.sp,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: color ?? AppColors.primary500Color,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: GoogleFonts.readexPro().fontFamily,
              fontSize: 16.sp,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              color: AppColors.primary900Color,
            ),
          ),
        ],
      ),
    );
  }
}
