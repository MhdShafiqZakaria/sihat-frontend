// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/view/appointment/choose_appointment_type_page.dart';
import '../shared/app_bar.dart';
import '../shared/filter_button.dart';
class AppointmentPageEmptyState extends StatefulWidget {
  const AppointmentPageEmptyState({super.key});

  @override
  State<AppointmentPageEmptyState> createState() => _AppointmentPageEmptyStateState();
}

class _AppointmentPageEmptyStateState extends State<AppointmentPageEmptyState> {
  String selectedFilter = 'All';
  final List<String> filters = [
    'All',
    'Pending',
    'Approved',
    'Declined',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: 
      Column(
        // color: Color.fromRGBO(255, 255, 255, 1),
        children: [
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
          Expanded(
            child: Center(
              child: Card(
                color: Colors.white,
                child: Container(
                  width: 280,  
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,   // card hugs content vertically too
                    children: [
                      const Icon(Icons.calendar_month, size: 40),
                      const SizedBox(height: 20),
                      Text(
                        'No appointments yet.',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Your schedule is clear. When you book a session with a specialist, it will appear here.",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ChooseAppointmentTypePage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 62, 74, 55)),
                        child: const Text("Book Appointment", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),
            )
          )
        ]
      ),


    );
  }
}