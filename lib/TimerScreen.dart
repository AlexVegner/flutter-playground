import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'package:flutter_playground/timer/TimeCounter.dart';

class TimerScreen extends ScreenWidget {
  @override
  State createState() => _StateTimerScreen();

  @override
  String get title => 'Timer';

}

class _StateTimerScreen extends State<TimerScreen> {

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
              TimeCounter()
            ],
          ),
        ),
      ),
    );
  }
}
