import 'dart:async';

import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/style/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  final bool isLoggedIn;
  const SplashScreen({super.key, required this.isLoggedIn});
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeOut,
    );
    waitAnimationAndNavigate();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void waitAnimationAndNavigate() {
    Timer(const Duration(seconds: 1), () {
      if (mounted) {
        context.pushReplacement(
          widget.isLoggedIn ? AppRouter.homePageScreen : AppRouter.loginScreen,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(width: 200.w, AppAssets.logoIcon),
        ),
      ),
    );
  }
}
