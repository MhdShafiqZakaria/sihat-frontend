import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/view/shared/app_bar.dart';
import 'package:flutter_test_sihat/view/shared/detail_card.dart';

class EmrProfile extends StatelessWidget {
  const EmrProfile({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MyAppbar(),
      body: Column(
        children: [
          Text('Emr Profile'),
        ],
      ),
    );
  }
}
