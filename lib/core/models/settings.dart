import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Settings extends HiveObject {
  @HiveField(0)
  ThemeMode themeMode;
  @HiveField(1)
  AvailableLanguages language;
  Settings({required this.language, required this.themeMode});

  changeTheme(ThemeMode newTheme) {
    themeMode = newTheme;
  }

  changeLanguage(AvailableLanguages newLanguage) {
    language = newLanguage;
  }
}

enum AvailableLanguages { english, french, arabic, spanish }
