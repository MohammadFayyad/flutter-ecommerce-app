import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/style/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String? text;
  final Color? buttonColor;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? textColor;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? borderColor;

  const PrimaryButtonWidget({
    super.key,
    this.text,
    this.buttonColor,
    this.onPressed,
    this.width,
    this.height,
    this.borderRadius,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.fontFamily,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor ?? Colors.transparent, width: 1.w),

        // textStyle: TextStyle(color: textColor ?? Colors.white),
        backgroundColor: buttonColor ?? AppColors.primaryColor,
        fixedSize: Size(width ?? 331.w, height ?? 56.h),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
        ),
      ),
      child: text != null
          ? Text(
              text ?? '',
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: fontSize ?? 16.sp,
                fontWeight: fontWeight ?? .w600,
                fontFamily: fontFamily ?? AppFonts.mainFontName,
              ),
            )
          : const CircularProgressIndicator(color: Colors.white),
    );
  }
}
