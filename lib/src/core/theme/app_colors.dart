import 'package:flutter/material.dart';

class AppColor {
  static AppColor? _instance;
  // Avoid self isntance
  AppColor._();
  static AppColor get i {
    _instance ??= AppColor._();
    return _instance!;
  }

  Color get primary => const Color(0XFF282735);

  Color get star => Colors.yellowAccent;
  Color get text => Colors.white;
}

extension AppColorExtensions on BuildContext {
  AppColor get colors => AppColor.i;
}
