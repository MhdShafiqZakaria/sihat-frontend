import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/utils/constant.dart';

class GreenBtn extends StatelessWidget {
  final String label;

  const GreenBtn({super.key,required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 1.0)],
          color: Constant.textGreen,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }
}
