import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsView extends ConsumerWidget {
  SettingsView({Key? key}) : super(key: key);
  final themeState = StateProvider((ref) => ThemeMode.dark);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      SwitchListTile.adaptive(
          value: ref.watch(themeState) == ThemeMode.dark ? true : false,
          onChanged: (newState) {
            ref.watch(themeState.notifier).state =
                ref.watch(themeState) == ThemeMode.dark
                    ? ThemeMode.light
                    : ThemeMode.dark;
          }),
    ]);
  }
}
