import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/utils/connectivity_service.dart';
import 'package:ecommerce_app/core/widgets/categories_section.dart';
import 'package:ecommerce_app/core/widgets/loading_widget.dart';
import 'package:ecommerce_app/core/widgets/offline_banner.dart';
import 'package:ecommerce_app/core/widgets/product_grid.dart';
import 'package:ecommerce_app/core/widgets/search_text_field.dart';
import 'package:ecommerce_app/features/home_page_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home_page_screen/cubit/categories_state.dart';
import 'package:ecommerce_app/features/home_page_screen/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/home_page_screen/cubit/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().selectCategory('all');
    context.read<CategoriesCubit>().getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 59.h, left: 24.w, right: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<ConnectivityCubit, ConnectivityState>(
            builder: (context, state) {
              if (!state.isOnline) return const OfflineBanner();
              return const SizedBox();
            },
          ),
          SizedBox(height: 16.h),
          Text(
            'Discover',
            style: TextStyle(
              fontSize: 32.sp,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.readexPro().fontFamily,
              color: AppColors.primary900Color,
            ),
          ),
          SizedBox(height: 16.h),
          SearchTextField(onSubmitted: (query) {}),
          SizedBox(height: 16.h),
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded) {
                return BlocSelector<ProductCubit, ProductState, String>(
                  selector: (state) => state.categoryKey,
                  builder: (context, selectedKey) {
                    return CategoriesSection(
                      categories: state.categories,
                      selectedCategory: selectedKey,
                      onCategorySelected: (key) {
                        context.read<ProductCubit>().selectCategory(key);
                      },
                    );
                  },
                );
              }
              if (state is CategoriesLoading) {
                return const SizedBox(
                  height: 40,
                  child: Center(child: LoadingWidget()),
                );
              }

              if (state is CategoriesError) {
                return Text(state.message);
              }

              return const SizedBox();
            },
          ),

          SizedBox(height: 24.h),
          Expanded(
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: GridView.builder(
                      itemCount: 20,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20.h,
                        crossAxisSpacing: 19.w,
                        childAspectRatio: 0.75,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.blue,
                          height: 174.h,
                          width: 161.w,
                        );
                      },
                    ),
                  );
                }
                if (state is ProductLoaded) {
                  return RefreshIndicator(
                    semanticsLabel: 'Refresh products',
                    semanticsValue: 'Pull down to refresh the product list',
                    color: AppColors.primaryColor,
                    backgroundColor: Colors.white,
                    onRefresh: () {
                      return context.read<ProductCubit>().refresh();
                    },
                    child: ProductGrid(products: state.products),
                  );
                }
                if (state is ProductError) {
                  return Center(child: Text(state.message));
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}
