import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/widgets/address_card.dart';
import 'package:ecommerce_app/features/address_screen/cubit/address_cubit.dart';
import 'package:ecommerce_app/features/address_screen/cubit/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AddressCubit>().getAddress();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
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
        title: const Text('Address'),
      ),
      body: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          if (state is AddressLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AddressErrorState) {
            return Center(child: Text(state.message));
          }
          if (state is AddressLoadedState) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 1,
              itemBuilder: (context, index) =>
                  AddressCard(addressModel: state.address),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
            );
          }
          return Container();
        },
      ),
    );
  }
}
