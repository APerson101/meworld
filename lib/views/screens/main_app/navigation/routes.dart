import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:routelift/src/features/navigation/bottom_nav_container.dart';
import 'package:routelift/src/features/splash/splash_screen.dart';

class AppRoutes {
  static AppRoute splash = AppRoute(
    name: 'splash',
    path: '/splash',
    builder: (_, __) => const SplashScreen(),
  );
  static AppRoute tab({BottomNav? bottomNavTab}) {
    return AppRoute(
        name: 'bottomNav',
        path: '/nav/${bottomNavTab?.name ?? ':name'}',
        builder: (context, state) {
          final tabName = state.params['name'];
          final bottomNav = BottomNav.values.byName(tabName!);

          final navItems = BottomNavItem.bottomNavItems;

          return IndexedStack(
            key: ValueKey(tabName),
            index: bottomNav.index,
            children: [
              ...navItems.map((navItem) => navItem.body),
            ],
          );
        });
  }
}

class AppRoute {
  const AppRoute({
    required this.name,
    required this.path,
    required this.builder,
  });

  final String name;
  final String path;
  final Widget Function(BuildContext, GoRouterState) builder;

  String get goRouterPath {
    if (path.split('/').length == 2) {
      return path;
    }
    return path.split('/').last;
  }
}

GoRoute toGoRoute(AppRoute appRoute) {
  return GoRoute(
    name: appRoute.name,
    path: appRoute.path,
    builder: (_, __) => appRoute.builder(_, __),
  );
}
