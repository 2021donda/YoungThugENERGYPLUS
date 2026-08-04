import 'package:flutter/material.dart';

import '../models/bill.dart';
import '../theme/app_colors.dart';
import '../widgets/bill_card.dart';
import '../widgets/brand_mark.dart';
import 'bill_detail_screen.dart';

/// Schermata 2: home con riepilogo e lista delle bollette.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: _HomeHeader(),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                children: [
                  const Text(
                    'Ciao! ⚡',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Gestisci le tue bollette in modo semplice.',
                    style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
                  ),
                  const SizedBox(height: 20),
                  _ActiveBillsCard(count: demoBills.length),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      _CategoryTile(
                        icon: Icons.home_rounded,
                        label: 'Energia\nElettrica',
                        color: AppColors.pink,
                      ),
                      SizedBox(width: 12),
                      _CategoryTile(
                        icon: Icons.local_fire_department,
                        label: 'Gas',
                        color: AppColors.gas,
                      ),
                      SizedBox(width: 12),
                      _CategoryTile(
                        icon: Icons.water_drop,
                        label: 'Acqua',
                        color: AppColors.water,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Le tue bollette',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...demoBills.map(
                    (bill) => BillCard(
                      bill: bill,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => BillDetailScreen(bill: bill),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _BottomNavBar(
              currentIndex: _navIndex,
              onTap: (i) => setState(() => _navIndex = i),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BrandMark(size: 44),
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'YOUNG THUG ENERGY',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 0.5,
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: AppColors.surface,
          child: const Icon(Icons.person_outline, color: Colors.white),
        ),
      ],
    );
  }
}

class _ActiveBillsCard extends StatelessWidget {
  final int count;

  const _ActiveBillsCard({required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.surfaceBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppColors.primaryGradient,
            ),
            child: const Icon(Icons.bolt, color: Colors.white),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Text(
              'BOLLETTE ATTIVE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Text(
            '$count',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.chevron_right, color: AppColors.textSecondary),
        ],
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _CategoryTile({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: AppColors.surfaceBorder),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;

  const _NavItem(this.icon, this.label);
}

class _BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNavBar({required this.currentIndex, required this.onTap});

  static const List<_NavItem> _items = [
    _NavItem(Icons.home_rounded, 'Home'),
    _NavItem(Icons.description_outlined, 'Bollette'),
    _NavItem(Icons.credit_card, 'Pagamenti'),
    _NavItem(Icons.person_outline, 'Profilo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.surfaceBorder)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(_items.length, (i) {
          final active = i == currentIndex;
          final color = active ? AppColors.pink : AppColors.textSecondary;
          return GestureDetector(
            onTap: () => onTap(i),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(_items[i].icon, color: color, size: 24),
                const SizedBox(height: 4),
                Text(_items[i].label, style: TextStyle(color: color, fontSize: 11)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
