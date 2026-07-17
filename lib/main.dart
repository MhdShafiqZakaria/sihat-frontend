import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/networking/queue/get_queue_number_service.dart';
import 'package:flutter_test_sihat/networking/queue/queue_feeder.dart';
import 'package:flutter_test_sihat/utils/theme_constant.dart';
import 'package:flutter_test_sihat/utils/url_constant.dart';
import 'package:flutter_test_sihat/view/shared/navigation_bar.dart';
import 'package:flutter_test_sihat/viewmodel/dashboard/dashboard_vm.dart';
import 'package:flutter_test_sihat/viewmodel/navigation/navigation_vm.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardVm(
            queueFeeder: QueueFeeder(
              getQueueNumberService: GetQueueNumberService(
                baseUrl: UrlConstant.baseUrlEmu,
              ),
            ),
          ),
        ),
        ChangeNotifierProvider(create: (_) => NavigationVm()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final materialTheme = MaterialTheme(Theme.of(context).textTheme);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,

      theme: materialTheme.light(),

      darkTheme: materialTheme.dark(),

      home: MyNavigationBar(),
    );
  }
}
