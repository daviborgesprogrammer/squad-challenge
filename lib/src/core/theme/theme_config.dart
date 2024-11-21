import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: Colors.transparent),
  );

  static final theme = ThemeData(
    scaffoldBackgroundColor: AppColor.i.primary,
    appBarTheme: AppBarTheme(backgroundColor: AppColor.i.primary),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.i.primary,
      primary: AppColor.i.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white.withOpacity(0.1),
      filled: true,
      isDense: true,
      contentPadding: const EdgeInsets.all(14),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle:
          TextStyles.i.textRegular.copyWith(color: Colors.white, fontSize: 14),
      errorStyle: TextStyles.i.textRegular.copyWith(color: Colors.redAccent),
    ),
    useMaterial3: false,
  );
}
