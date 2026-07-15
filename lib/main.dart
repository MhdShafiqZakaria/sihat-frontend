import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/networking/queue/get_queue_number_service.dart';
import 'package:flutter_test_sihat/networking/queue/queue_feeder.dart';
import 'package:flutter_test_sihat/utils/constant.dart';
import 'package:flutter_test_sihat/viewmodels/dashboard/dashboard_vm.dart';
import 'package:flutter_test_sihat/widgets/home_dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => DashboardVm(
        queueFeeder: QueueFeeder(
          getQueueNumberService: GetQueueNumberService(
            baseUrl: Constant.baseUrlEmu,
          ),
        ),
      ),child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      home: HomeDashboard(),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    final baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.manropeTextTheme(baseTheme.textTheme),
    );
  }
}
