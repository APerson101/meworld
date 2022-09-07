import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meworld/views/screens/authentication/login_view.dart';
import 'package:meworld/views/screens/authentication/reset_password_view.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';
import 'package:meworld/views/screens/main_app/artisans/artisan_details.dart';
import 'package:meworld/views/screens/main_app/artisans/category.dart';
import 'package:meworld/views/screens/main_app/artisans/category_details.dart';
import 'package:meworld/views/screens/main_app/main_app_view.dart';
import 'package:meworld/views/screens/main_app/settings_view.dart';
import 'package:meworld/views/screens/main_app/sports/sports_search_view.dart';
import 'package:meworld/views/screens/main_app/sports/sports_view.dart';

import 'views/screens/main_app/account_info_view.dart';

void main() async {
  await Hive.initFlutter();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate);
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: '/Sports',
        builder: (context, state) => const SportsView(),
      ),
      GoRoute(
        path: '/SignUp',
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: '/MainApp',
        builder: (context, state) => const MainAppView(),
      ),
      GoRoute(path: '/Settings', builder: (context, state) => SettingsView()),
      GoRoute(
          path: '/AccountInfo',
          builder: (context, state) => const AccountInfoView()),
      GoRoute(
        path: '/ResetPassword',
        builder: (context, state) => ResetPasswordView(),
      ),
      GoRoute(
        path: '/artisanCategory',
        builder: (context, state) => const ArtisanCategories(),
      ),
      GoRoute(
        path: '/artisanCategory/categoryDetails',
        builder: (context, state) => const ArtisanCategoryDetails(),
      ),
      GoRoute(
        path: '/artisanCategory/categoryDetails/artisanDetails',
        builder: (context, state) => ArtisanDetails(
          artisans: state.extra as Artisans,
        ),
      ),
      GoRoute(
          path: '/SportsSearch',
          builder: (context, state) => const SportsSearchView()),
    ],
  );
}
