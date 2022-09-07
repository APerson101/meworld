import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/views/screens/main_app/navigation/bottom_nav_container.dart';
import 'package:meworld/views/screens/main_app/navigation/routes.dart';

final appBaseRouter = AppBaseRouter(
  appRouters: [],
).router;

///arg regitry
final _savedArgs = {};
T argsRegistry<T>(String key, Object? args) {
  if (args is T) {
    _savedArgs[key] = args;
  }
  return _savedArgs[key] as T;
}

class AppBaseRouter {
  AppBaseRouter({
    required this.appRouters,
  });

  final List<AppRouter> appRouters;

  GoRouter get router {
    return GoRouter(
      initialLocation: AppRoutes.splash.path,
      urlPathStrategy: UrlPathStrategy.path,
      routes: getRoutes,
      redirect: (state) {
        if (state.location.startsWith('/nav')) {
          return AuthRoutes.login.path;
        }
        return AppRoutes.tab(bottomNavTab: BottomNav.home).path;
      },
      navigatorBuilder: (context, state, child) {
        if (RegExp(r'^/nav/[a-zA-Z0-9]+$').hasMatch(state.location)) {
          final navName = state.location.split('/')[2];
          final currentNav = BottomNav.values.byName(navName);

          return Scaffold(
            backgroundColor: Colors.white,
            body: child,
            bottomNavigationBar: BottomNavigationContainer(
              currentNav: currentNav,
            ),
          );
        }

        return child;
      },
    );
  }

  List<GoRoute> get getRoutes {
    final appRoutes = appRouters
        .expand(
          (appRouter) => appRouter.routes,
        )
        .toList()
      ..add(toGoRoute(AppRoutes.splash));

    final appTabbedRoutes = <GoRoute>[];
    final toRemove = <GoRoute>[];

    for (final appRoute in appRoutes) {
      if (appRoute.path.startsWith('/') == false) {
        appTabbedRoutes.add(appRoute);
        toRemove.add(appRoute);
      }
    }

    appRoutes.removeWhere(toRemove.contains);

    return [
      ...appRoutes,
      GoRoute(
        path: AppRoutes.tab().path,
        builder: AppRoutes.tab().builder,
        routes: appTabbedRoutes,
      ),
    ];
  }
}

abstract class AppRouter {
  List<GoRoute> get routes;
}
