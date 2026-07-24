// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BookingtransportBookingPage extends StatefulWidget {
  const BookingtransportBookingPage({super.key});

  @override
  State<BookingtransportBookingPage> createState() =>
      _BookingtransportBookingPageState();
}

class _BookingtransportBookingPageState
    extends State<BookingtransportBookingPage> {
  DateTime? _selectedDate;
  int? _selectedSlot;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("TRANSPORT BOOKING", style: TextStyle(fontSize: 15)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Card(
                elevation: 0,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color.fromRGBO(235, 237, 235, 1),
                        child: Icon(Icons.directions_car),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("CURRENT SERVICE", style: TextStyle(fontSize: 12)),
                          SizedBox(height: 2),
                          Text(
                            "Transport Booking",
                            style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(62, 74, 55, 1)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Select Date",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(62, 74, 55, 1)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color.fromRGBO(235, 237, 235, 1)),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: Theme.of(context).colorScheme.copyWith(
                      primary: const Color.fromRGBO(62, 74, 55, 1),
                      onPrimary: Colors.white,
                      surface: Colors.white,
                      onSurface: const Color.fromRGBO(62, 74, 55, 1),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromRGBO(62, 74, 55, 1),
                      ),
                    ),
                  ),
                  child: CalendarDatePicker(
                    initialDate: _selectedDate ?? DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    onDateChanged: (DateTime date) {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Select Pickup Time",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(62, 74, 55, 1)),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _timeSlotButton('8:00 AM', 0),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _timeSlotButton('2:00 PM', 1),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (_selectedDate != null && _selectedSlot != null)
                      ? () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Booking confirmed!')),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(62, 74, 55, 1),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        Color.fromRGBO(62, 74, 55, 1).withValues(alpha: 0.4),
                    disabledForegroundColor: Colors.white70,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Confirm Booking',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _timeSlotButton(String label, int slot) {
    final bool selected = _selectedSlot == slot;
    return ElevatedButton(
      onPressed: () => setState(() => _selectedSlot = slot),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
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
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}