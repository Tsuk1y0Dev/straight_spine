import 'package:flutter/material.dart';
import 'package:straight_spine/theme/app_palettes.dart';

class ThemeController extends ChangeNotifier {
  AppPalette _currentPalette = AppPalettes.normal;
  AppPalette get currentPalette => _currentPalette;

  ThemeData get currentTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: _currentPalette.seedColor)
          .copyWith(
            primary: _currentPalette.primary,
            surface: _currentPalette.surface,
            surfaceContainer: _currentPalette.surfaceContainer,
            onSurface: _currentPalette.onSurface,
            onInverseSurface: _currentPalette.onInverseSurface,
            onSurfaceVariant: _currentPalette.onSurfaceVariant,
            brightness: _currentPalette.brightness,
          ),
    );
  }

  void setPalette(AppPalette newPalette) {
    if (_currentPalette == newPalette) return;
    _currentPalette = newPalette;
    notifyListeners();
  }
}
