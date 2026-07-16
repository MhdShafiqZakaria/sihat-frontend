// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/view/appointment/mcu_booking_page.dart';

double sides = 10;
double topb = 15;

class ChooseAppointmentTypePage extends StatelessWidget{
  const ChooseAppointmentTypePage ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 247, 239, 1),
      appBar: AppBar(title: Text("BOOK APPOINTMENT", style: TextStyle(fontSize: 15)), centerTitle: true, backgroundColor: Color.fromRGBO(244, 247, 239, 1), foregroundColor: Color.fromRGBO(75, 85, 97, 1),),
      body: 
      Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start, 
              children: [
                Text("    CHOOSE YOUR APPOINTMENT TYPE", style: TextStyle(color: Color.fromRGBO(75, 85, 97, 1), fontSize: 12),),
                ],
            ),
            SizedBox(height: 30,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                fixedSize: const Size(1000, 100),
                elevation: 0,
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const McuBookingPage()),
                );
              }, 
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(241, 245, 249, 1),
                      radius: 25,
                      child: Icon(Icons.medical_services)
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Medical Check Up", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 5,),
                          Text("Faculty coordinated routine examinations.", style: TextStyle(color: Color.fromRGBO(75, 85, 97, 1), fontSize: 12 ))
                        ],
                      )
                    )
                  ],
                ),
              )
              ),
              // Internal Follow Up Button
              SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(1000, 100),
                elevation: 0,
              ),
              onPressed: (){}, 
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(241, 245, 249, 1),
                      radius: 25,
                      child: Icon(Icons.restart_alt)
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Internal Follow Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                          SizedBox(height: 2,),
                          Text("Continue treatment with your regular clinic doctor.", style: TextStyle(color: Color.fromRGBO(75, 85, 97, 1), fontSize: 12 ))
                        ],
                      )
                    )
                  ],
                ),
              )
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                fixedSize: const Size(1000, 100),
                elevation: 0,
              ),
              onPressed: (){}, 
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(241, 245, 249, 1),
                      radius: 25,
                      child: Icon(Icons.fitness_center)
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Physiotherapy", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 5,),
                          Text("Rehabilitative movement and therapy.", style: TextStyle(color: Color.fromRGBO(75, 85, 97, 1), fontSize: 12 ))
                        ],
                      )
                    )
                  ],
                ),
              )
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                fixedSize: const Size(1000, 100),
                elevation: 0,
              ),
              onPressed: (){}, 
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromRGBO(241, 245, 249, 1),
                      radius: 25,
                      child: Icon(Icons.directions_car)
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Transport Booking", style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 5,),
                          Text("Book a transport to PKU.", style: TextStyle(color: Color.fromRGBO(75, 85, 97, 1), fontSize: 12 ))
                        ],
                      )
                    )
                  ],
                ),
              )
              ),
          
          ],
        )
      ) 
      )
    );
  }
}