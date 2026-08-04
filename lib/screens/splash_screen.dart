import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/gradient_button.dart';
import '../widgets/hero_banner.dart';
import 'home_screen.dart';

/// Schermata 1: apertura app con hero image, titolo brand e accesso.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      HeroBanner(
                        height: 360,
                        borderRadius: BorderRadius.circular(28),
                        // imagePath: 'assets/images/hero.png', // <- tua immagine
                      ),
                      const SizedBox(height: 28),
                      const _BrandTitle(),
                      const SizedBox(height: 20),
                      const _Tagline(),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
              GradientButton(
                label: 'Accedi',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const HomeScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),
              OutlinedPillButton(label: 'Crea account', onPressed: () {}),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _BrandTitle extends StatelessWidget {
  const _BrandTitle();

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900, height: 1.05),
        children: [
          TextSpan(text: 'YOUNG THUG\n', style: TextStyle(color: Colors.white)),
          TextSpan(text: 'ENERGY', style: TextStyle(color: AppColors.cyan)),
        ],
      ),
    );
  }
}

class _Tagline extends StatelessWidget {
  const _Tagline();

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: const TextSpan(
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 1.3,
        ),
        children: [
          TextSpan(text: 'LE TUE BOLLETTE,\nLA TUA '),
          TextSpan(text: 'ENERGIA.', style: TextStyle(color: AppColors.pink)),
        ],
      ),
    );
  }
}
