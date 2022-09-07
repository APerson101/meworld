import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppNavigator {
  ///use to push to a new route
  static void pushToRoute(BuildContext context, String path, {Object? args}) {
    context.go(
      path,
      extra: args,
    );
  }

  ///use to check if route can be popped
  static bool canPopRoute(BuildContext context) =>
      GoRouter.of(context).location.split('/').length != 2;

  ///use to go back to a previous route
  static void popRoute(BuildContext context) {
    if (GoRouter.of(context).location.split('/').length == 2) {
      throw "Can't pop route";
    }
    GoRouter.of(context).pop();
  }

  /// use to pop an open dialog modal
  static void popDialog(BuildContext context) {
    GoRouter.of(context).navigator?.pop();
  }

  ///use to show a dialog modal
  static void showAlertDialog(
    BuildContext context,
    Widget child, {
    bool barrierDismissible = true,
  }) {
    GoRouter.of(context).navigator?.push(
          DialogRoute(
            context: context,
            builder: (_) => Center(
              child: Material(child: child),
            ),
            barrierDismissible: barrierDismissible,
            barrierColor: Colors.black.withOpacity(0.2),
          ),
        );
  }
}
