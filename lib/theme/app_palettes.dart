import 'package:flutter/material.dart';

class AppPalette {
  final String name;
  final Color primary;
  final Color surface;
  final Color surfaceContainer;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color onInverseSurface;
  final Brightness brightness;
  final Color seedColor;

  const AppPalette({
    required this.seedColor,
    required this.name,
    required this.primary,
    required this.surface,
    required this.surfaceContainer,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.onInverseSurface,
    required this.brightness,
  });
}

class AppPalettes {
  static const normal = AppPalette(
    name: "Normal",
    seedColor: Color(0xFF49D9A1),
    primary: Color(0xFF49D9A1),
    surface: Color(0xFF101C23),
    surfaceContainer: Color(0xFF1A2A32),
    onSurface: Colors.white,
    onInverseSurface: Color(0xFF173D34),
    onSurfaceVariant: Color(0xFF9BAFB8),
    brightness: Brightness.dark,
  );

  static const warning = AppPalette(
    name: "Warning",
    seedColor: Color(0xFF49D9A1),
    primary: Color(0xFF49D9A1),
    surface: Color(0xFF101C23),
    surfaceContainer: Color(0xFF1A2A32),
    onSurface: Colors.white,
    onInverseSurface: Color(0xFF173D34),
    onSurfaceVariant: Color(0xFF9BAFB8),
    brightness: Brightness.dark,
  );
  static const critic = AppPalette(
    name: "critic",
    seedColor: Color(0xFF49D9A1),
    primary: Color(0xFF49D9A1),
    surface: Color(0xFF101C23),
    surfaceContainer: Color(0xFF1A2A32),
    onSurface: Colors.white,
    onInverseSurface: Color(0xFF173D34),
    onSurfaceVariant: Color(0xFF9BAFB8),
    brightness: Brightness.dark,
  );
}

