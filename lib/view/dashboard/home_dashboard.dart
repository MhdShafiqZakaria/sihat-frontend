import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/utils/constant.dart';

import 'package:provider/provider.dart';

import '../../viewmodel/dashboard/dashboard_vm.dart';
import '../components/shared/app_bar.dart';
import 'icon_btn_appbar.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardVm dashboardVm = Provider.of<DashboardVm>(
      context,
      listen: true,
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constant.backgroundPrimaryColour,
        //AppBar : LOGO -> CAMERA -> PROFILE
        appBar: MyAppbar(
          actions: [
            IconBtnAppbar(
              color: Color(0xFFAAD1A0),
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.qr_code_scanner_sharp,
                  color: Color(0xFF42643D),
                ),
              ),
            ),
            SizedBox(width: 30),
            IconBtnAppbar(
              color: Color(0xFF595E69),
              iconButton: IconButton(
                onPressed: () {},
                icon: Icon(Icons.person, color: Colors.white),
              ),
            ),
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
                      style: TextStyle(
                        color: Constant.textGreen,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
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
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),

                              decoration: BoxDecoration(
                                color: Colors.grey.withValues(alpha: 0.06),
                                border: Border.all(width: 2, color: Colors.grey.withValues(alpha: 0.2)),
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
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),

                              decoration: BoxDecoration(
                                color: Colors.grey.withValues(alpha: 0.06),
                                border: Border.all(width: 2, color: Colors.grey.withValues(alpha: 0.2)),
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

                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: [BoxShadow(blurRadius: 1.0)],
                                  color: Constant.textGreen,
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: Text(
                                  "Join Queue",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
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
                                color: Constant.textGreen,
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

                        Container(
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
                            'Medical Check Up',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Constant.sizedBoxHeight10,

                        Container(
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
                            "Internal Follow Up",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}

//Helper Functions
Widget _buildStatusWidget(DashboardVm dashboardVm, String currentNumber) {
  // If this is the user's queue number
  if (currentNumber == dashboardVm.queueNumberDto?.userQueueNumber) {
    return  Container(
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
          color: Constant.textGreen,
        ),
      ),
    );
  }

  // If this is currently being served
  if (currentNumber == dashboardVm.queueNumberDto?.currentlyAttendingNumber) {
    return  Container(
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
          color: Constant.textGreen,
        ),
      ),
    );
  }

  // Default status
  return  Container(
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
        color: Constant.textGreen,
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
