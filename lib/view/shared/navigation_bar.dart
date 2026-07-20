import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/view/appointment/appointment_page_empty_state.dart';
import 'package:flutter_test_sihat/view/dashboard/home_dashboard.dart';
import 'package:flutter_test_sihat/view/queue/queue_page.dart';
import 'package:flutter_test_sihat/viewmodel/navigation/navigation_vm.dart';
import 'package:provider/provider.dart';
import '../emr/emr_profile.dart';
import '../gl/gl_empty_state.dart';

class MyNavigationBar extends StatelessWidget {
   const MyNavigationBar({super.key});

  static const _tabs = [HomeDashboard(), AppointmentPageEmptyState(),QueuePage(),GlEmptyState(),EmrProfile()];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final selectedIndex = context.watch<NavigationVm>().selectedIndex;
    return Scaffold(
      body: IndexedStack(index: selectedIndex, children: _tabs),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        labelBehavior: .onlyShowSelected,

        indicatorColor: colors.onPrimaryContainer,
        indicatorShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        onDestinationSelected: (index) =>
            context.read<NavigationVm>().setIndex(index),
        destinations: <Widget>[
          NavigationDestination(selectedIcon: Icon(Icons.home,color: Colors.white),
            icon: Icon(Icons.home_outlined, color: Colors.black),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_today,color: Colors.white),
            icon: Icon(Icons.calendar_today_outlined,color: Colors.black),
            label: 'Appnt',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.hourglass_full_outlined,color: Colors.white,),
            icon: Icon(Icons.hourglass_empty_outlined,color: Colors.black),
            label: 'Queue',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.insert_drive_file,color: Colors.white),
            icon: Icon(Icons.insert_drive_file_outlined,color: Colors.black),
            label: 'Requests',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2,color: Colors.white),
            icon: Icon(Icons.person_2_outlined,color: Colors.black),
            label: 'EMR',
          ),
        ],
      ),
    );
  }
}
