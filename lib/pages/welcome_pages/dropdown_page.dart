import 'package:flutter/material.dart';

class DropDownPage extends StatefulWidget {
  @override
  _DropDownPageState createState() => _DropDownPageState();
}

class _DropDownPageState extends State<DropDownPage> {
  String title = 'DropDownButton';
  String? _jobsVal;
  List _jobsName = [
    'Mühendis',
    'Öğretmen',
    'Doktor',
    'Hemşire',
    'Avukat'

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: DropdownButton(
              hint: Text('meslek seçiniz'),
              dropdownColor: Colors.white,
              elevation: 5,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 36.0,
              isExpanded: true,
              value: _jobsVal,
              style: TextStyle(color: Colors.black, fontSize: 22.0),
              onChanged: (value) {
                setState(() {
                  _jobsVal= value as String?;
                });
              },
              items: _jobsName.map((value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
