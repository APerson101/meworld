import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meworld/core/models/settings.dart';

final settingsProvider = FutureProvider((ref) async {
  return Hive.box('Settings') as Settings;
});

final changeThemeProvider =
    FutureProvider.family<bool, Settings>((ref, settings) async {
  return await settings.changeTheme(
      settings.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
});
