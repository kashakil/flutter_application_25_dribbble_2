import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List doctorNames = [];

  // reference our box
  final _myBox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    doctorNames = [
      ['Dr. Edison Romanov', false],
      ['Dr. Lily Judgerman', false],
      ['MarryRomlow Ph.D', false],
      ['MarryRomlow Ph.D', false],
    ];
  }

  // load the data from database
  void loadData() {
    doctorNames = _myBox.get("BOXLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("BOXLIST", doctorNames);
  }
}
