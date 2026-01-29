import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/utils/connectivity_service.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/account_screen/account_screen.dart';
import 'package:ecommerce_app/features/home_page_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home_page_screen/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/home_page_screen/home_screen.dart';
import 'package:ecommerce_app/features/mycart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/mycart/cubit/my_cart_cubit.dart';
import 'package:ecommerce_app/features/mycart/mycart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  void goBackToHome() {
    currentIndex = 0;
    setState(() {});
  }

  late final List<Widget> screens = [
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProductCubit>()),
        BlocProvider(create: (context) => sl<CategoriesCubit>()),
        BlocProvider(create: (context) => sl<ConnectivityCubit>()),
      ],
      child: const HomeScreen(),
    ),
    BlocProvider(
      create: (context) => sl<MyCartCubit>(),
      child: MyCartScreen(onTapBack: goBackToHome),
    ),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) async {
          {
            setState(() {
              currentIndex = value;
            });
            if (currentIndex == 1) {
              context.read<CartCubit>().fetchCart();
            }
          }
        },
        backgroundColor: Colors.white,
        unselectedItemColor: AppColors.primary400Color,
        selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
        selectedItemColor: AppColors.primaryColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            tooltip: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
            tooltip: 'Account',
          ),
        ],
      ),
    );
  }
}
