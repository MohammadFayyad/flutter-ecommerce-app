import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/account_screen/account_screen.dart';
import 'package:ecommerce_app/features/address_screen/address_screen.dart';
import 'package:ecommerce_app/features/address_screen/cubit/address_cubit.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/login_screen.dart';
import 'package:ecommerce_app/features/auth/sign_up_screen.dart';
import 'package:ecommerce_app/features/home_page_screen/main_screen.dart';
import 'package:ecommerce_app/features/home_page_screen/models/products_model.dart';
import 'package:ecommerce_app/features/home_page_screen/models/rating.dart';
import 'package:ecommerce_app/features/my_cart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/my_cart/cubit/my_cart_cubit.dart';
import 'package:ecommerce_app/features/my_cart/mycart_screen.dart';
import 'package:ecommerce_app/features/product_details_screen/product_details_screen.dart';
import 'package:ecommerce_app/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String loginScreen = '/loginScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String mainScreen = '/mainScreen';
  static const String homePageScreen = '/homePageScreen';
  static const String myCart = '/myCart';
  static const String productDetails = '/productDetails';
  static const String passwordChangedScreen = '/passwordChangedScreen';
  static const String accountScreen = '/accountScreen';
  static const String addressScreen = '/addressScreen';
  static const String splashScreen = '/splashScreen';

  static GoRouter router(bool isLoggedIn) {
    return GoRouter(
      routerNeglect: true,
      debugLogDiagnostics: true,
      errorBuilder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Page Not Found'),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 64, color: Colors.red),
                const SizedBox(height: 16),
                const Text(
                  'Page Not Found',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'The page you are looking for does not exist.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => context.go(AppRouter.splashScreen),
                  child: const Text('Go Home'),
                ),
              ],
            ),
          ),
        );
      },
      initialLocation: AppRouter.splashScreen,
      routes: [
        GoRoute(
          path: AppRouter.splashScreen,
          name: AppRouter.splashScreen,
          builder: (context, state) => SplashScreen(isLoggedIn: isLoggedIn),
        ),
        GoRoute(
          path: AppRouter.loginScreen,
          builder: (context, state) => BlocProvider(
            create: (context) => sl<AuthCubit>(),
            child: const LoginScreen(),
          ),
        ),
        GoRoute(
          path: AppRouter.signUpScreen,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: AppRouter.homePageScreen,
          builder: (context, state) => BlocProvider(
            create: (context) => sl<CartCubit>(),
            child: const MainScreen(),
          ),
        ),
        GoRoute(
          path: AppRouter.productDetails,
          builder: (context, state) {
            final product =
                state.extra ??
                const ProductModel(
                  title: '',
                  image: '',
                  price: 0,
                  id: 0,
                  rating: Rating(rate: 0, count: 0),
                  description: '',
                  category: '',
                );
            return BlocProvider(
              create: (context) => sl<CartCubit>(),
              child: ProductDetails(product: product),
            );
          },
        ),
        GoRoute(
          path: AppRouter.myCart,
          builder: (context, state) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => sl<CartCubit>()),
                BlocProvider(create: (context) => sl<MyCartCubit>()),
              ],
              child: const MyCartScreen(),
            );
          },
        ),
        GoRoute(
          path: AppRouter.accountScreen,
          builder: (context, state) => const AccountScreen(),
        ),
        GoRoute(
          path: AppRouter.addressScreen,
          builder: (context, state) => BlocProvider(
            create: (context) => sl<AddressCubit>(),
            child: const AddressScreen(),
          ),
        ),
        GoRoute(
          path: AppRouter.mainScreen,
          name: AppRouter.mainScreen,
          builder: (context, state) => BlocProvider(
            create: (context) => sl<CartCubit>(),
            child: const MainScreen(),
          ),
        ),
      ],
    );
  }
}
