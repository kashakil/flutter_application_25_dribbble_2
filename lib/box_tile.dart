import 'package:flutter/material.dart';
import 'package:flutter_application_25_dribbble_2/buttons.dart';
import 'package:flutter_application_25_dribbble_2/data/database.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BoxTile extends StatefulWidget {
  const BoxTile({super.key});

  @override
  State<BoxTile> createState() => _BoxTileState();
}

class _BoxTileState extends State<BoxTile> {
  final List<String> specialistList = ['Cardiology', 'Heart', 'Brain', 'Hand'];

  final List<String> imgList = ['doctor1', 'doctor2', 'doctor3', 'doctor4'];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.doctorNames[index][1] = !db.doctorNames[index][1];
    });
    db.updateDataBase();
  }

  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("BOXLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: db.doctorNames.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 12.0, right: 12, left: 12),
          child: Container(
            padding: EdgeInsets.all(12),
            height: 130,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              height: 50.0,
                              width: 60.0,
                              image: AssetImage(
                                'images/${imgList[index]}.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    db.doctorNames[index][0],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    specialistList[index],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Checkbox(
                            value: db.doctorNames[index][1],
                            onChanged: (value) => checkBoxChanged(value, index),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Buttons(),
              ],
            ),
          ),
        );
      },
    );
  }
}
