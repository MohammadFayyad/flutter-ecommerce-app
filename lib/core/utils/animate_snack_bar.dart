import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void showAnimatedSnackBar(
  BuildContext context, {
  String? message,
  AnimatedSnackBarType? type,
}) {
  AnimatedSnackBar.material(
    message ?? '',
    type: type ?? AnimatedSnackBarType.success,
    duration: const Duration(seconds: 2),
    mobileSnackBarPosition: .bottom,
  ).show(context);
}
