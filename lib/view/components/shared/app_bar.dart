import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/utils/constant.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  const MyAppbar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constant.backgroundPrimaryColour,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/images/UNIMAS-logo.png',
              fit: BoxFit.fitHeight,
              height: 45,
            ),
          ),
          Expanded(
            child: Text(
              "UNIMAS Sihat",
              style: TextStyle(
                color: Constant.textGreen,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
