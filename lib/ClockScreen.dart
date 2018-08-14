import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'package:intl/intl.dart';

class ClockScreen extends ScreenWidget {
  @override
  State createState() => _StateClockScreen();

  @override
  String get title => 'Clock';

}

class _StateClockScreen extends State<ClockScreen> {

  String _value = 'Time Here';
  Timer _timer;


  @override
  void initState() {
    _timer = Timer.periodic(new Duration(seconds: 1), _onTimer);
  }

  void _onTimer(Timer timer) {
    var now = new DateTime.now();
    var formatter = new DateFormat('hh:mm:ss');
    String formatted = formatter.format(now);
    setState(() => _value = formatted);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Text(_value, style: TextStyle(fontSize: 32.0),),
        ),
      ),
    );
  }
}
