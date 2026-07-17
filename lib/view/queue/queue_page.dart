import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/view/shared/app_bar.dart';

import '../../utils/constant.dart';

class QueuePage extends StatelessWidget {
  const QueuePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: MyAppbar(),

      //Queue Details Card
      body: Column(
        children: [
          SizedBox(
            width: 400,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            color: colors.primaryContainer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Open Until 5:00 PM',
                              style: textTheme.bodySmall,
                            ),
                          ),
                          Card(
                            color: colors.primaryContainer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'SERVING NOW',
                              style: textTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('Friday,17 July'),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'PATIENTS WAITING',
                            style: textTheme.titleMedium,
                          ),
                          Text('EST WAIT TIME', style: textTheme.titleMedium),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '4',
                            style: textTheme.displayLarge?.copyWith(
                              color: colors.primary,
                            ),
                          ),
                          Text(
                            '~12m',
                            style: textTheme.displayLarge?.copyWith(
                              color: colors.primary,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Estimated wait time is for guidance only and may vary based on clinical priorities.',
                        style: textTheme.bodySmall?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: colors.inverseSurface,
                        ),
                      ),
                      Divider(color: colors.outline),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('At:'),
                          Card(
                            color: colors.primaryContainer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Registration Counter',
                              style: textTheme.bodySmall,
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            'Press the button below',
                            style: textTheme.bodySmall?.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Constant.sizedBoxHeight20,

          // Upcoming Column
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Join Queue",
                  style: textTheme.labelLarge?.copyWith(
                    color: colors.inverseSurface,
                  ),
                ),

                Constant.sizedBoxHeight20,

                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    fixedSize: Size(400, 50),
                  ),
                  child: Text("Confirm & Join Queue"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
