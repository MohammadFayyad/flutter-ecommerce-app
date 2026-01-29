import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextSpan extends StatelessWidget {
  const CustomTextSpan({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Don\'t have an account? ',
          style: TextStyle(
            letterSpacing: 0,
            fontFamily: GoogleFonts.readexPro().fontFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primary500Color,
          ),
          children: [
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () => context.pushReplacement(AppRouter.signUpScreen),
              text: 'Sign Up',
              style: TextStyle(
                decoration: TextDecoration.underline,
                letterSpacing: 0,
                fontFamily: GoogleFonts.readexPro().fontFamily,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary900Color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
