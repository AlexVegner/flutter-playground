import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProgressScreen extends ScreenWidget {
  @override
  State createState() => _StateProgressScreen();

  @override
  String get title => 'Progress';
}

class _StateProgressScreen extends State<ProgressScreen> {

  double _value = 0.0;

  void _onChange(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('${widget.title} Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Progress'),
              Slider(
                value: _value,
                onChanged: _onChange,
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              LinearProgressIndicator(
                value: _value,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              CircularProgressIndicator(
                value: _value,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
              )
            ],
          ),
        ),
      ),
    );
  }
}

