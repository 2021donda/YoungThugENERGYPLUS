import 'package:flutter/material.dart';

/// Palette e stili condivisi dell'app (sfondo scuro, accenti neon
/// magenta -> ciano, come nel mockup di riferimento).
class AppColors {
  AppColors._();

  static const Color background = Color(0xFF0A0A1A);
  static const Color surface = Color(0xFF15172E);
  static const Color surfaceBorder = Color(0xFF2A2C4E);

  static const Color pink = Color(0xFFFF2FD6);
  static const Color cyan = Color(0xFF33E4FF);

  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFA6A8C6);

  static const Color gas = Color(0xFFFF8A3D);
  static const Color water = Color(0xFF3DA9FF);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [pink, cyan],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient heroGlow = LinearGradient(
    colors: [Color(0xFF2E0B3D), Color(0xFF0A0A1A), Color(0xFF06222E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
