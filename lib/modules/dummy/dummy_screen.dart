import 'package:flutter/material.dart';
import 'package:step_app/helper/database_helper.dart';

class DummyScreen extends StatelessWidget {
  final dbHelper = DatabaseHelper();

  DummyScreen({super.key});

  void _insertRecord() async {
    Map<String, dynamic> record = {
      'startTime': 'your_start_time',
      'endTime': 'your_end_time',
      'startStep': "20",
      'endStep': "50",
      'isSend': "yes",
      'totalStep': "30",
    };
    int id = await dbHelper.insertRecord(record);
    print('Inserted record with id: $id');
  }

  void _updateRecord() async {
    Map<String, dynamic> record = {
      'endTime': '12 pm',
      'endStep': "180",
      'isSend': "1",
      'totalStep': "130",
    };
    int id = await dbHelper.updateRecord(1, record);
    print('Inserted record with id: $id');
  }

  void _getRecords() async {
    List<Map<String, dynamic>> records = await dbHelper.getRecords();
    print('Records: $records');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Database Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _insertRecord,
              child: Text('Insert Record'),
            ),
            ElevatedButton(
              onPressed: _getRecords,
              child: Text('Get Records'),
            ),
            ElevatedButton(
              onPressed: _updateRecord,
              child: Text('Update Records'),
            ),
          ],
        ),
      ),
    );
  }
}
