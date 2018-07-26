import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TooltipScreen extends StatefulWidget {
  @override
  State createState() => _StateTooltipScreen();
}

class _StateTooltipScreen extends State<TooltipScreen> {
  String _value = "No data";

  void _onPressed() => setState(() => _value = DateTime.now().toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tooltip Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_value),
              IconButton(icon: Icon(Icons.print), onPressed: _onPressed, tooltip: 'Tooltip',)
            ],
          ),
        ),
      ),
    );
  }
}
