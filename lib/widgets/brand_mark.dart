import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Piccolo logo/badge del brand (fulmine su sfondo a gradiente),
/// usato nell'header di Home e nel dettaglio bolletta.
class BrandMark extends StatelessWidget {
  final double size;

  const BrandMark({super.key, this.size = 44});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.primaryGradient,
      ),
      child: Icon(Icons.bolt, color: Colors.white, size: size * 0.55),
    );
  }
}
