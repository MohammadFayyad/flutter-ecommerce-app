import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/style/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.titleText,
    this.hintText,
    this.controller,
    this.validator,
    this.onChanged,
    this.isPassword = false,
    this.suffixIcon,
  });

  final String titleText;
  final String? hintText;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onChanged;
  final bool isPassword;
  final Widget? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 341.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.titleText,
            style: TextStyle(
              fontFamily: GoogleFonts.readexPro().fontFamily,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primary900Color,
            ),
          ),
          SizedBox(height: 4.h),
          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            onChanged: widget.onChanged,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: _obscureText,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xffF7F8F9),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                fontFamily: AppFonts.mainFontName,
                fontSize: 16.sp,
                color: AppColors.primary400Color,
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_rounded
                            : Icons.visibility_off_rounded,
                        color: const Color(0xffB3B3B3),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                          FocusScope.of(context).unfocus();
                        });
                      },
                    )
                  : widget.suffixIcon,
              enabledBorder: _border(),
              focusedBorder: _border(),
              errorBorder: _border(color: AppColors.errorRedColor),
              focusedErrorBorder: _border(color: AppColors.errorRedColor),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _border({Color color = const Color(0xffE8ECF4)}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(width: 1.w, color: color),
    );
  }
}
