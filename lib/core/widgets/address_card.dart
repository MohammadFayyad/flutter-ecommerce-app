import 'dart:developer';

import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/features/address_screen/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressCard extends StatelessWidget {
  final AddressModel addressModel;
  final VoidCallback? onTap;
  const AddressCard({super.key, required this.addressModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    log(addressModel.address.toString());
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary100Color, width: 1.w),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 27,
              color: AppColors.primary400Color,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        addressModel.address.city,
                        style: TextStyle(
                          fontFamily: GoogleFonts.readexPro().fontFamily,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary900Color,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    addressModel.address.street,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: GoogleFonts.readexPro().fontFamily,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary500Color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
