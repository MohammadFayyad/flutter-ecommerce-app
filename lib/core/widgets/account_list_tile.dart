import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountListTile extends StatelessWidget {
  final AccountItem item;

  const AccountListTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 25.h),
        child: Row(
          children: [
            Icon(item.icon, size: 24.sp),
            SizedBox(width: 16.w),
            Text(
              item.title,
              style: TextStyle(
                fontFamily: GoogleFonts.readexPro().fontFamily,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primary900Color,
              ),
            ),
            const Spacer(),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

class AccountItem {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AccountItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });
}
