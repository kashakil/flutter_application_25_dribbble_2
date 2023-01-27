import 'package:flutter/material.dart';
import 'package:flutter_application_25_dribbble_2/box_tile.dart';
import 'package:flutter_application_25_dribbble_2/screen2.dart';

class AppointmentPage extends StatefulWidget {
  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          'Appointment',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        elevation: 0,
        backgroundColor: Colors.grey.shade300,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.menu_open,
              color: Colors.grey,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Screen2()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 60,
                          width: 175,
                          child: Center(child: Text('Upcoming')),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 60,
                          width: 175,
                          child: Center(child: Text('Completed')),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: BoxTile()),
        ],
      ),
    );
  }
}

// body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               itemCount: _appointments.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(_appointments[index]),
//                 );
//               },
//             ),
//           ),
//           TextField(
//             decoration: InputDecoration(
//               hintText: 'Add an appointment',
//             ),
//             onSubmitted: (text) {
//               _addAppointment(text);
//             },
//           ),
//         ],
//       ),
