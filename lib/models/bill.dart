import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum BillType { electricity, gas, water }

class Bill {
  final String title;
  final String category;
  final double amount;
  final String dueDate;
  final BillType type;
  final String provider;
  final String contractNumber;
  final String period;

  const Bill({
    required this.title,
    required this.category,
    required this.amount,
    required this.dueDate,
    required this.type,
    required this.provider,
    required this.contractNumber,
    required this.period,
  });

  /// Es. "89,40" a partire da 89.40
  String get formattedAmount => amount.toStringAsFixed(2).replaceAll('.', ',');
}

/// Dati statici di esempio: nessuna chiamata di rete, solo per demo/esposizione.
final List<Bill> demoBills = [
  const Bill(
    title: 'Luce – Casa',
    category: 'Energia Elettrica',
    amount: 89.40,
    dueDate: '12/05/2024',
    type: BillType.electricity,
    provider: 'Prime Energia',
    contractNumber: 'IT**7592',
    period: '01/03/2024 – 30/04/2024',
  ),
  const Bill(
    title: 'Gas – Casa',
    category: 'Gas',
    amount: 56.20,
    dueDate: '20/05/2024',
    type: BillType.gas,
    provider: 'Prime Energia',
    contractNumber: 'IT**4471',
    period: '01/03/2024 – 30/04/2024',
  ),
  const Bill(
    title: 'Acqua – Casa',
    category: 'Acqua',
    amount: 42.10,
    dueDate: '28/05/2024',
    type: BillType.water,
    provider: 'Acqua Comunale',
    contractNumber: 'IT**1183',
    period: '01/03/2024 – 30/04/2024',
  ),
];

extension BillTypeStyle on BillType {
  IconData get icon {
    switch (this) {
      case BillType.electricity:
        return Icons.bolt;
      case BillType.gas:
        return Icons.local_fire_department;
      case BillType.water:
        return Icons.water_drop;
    }
  }

  Color get color {
    switch (this) {
      case BillType.electricity:
        return AppColors.pink;
      case BillType.gas:
        return AppColors.gas;
      case BillType.water:
        return AppColors.water;
    }
  }
}
