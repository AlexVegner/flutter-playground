import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class TimerScreen extends ScreenWidget {
  @override
  State createState() => _StateTimerScreen();

  @override
  String get title => 'Timer';

}

class _StateTimerScreen extends State<TimerScreen> {

  Duration _duration = Duration(milliseconds: 1);
  double _value = 0.0;
  Timer _timer;
  bool _active = false;


  @override
  void initState() {
    _timer = Timer.periodic(_duration, _timeout);
  }

  void _timeout(Timer timer) {
    if (!_active)
      return;
    setState(() {
      _value = _value + 0.001;
      if (_value == 1.0) {
        _active = false;
      }
    });
  }

  void _onPressed() {
    setState(() {
      _value = 0.0;
      _active = true;
    });
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
          child: Column(
            children: <Widget>[
              LinearProgressIndicator(value: _value,),
              IconButton(icon: Icon(Icons.timer), onPressed: _onPressed, tooltip: 'Tooltip',)
            ],
          ),
        ),
      ),
    );
  }
}
