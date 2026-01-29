import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/utils/secure_storage.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_state.dart';
import 'package:ecommerce_app/features/auth/models/login_response_model.dart';
import 'package:ecommerce_app/features/auth/repo/auth_repo.dart';
import 'package:ecommerce_app/features/home_page_screen/repo/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(InitialAuthState());
  final AuthRepo authRepo;
  void login({required String username, required String password}) async {
    emit(LoadingAuthState());
    final Either<String, LoginResponseModel> response = await authRepo.login(
      username: username,
      password: password,
    );
    response.fold(
      (left) {
        emit(ErrorAuthState(message: left));
      },
      (right) {
        emit(SuccessAuthState(message: 'Login successful'));
      },
    );
  }

  void logout(BuildContext context) async {
    await sl<SecureStorage>().deleteToken();
    sl<HomeRepo>().clearCache();
    if (context.mounted) {
      context.go(AppRouter.loginScreen);
    }
  }
}
