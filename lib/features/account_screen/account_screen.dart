import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/widgets/account_list_tile.dart';
import 'package:ecommerce_app/core/widgets/primary_button_widget.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        title: const Text('Account'),
      ),
      body: Column(
        children: [
          AccountListTile(
            item: AccountItem(
              icon: Icons.inventory_2_outlined,
              title: 'My Orders',
              onTap: () {
                context.push(AppRouter.myCart);
              },
            ),
          ),
          Divider(height: 0, thickness: 8.w),
          AccountListTile(
            item: AccountItem(
              icon: Icons.person_outline,
              title: 'My Details',
              onTap: () {
                context.pushReplacement(AppRouter.homePageScreen);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Divider(height: 0, thickness: 1.w),
          ),
          AccountListTile(
            item: AccountItem(
              icon: Icons.home_outlined,
              title: 'Address Book',
              onTap: () {
                context.push(AppRouter.addressScreen);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Divider(height: 0, thickness: 1.w),
          ),
          AccountListTile(
            item: AccountItem(
              icon: Icons.help_outline,
              title: 'FAQs',
              onTap: () {},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: const Divider(height: 0),
          ),
          AccountListTile(
            item: AccountItem(
              icon: Icons.headset_mic_outlined,
              title: 'Help Center',
              onTap: () {},
            ),
          ),
          Divider(thickness: 8.w, color: AppColors.primary100Color, height: 4),
          SizedBox(height: 150.h),
          const LogoutTile(),
        ],
      ),
    );
  }
}

class LogoutTile extends StatelessWidget {
  const LogoutTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.w),
      child: ListTile(
        leading: Transform.scale(
          scaleX: -1,
          child: const Icon(
            semanticLabel: 'Logout',
            textDirection: TextDirection.rtl,
            Icons.logout_outlined,
            color: Colors.red,
          ),
        ),
        title: const Text('Logout', style: TextStyle(color: Colors.red)),
        onTap: () {
          showLogoutDialog(context);
        },
      ),
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          icon: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                width: 7.w,
                style: BorderStyle.solid,
                color: AppColors.whiteColor,
              ),
              shape: BoxShape.circle,
              color: const Color(0xFFFBCFCF),
            ),
            child: Icon(Icons.error_outline_rounded, size: 70.sp),
          ),
          iconColor: AppColors.errorRedColor,
          iconPadding: EdgeInsets.only(bottom: 12.h, top: 24.h),
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.readexPro().fontFamily,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.primary900Color,
          ),
          contentTextStyle: TextStyle(
            fontFamily: GoogleFonts.readexPro().fontFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primary500Color,
          ),
          actionsAlignment: .center,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          title: const Column(children: [Text('Logout')]),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            PrimaryButtonWidget(
              width: 293.w,
              height: 54.h,
              borderRadius: 10.r,
              text: 'Yes, Logout',
              buttonColor: AppColors.errorRedColor,
              textColor: AppColors.whiteColor,
              onPressed: () => sl<AuthCubit>().logout(context),
            ),
            SizedBox(height: 16.h),
            PrimaryButtonWidget(
              borderColor: const Color(0xFFCCCCCC),
              width: 293.w,
              height: 54.h,
              text: 'No, Cancel',
              borderRadius: 10.r,
              buttonColor: AppColors.whiteColor,
              textColor: AppColors.primary900Color,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
