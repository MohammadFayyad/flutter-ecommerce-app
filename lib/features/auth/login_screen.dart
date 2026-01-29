import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/utils/animate_snack_bar.dart';
import 'package:ecommerce_app/core/widgets/custom_text_field.dart';
import 'package:ecommerce_app/core/widgets/custom_text_span.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isFormValid = false;
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthCubit, AuthState>(
        listenWhen: (_, current) =>
            current is ErrorAuthState || current is SuccessAuthState,
        listener: (context, state) async {
          if (state is ErrorAuthState) {
            showAnimatedSnackBar(
              context,
              message: state.message,
              type: AnimatedSnackBarType.error,
            );
          } else if (state is SuccessAuthState) {
            showAnimatedSnackBar(
              context,
              message: 'Login successful',
              type: AnimatedSnackBarType.success,
            );
            await Future.delayed(const Duration(milliseconds: 300));
            if (context.mounted) {
              context.go(AppRouter.homePageScreen);
            }
          }
        },
        builder: (context, state) {
          final bool isLoading = state is LoadingAuthState;
          final bool isDisabled = isLoading || !isFormValid;
          return Padding(
            padding: EdgeInsets.only(top: 59.h, left: 24.w, right: 24.w),
            child: Form(
              key: formKey,
              onChanged: () {
                final valid = formKey.currentState?.validate() ?? false;
                final bool changed = valid != isFormValid;
                if (changed) {
                  setState(() => isFormValid = valid);
                }
              },
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    'Login to your account',
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
                    'It’s great to see you again.',
                    style: TextStyle(
                      letterSpacing: 0,
                      fontFamily: GoogleFonts.readexPro().fontFamily,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary500Color,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    controller: usernameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                    hintText: 'Enter your email address',
                    titleText: 'User Name',
                    isPassword: false,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    isPassword: true,
                    hintText: 'Enter your password',
                    titleText: 'Password',
                  ),
                  SizedBox(height: 55.h),
                  Center(
                    child: PrimaryButtonWidget(
                      text: isLoading ? null : 'Sign In',
                      buttonColor: isDisabled
                          ? AppColors.primaryColor.withValues(alpha: 0.6)
                          : AppColors.primaryColor,
                      onPressed: isDisabled
                          ? null
                          : () {
                              context.read<AuthCubit>().login(
                                username: usernameController.text.trim(),
                                password: passwordController.text.trim(),
                              );
                            },
                    ),
                  ),
                  const Spacer(),
                  const CustomTextSpan(),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
