// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/view/appointment/choose_appointment_type_page.dart';
class AppointmentpageEmptystate extends StatefulWidget {
  const AppointmentpageEmptystate({super.key});

  @override
  State<AppointmentpageEmptystate> createState() => _AppointmentpageEmptystateState();
}

class _AppointmentpageEmptystateState extends State<AppointmentpageEmptystate> {
  String selectedFilter = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/images/unimas_logo.png', height: 30),
            const SizedBox(width: 10),
            const Text("UNIMAS Sihat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          ],
        ),
        backgroundColor: const Color.fromRGBO(244, 245, 240, 1),
      ),
      body: 
      Column(
        // color: Color.fromRGBO(255, 255, 255, 1),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildFilterButton('All'),
              _buildFilterButton('Approved'),
              _buildFilterButton('Pending'),
              _buildFilterButton('Declined')
            ],
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

  Widget _buildFilterButton(String label) {
    final isSelected = selectedFilter == label;
    final baseColor = const Color.fromRGBO(223, 229, 214, 1);

    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedFilter = label;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? Color.lerp(baseColor, Color.fromRGBO(62, 74, 55, 1), 0.75)
            : baseColor,
        
      ),
      child: Text(label, style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: isSelected ? FontWeight.bold: FontWeight.normal)),
    );
  }
}