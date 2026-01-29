import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 59.h, left: 24.w, right: 24.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Create an account',
                style: TextStyle(
                  letterSpacing: -1,
                  fontFamily: GoogleFonts.readexPro().fontFamily,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary900Color,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Let’s create your account.',
                style: TextStyle(
                  letterSpacing: 0,
                  fontFamily: GoogleFonts.readexPro().fontFamily,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primary500Color,
                ),
              ),
              SizedBox(height: 24.h),
              const CustomTextField(
                isPassword: false,
                titleText: 'Full Name',
                hintText: 'Enter your full name',
              ),
              SizedBox(height: 16.h),
              const CustomTextField(
                isPassword: false,
                titleText: 'User Name',
                hintText: 'Enter your email address',
              ),
              SizedBox(height: 16.h),
              const CustomTextField(
                isPassword: true,
                titleText: 'Password',
                hintText: 'Enter your password',
              ),
              SizedBox(height: 42.h),
              const CustomTextField(
                isPassword: true,
                titleText: 'Confirm Password',
                hintText: 'Enter your password',
              ),
              SizedBox(height: 42.h),
              Center(
                child: PrimaryButtonWidget(
                  fontFamily: GoogleFonts.dmSans().fontFamily,
                  borderRadius: 10.r,
                  text: 'Sign In',
                  textColor: Colors.white,
                  buttonColor: AppColors.primaryColor,
                  height: 50.h,
                  width: 325.w,
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
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
                          ..onTap = () {
                            context.pushReplacement(AppRouter.loginScreen);
                          },
                        text: 'Log In',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: GoogleFonts.readexPro().fontFamily,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary900Color,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
