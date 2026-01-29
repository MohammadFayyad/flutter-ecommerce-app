import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/utils/auth_local_data_source.dart';
import 'package:ecommerce_app/core/utils/connectivity_service.dart';
import 'package:ecommerce_app/core/utils/secure_storage.dart';
import 'package:ecommerce_app/features/address_screen/cubit/address_cubit.dart';
import 'package:ecommerce_app/features/address_screen/repo/address_repo.dart';
import 'package:ecommerce_app/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/features/auth/repo/auth_repo.dart';
import 'package:ecommerce_app/features/home_page_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home_page_screen/cubit/product_cubit.dart';
import 'package:ecommerce_app/features/home_page_screen/repo/home_repo.dart';
import 'package:ecommerce_app/features/mycart/cubit/cart_cubit.dart';
import 'package:ecommerce_app/features/mycart/cubit/my_cart_cubit.dart';
import 'package:ecommerce_app/features/mycart/repo/cart_repo.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;
void setupServiceLocator() {
  // Core
  sl.registerLazySingleton(() => DioHelper());
  sl.registerLazySingleton(() => SecureStorage());
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => NetworkService(sl<Connectivity>()));

  // Data sources
  sl.registerLazySingleton(() => AuthLocalDataSource(sl<SecureStorage>()));

  // Repos
  sl.registerLazySingleton(
    () => AuthRepo(
      dioHelper: sl<DioHelper>(),
      secureStorage: sl<SecureStorage>(),
    ),
  );
  sl.registerLazySingleton(() => CartRepo(dioHelper: sl<DioHelper>()));
  sl.registerLazySingleton(
    () => HomeRepo(
      dioHelper: sl<DioHelper>(),
      networkService: sl<NetworkService>(),
    ),
  );
  sl.registerLazySingleton(() => AddressRepo(dioHelper: sl<DioHelper>()));

  // Cubits
  sl.registerFactory(() => AuthCubit(sl<AuthRepo>()));
  sl.registerFactory(() => ProductCubit(sl<HomeRepo>()));
  sl.registerFactory(() => CategoriesCubit(sl<HomeRepo>()));
  sl.registerFactory(() => ConnectivityCubit(sl<NetworkService>()));
  sl.registerFactory(() => AddressCubit(sl<AddressRepo>()));
  sl.registerFactory(() => CartCubit(sl<CartRepo>()));
  sl.registerFactory(() => MyCartCubit());
}
