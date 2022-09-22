import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meworld/core/models/user_account_model.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/authentication/login_view.dart';
import 'package:meworld/views/screens/authentication/reset_password_view.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';
import 'package:meworld/views/screens/business%20forms/ecommerce_form_view.dart';
import 'package:meworld/views/screens/ecommerce_view.dart';
import 'package:meworld/views/screens/main_app/artisans/artisan_details.dart';
import 'package:meworld/views/screens/main_app/artisans/category.dart';
import 'package:meworld/views/screens/main_app/artisans/category_details.dart';
import 'package:meworld/views/screens/main_app/main_app_view.dart';
import 'package:meworld/views/screens/main_app/settings_view.dart';
import 'package:meworld/views/screens/main_app/sports/sports_search_view.dart';
import 'package:meworld/views/screens/main_app/sports/sports_view.dart';
import 'package:meworld/views/screens/main_app/transfer_amount_page.dart';

import 'firebase_options.dart';
import 'views/qrcodeview.dart';
import 'views/screens/business forms/gym_form_view.dart';
import 'views/screens/create_sports_event.dart';
import 'views/screens/main_app/account_info_view.dart';
import 'views/screens/main_app/dashboardwidgets/txnswalletview.dart';

// DEBUG=backend:* npm start
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var Lighttheme = FlexThemeData.light(
      scheme: FlexScheme.ebonyClay,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 20,
      appBarOpacity: 0.95,
      subThemesData: const FlexSubThemesData(
        interactionEffects: false,
        blendOnLevel: 20,
        blendOnColors: false,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );
    var darkTheme = FlexThemeData.dark(
      scheme: FlexScheme.ebonyClay,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 15,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.90,
      subThemesData: const FlexSubThemesData(
        interactionEffects: false,
        blendOnLevel: 30,
      ),
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: GoogleFonts.notoSans().fontFamily,
    );
    // return MaterialApp(
    //   theme: ThemeData.dark(),
    //   // themeMode: ThemeMode.dark,
    //   home: const Landing(),
    // );

    return MaterialApp.router(
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        routeInformationProvider: _router.routeInformationProvider,
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate);
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LaunchApp(),
      ),
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const ShowCreditCardForm(),
      // ),
      GoRoute(
        path: '/StoreForm',
        builder: (context, state) => EcommerceFormView(
          numberOfProducts: state.extra as int,
        ),
      ),
      GoRoute(
        path: '/Sports',
        builder: (context, state) => const SportsView(),
      ),
      GoRoute(
        path: '/qrcodepage',
        builder: (context, state) => const QrCodeView(),
      ),
      GoRoute(
        path: '/SignUp',
        builder: (context, state) => SignUpView(),
      ),
      GoRoute(
        path: '/walletTxns',
        builder: (context, state) => const WalletTxnsView(),
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
          path: '/resetCode', builder: (ctx, state) => const EnterCodeView()),
      GoRoute(path: '/GymDetails', builder: (ctx, state) => GymDetails()),
      GoRoute(
          path: '/GymPricing', builder: (ctx, state) => const GymPricingView()),
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
      GoRoute(path: '/Commerce', builder: (context, state) => CommerceView()),
      GoRoute(
          path: '/eventLocations', builder: (context, state) => CommerceView()),
      GoRoute(
          path: '/createSportsEvent',
          builder: (context, state) => CreateSportsEventView()),
      GoRoute(
          path: '/ECommerceView',
          builder: (context, state) => const EcommerceView()),
      GoRoute(
          path: '/amountpage',
          builder: (context, state) => TranferAmountView(
                contact: (state.extra) as ContactsModel,
              )),
    ],
  );
}

class LaunchApp extends ConsumerWidget {
  const LaunchApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var user = ref.watch(loginStreamProvider);
    return user.maybeWhen(
        data: (user) {
          // return user != null ? MainAppViewer() : const Landing();
          return user != null ? MainAppViewer() : const Landing();
        },
        orElse: () => Container());
  }
}

final loginStreamProvider = StreamProvider.autoDispose<User?>(
    (ref) => sl<FirebaseAuth>().authStateChanges());
