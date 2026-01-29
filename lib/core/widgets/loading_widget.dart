import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.width, this.height});
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? MediaQuery.of(context).size.height,
      child: LottieBuilder.asset(
        'assets/lottie/Loading_animation.json',
        reverse: true,
        repeat: true,
      ),
    );
  }
}
