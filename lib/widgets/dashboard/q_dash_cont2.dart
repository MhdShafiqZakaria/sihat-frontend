import 'package:flutter/material.dart';

class QueueDashboardCont2 extends StatelessWidget {

  final String label;
  
  const QueueDashboardCont2({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,

      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 10,
          color: Colors.white.withValues(alpha: 0.2),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
