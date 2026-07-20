import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/view/shared/app_bar.dart';

class EmrProfile extends StatelessWidget {
  const EmrProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: Center(child: Text('Emr Profile')),
    );
  }
}
