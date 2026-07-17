import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/utils/constant.dart';

import 'package:provider/provider.dart';

import '../../viewmodel/dashboard/dashboard_vm.dart';
import '../shared/app_bar.dart';
import '../shared/icon_btn_appbar.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardVm dashboardVm = Provider.of<DashboardVm>(
      context,
      listen: true,
    );
    return Scaffold(
      //AppBar : LOGO -> CAMERA -> PROFILE
      appBar: MyAppbar(
        actions: [
          IconBtnAppbar(
            color: Color(0xFFAAD1A0),
            iconButton: IconButton(
              onPressed: () {},
              icon: Icon(Icons.qr_code_scanner_sharp, color: Color(0xFF42643D)),
            ),
          ),
          SizedBox(width: 20),
          IconBtnAppbar(
            color: Color(0xFF595E69),
            iconButton: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body:
          //Queue Details Column
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Today's Queue",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 4, color: Colors.white),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _buildSectionText(dashboardVm),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                              color: Colors.grey[700],
                            ),
                          ),
                          Text(
                            "REGISTRATION COUNTER",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.0,
                              color: Colors.grey[500],
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                dashboardVm
                                        .queueNumberDto
                                        ?.currentlyAttendingNumber ??
                                    "----",
                                style: const TextStyle(
                                  fontSize: 48,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -1.5,
                                  color: Color(
                                    0xB342643D,
                                  ), // primary @ 70% opacity
                                ),
                              ),
                              _buildStatusWidget(
                                dashboardVm,
                                dashboardVm
                                        .queueNumberDto
                                        ?.currentlyAttendingNumber ??
                                    "--",
                              ),
                            ],
                          ),
                          Divider(
                            color: Colors.grey[300],
                            thickness: 1,
                            height: 30,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.06),
                              border: Border.all(
                                width: 2,
                                color: Colors.grey.withValues(alpha: 0.2),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "EST. WAIT TIME",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '--',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Constant.sizedBoxHeight10,

                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 12,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.06),
                              border: Border.all(
                                width: 2,
                                color: Colors.grey.withValues(alpha: 0.2),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "REPORT TO",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  '--',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[400],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Constant.sizedBoxHeight10,

                          FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                              fixedSize: Size(400, 50),
                            ),
                            child: Text("Join Queue"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Upcoming Column
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Upcoming",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "VIEW ALL",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Constant.sizedBoxHeight20,

                      SizedBox(
                        width: 400,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
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
                                      'Medical Check Up',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.calendar_today, size: 18),
                                        Text(
                                          'SEP 25',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(Icons.access_time, size: 18),
                                        Text(
                                          '08:30 AM',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                TextButton(
                                  child: Text(
                                    '>',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      Constant.sizedBoxHeight10,

                      SizedBox(
                        width: 400,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
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
                                      'Internal Follow Up',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      spacing: 5,
                                      children: [
                                        Icon(Icons.calendar_today, size: 18),
                                        Text(
                                          'OCT 25',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Icon(Icons.access_time, size: 18),
                                        Text(
                                          '09:30 AM',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                TextButton(
                                  child: Text(
                                    '>',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

//Helper Functions
Widget _buildStatusWidget(DashboardVm dashboardVm, String currentNumber) {
  // If this is the user's queue number
  if (currentNumber == dashboardVm.queueNumberDto?.userQueueNumber) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "Your Turn",
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  // If this is currently being served
  if (currentNumber == dashboardVm.queueNumberDto?.currentlyAttendingNumber) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Being Served',
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  // Default status
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: Colors.green.withValues(alpha: 0.15),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Text(
      "NO ACTIVE TICKET",
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.8,
      ),
    ),
  );
}

String _buildSectionText(DashboardVm dashboardVm) {
  if (dashboardVm.queueNumberDto?.currentlyAttendingNumber ==
      dashboardVm.queueNumberDto?.userQueueNumber) {
    return "YOUR TURN";
  }
  return "SERVING NOW";
}
