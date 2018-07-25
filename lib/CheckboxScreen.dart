import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CheckboxScreen extends StatefulWidget {
  @override
  State createState() => _StateCheckboxScreen();
}

class _StateCheckboxScreen extends State<CheckboxScreen> {
  var _checkValue1 = false;
  var _checkValue2 = false;
  var _checkValueText = '';

  void _changeCheckValue1(bool value) {
    setState(() {
      _checkValue1 = value;
      _checkValueText = '_checkValue1 was changed';
    });
  }

  void _changeCheckValue2(bool value) {
    setState(() {
      _checkValue2 = value;
      _checkValueText = '_checkValue2 was changed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_checkValueText),
              Checkbox(value: _checkValue1, onChanged: _changeCheckValue1),
              CheckboxListTile(
                value: _checkValue2,
                onChanged: _changeCheckValue2,
                title: Text('Title'),
                subtitle: Text('df'),
                activeColor: Colors.amberAccent,
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

