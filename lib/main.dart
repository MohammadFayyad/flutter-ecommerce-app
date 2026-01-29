import 'package:ecommerce_app/core/routing/app_router.dart';
import 'package:ecommerce_app/core/utils/auth_local_data_source.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_transitions/go_transitions.dart';

late bool isLoggedIn;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  isLoggedIn = await sl<AuthLocalDataSource>().isLoggedIn();
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp.router(
          theme: ThemeData(
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: GoTransitions.fade,
                TargetPlatform.iOS: GoTransitions.cupertino,
                TargetPlatform.macOS: GoTransitions.cupertino,
              },
            ),
          ),
          routerConfig: AppRouter.router(isLoggedIn),
          title: 'Material App',
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
