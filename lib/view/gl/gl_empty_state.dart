import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/view/shared/app_bar.dart';
import 'package:flutter_test_sihat/view/shared/filter_button.dart';

import '../../utils/constant.dart';
import '../shared/icon_btn_appbar.dart';

class GlEmptyState extends StatefulWidget {
  const GlEmptyState({super.key});

  @override
  State<GlEmptyState> createState() => _GlEmptyStateState();
}

class _GlEmptyStateState extends State<GlEmptyState> {
  String selectedFilter = 'All';
  final List<String> filters = [
    'All',
    'Pending',
    'Approved',
    'Rejected',
    'Ready to Collect',
  ];
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: MyAppbar(
        actions: [
          IconBtnAppbar(
            color: colors.secondary,
            iconButton: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: 400,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Request New GL Letter',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          spacing: 5,
                          children: [
                            Text('Submit a guarantee letter to your hospital'),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.add_outlined),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),

          Constant.sizedBoxHeight20,

          //Filter Button
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: filters.map((label) {
                return FilterButton(
                  label: label,
                  isSelected: selectedFilter == label,
                  onPressed: () => setState(() => selectedFilter = label),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
