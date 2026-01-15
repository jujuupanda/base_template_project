import 'package:flutter/material.dart';

import 'app_dark_theme.dart';
import 'app_light_theme.dart';

sealed class AppThemes {
  static ThemeData dark() {
    return AppDarkThemes.call();
  }

  static ThemeData light() {
    return AppLightThemes.call();
  }
}
