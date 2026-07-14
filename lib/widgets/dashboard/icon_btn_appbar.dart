import 'package:flutter/material.dart';

class IconBtnAppbar extends StatelessWidget {
  final Color color;
  final Widget iconButton;
  const IconBtnAppbar({super.key,required this.color,required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: iconButton,
    );
  }
}
