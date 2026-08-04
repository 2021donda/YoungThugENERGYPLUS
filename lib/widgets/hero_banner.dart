import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Riquadro "hero" con sfondo neon e fulmini decorativi, come nella
/// schermata di apertura del mockup di riferimento.
///
/// Di default mostra un placeholder generico (nessuna foto). Se vuoi
/// mostrare una tua immagine al posto del placeholder, passa
/// [imagePath] (es. 'assets/images/hero.png') dopo averla dichiarata
/// negli assets del pubspec.yaml.
class HeroBanner extends StatelessWidget {
  final double height;
  final String? imagePath;
  final BorderRadius borderRadius;

  const HeroBanner({
    super.key,
    required this.height,
    this.imagePath,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(decoration: const BoxDecoration(gradient: AppColors.heroGlow)),
            Positioned(
              left: height * 0.02,
              top: height * 0.18,
              child: Icon(
                Icons.bolt,
                color: AppColors.pink.withOpacity(0.85),
                size: height * 0.30,
              ),
            ),
            Positioned(
              right: height * 0.02,
              top: height * 0.36,
              child: Icon(
                Icons.bolt,
                color: AppColors.cyan.withOpacity(0.85),
                size: height * 0.24,
              ),
            ),
            Center(
              child: imagePath != null
                  ? Image.asset(imagePath!, fit: BoxFit.cover)
                  : Icon(
                      Icons.person_rounded,
                      color: Colors.white.withOpacity(0.9),
                      size: height * 0.45,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
