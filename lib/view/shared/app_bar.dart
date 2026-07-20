import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  const MyAppbar({super.key, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'assets/images/UNIMAS-logo.png',
            height: 30,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "UNIMAS Sihat",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
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
