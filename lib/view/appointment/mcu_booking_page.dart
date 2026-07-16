// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';




class McuBookingPage extends StatelessWidget{
  const McuBookingPage ({super.key});

 

  @override
  Widget build(BuildContext context){
    DateTime now = DateTime.now();
    String monthAndYear = DateFormat('MMMM yyyy').format(now);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 247, 239, 1),
      appBar: AppBar(title: Text("BOOK APPOINTMENT", style: TextStyle(fontSize: 15)), centerTitle: true, backgroundColor: Color.fromRGBO(244, 247, 239, 1), foregroundColor: Color.fromRGBO(75, 85, 97, 1),),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,   // <-- add this
          children: [
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
                        Text("Internal Follow Up", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromRGBO(62, 74, 55, 1))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Text("Select Date", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color.fromRGBO(62, 74, 55, 1))),
                Text(monthAndYear)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10)
                  ),
                  onPressed:() {
                    
                  },
                  child: Column(
                    children: [
                      Text(DateFormat('MMM').format(now).toUpperCase(), style: TextStyle(fontSize: 12)),
                      Text(DateFormat('dd').format(now), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10)
                  ),
                  onPressed:() {
                    
                  },
                  child: Column(
                    children: [
                      Text(DateFormat('MMM').format(now).toUpperCase(), style: TextStyle(fontSize: 12)),
                      Text(DateFormat('dd').format(now.add(Duration(days: 1))), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),

    );
  }
}