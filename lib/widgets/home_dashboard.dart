import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/utils/constant.dart';
import 'package:flutter_test_sihat/viewmodels/dashboard/dashboard_vm.dart';
import 'package:flutter_test_sihat/widgets/dashboard/green_btn.dart';
import 'package:flutter_test_sihat/widgets/dashboard/icon_btn_appbar.dart';
import 'package:flutter_test_sihat/widgets/dashboard/q_dash_cont1.dart';
import 'package:flutter_test_sihat/widgets/dashboard/q_dash_cont2.dart';
import 'package:flutter_test_sihat/widgets/dashboard/q_dash_status_cont.dart';
import 'package:flutter_test_sihat/widgets/dashboard/q_dash_status_cont_served.dart';
import 'package:flutter_test_sihat/widgets/components/app_bar.dart';
import 'package:provider/provider.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardVm>(
      builder: (context, dashboardVm, child) {
        if (dashboardVm.queueNumberDto == null && !dashboardVm.isloading) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            print('Initializing data load...');
            dashboardVm.loadQueueData();
          });
        }

        if (dashboardVm.isloading) {
          return Center(child: CircularProgressIndicator());
        }

        if (dashboardVm.errorMessage != null) {
          print('Error occurred: ${dashboardVm.errorMessage}');

          return Center(child: Text('Error: ${dashboardVm.errorMessage}'));
        }
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
                Column(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    dashboardVm
                                            .queueNumberDto
                                            ?.currentlyAttendingNumber ??
                                        "1001",
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
                                        "1005",
                                  ),
                                ],
                              ),
                              Divider(color: Colors.grey[300], thickness: 1, height: 30),
                              QueueDashboardCont1(label: "EST. WAIT TIME"),

                              Constant.sizedBoxHeight10,

                              QueueDashboardCont1(label: "REPORT TO"),

                              Constant.sizedBoxHeight10,

                              GreenBtn(label: "JOIN QUEUE"),
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

                          QueueDashboardCont2(label: "Medical Check Up"),

                          Constant.sizedBoxHeight10,

                          QueueDashboardCont2(label: "Internal Follow Up"),
                        ],
                      ),
                    ),
                  ],
                ),
          ),
        );
      },
    );
  }
}
//Helper Functions
Widget _buildStatusWidget(DashboardVm dashboardVm, String currentNumber) {
  // If this is the user's queue number
  if (currentNumber == dashboardVm.queueNumberDto?.userQueueNumber) {
    return QDashStatusCont(label: "YOUR TURN");
  }

  // If this is currently being served
  if (currentNumber == dashboardVm.queueNumberDto?.currentlyAttendingNumber) {
    return QDashStatusContServed(label: "BEING SERVED");
  }

  // Default status
  return QDashStatusCont(label: "WAITING");
}

String _buildSectionText(DashboardVm dashboardVm) {
  if (dashboardVm.queueNumberDto?.currentlyAttendingNumber == 
      dashboardVm.queueNumberDto?.userQueueNumber) {
    return "YOUR TURN";
  }
  return "SERVING NOW";
}