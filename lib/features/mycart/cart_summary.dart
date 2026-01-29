import 'package:ecommerce_app/core/style/app_colors.dart';
import 'package:ecommerce_app/core/widgets/summary_row.dart';
import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  final int subTotal;
  final int shipping;
  final int total;
  const CartSummary({
    super.key,
    required this.subTotal,
    required this.shipping,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SummaryRow(label: 'Sub-total', value: '\$ $subTotal'),
        const SummaryRow(label: 'VAT (%)', value: '\$ 0.00'),
        SummaryRow(label: 'Shipping fee', value: '\$ $shipping'),
        const Divider(height: 24),
        SummaryRow(
          label: 'Total',
          value: '\$ $total',
          color: AppColors.primary900Color,
          isBold: true,
        ),
      ],
    );
  }
}
