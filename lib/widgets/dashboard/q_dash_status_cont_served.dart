import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/utils/constant.dart';

class QDashStatusContServed extends StatelessWidget {
  final String label;
  const QDashStatusContServed({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
          color: Constant.textGreen,
        ),
      ),
    );
  }
}
