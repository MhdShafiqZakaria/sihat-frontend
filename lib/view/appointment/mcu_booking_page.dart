// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class McuBookingpage extends StatefulWidget {
  const McuBookingpage({super.key});

  @override
  State<McuBookingpage> createState() => _McuBookingpageState();
}

class _McuBookingpageState extends State<McuBookingpage> {
  int? _selectedSlot;
  int? _selectedDateIndex;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final String monthAndYear = DateFormat('MMMM yyyy').format(now);
    List<DateTime> datesInAFortnight = [];
    for (int i = 0; i < 14; i++){
      datesInAFortnight.add(now.add(Duration(days: i)));
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 247, 239, 1),
      appBar: AppBar(
        title: const Text("BOOK APPOINTMENT", style: TextStyle(fontSize: 15)),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(244, 247, 239, 1),
        foregroundColor: const Color.fromRGBO(75, 85, 97, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Current service card
              Card(
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(235, 237, 235, 1),
                        child: Icon(Icons.medical_information),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("CURRENT SERVICE", style: TextStyle(fontSize: 12)),
                          SizedBox(height: 2),
                          Text(
                            "Medical Check Up",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(62, 74, 55, 1)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Select Date header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Select Date",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(62, 74, 55, 1)),
                  ),
                  Text(monthAndYear),
                ],
              ),

              const SizedBox(height: 20),

              // Date grid
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < datesInAFortnight.length; i++) ...[
                      if (i > 0) const SizedBox(width: 12),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(64, 90),
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          backgroundColor: i == _selectedDateIndex
                              ? const Color.fromRGBO(62, 74, 55, 1)
                              : Colors.white,
                          foregroundColor: i == _selectedDateIndex
                              ? Colors.white
                              : const Color.fromRGBO(75, 85, 97, 1),
                          side: BorderSide(
                            color: i == _selectedDateIndex
                                ? const Color.fromRGBO(62, 74, 55, 1)
                                : const Color.fromRGBO(235, 237, 235, 1),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => setState(() => _selectedDateIndex = i),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(DateFormat('EEEE').format(datesInAFortnight[i]), style: const TextStyle(fontSize: 10)),
                            Text(DateFormat('dd').format(datesInAFortnight[i]), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                            Text(DateFormat('MMM').format(datesInAFortnight[i])),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Select Time header
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Select Time",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(62, 74, 55, 1)),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Time grid - 30 min intervals from 8am to 5pm (19 slots in 3 columns)
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 2.5,
                ),
                itemCount: 19, // 8:00 AM to 5:00 PM in 30-min intervals = 19 slots
                itemBuilder: (context, index) {
                  final hour = 8 + (index ~/ 2);
                  final minute = (index % 2) * 30;
                  final period = hour >= 12 ? 'PM' : 'AM';
                  final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
                  final timeString = '${displayHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period';

                  final bool selected = _selectedSlot == index;
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: selected
                          ? const Color.fromRGBO(62, 74, 55, 1)
                          : Colors.white,
                      foregroundColor: selected
                          ? Colors.white
                          : const Color.fromRGBO(75, 85, 97, 1),
                      side: BorderSide(
                        color: selected
                            ? const Color.fromRGBO(62, 74, 55, 1)
                            : const Color.fromRGBO(235, 237, 235, 1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () => setState(() => _selectedSlot = index),
                    child: Text(
                      timeString,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}