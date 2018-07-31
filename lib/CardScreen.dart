import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class CardScreen extends ScreenWidget {
  @override
  State createState() => _StateCardScreen();

  @override
  String get title => 'Card';

}

class _StateCardScreen extends State<CardScreen> {

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
              Card(
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Text('Text1'),
                      Text('Text2'),
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
