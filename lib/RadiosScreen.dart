import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class RadiosScreen extends ScreenWidget {
  @override
  State createState() => _StateRadiosScreen();

  @override
  String get title => 'Radios';
}

class _StateRadiosScreen extends State<RadiosScreen> {

  var _radiosValue1 = 0;
  var _radiosValue2 = 0;

  void _changeRadiosValue1(int value) => setState(() => _radiosValue1 = value);

  void _changeRadiosValue2(int value) => setState(() => _radiosValue2 = value);

  Widget makeRadios() {
    List<Widget> list = List();
    for (int i = 0; i < 3; i++) {
      list.add(Radio(
          value: i, groupValue: _radiosValue1, onChanged: _changeRadiosValue1));
    }
    Column column = Column(children: list);
    return column;
  }

  Widget makeRadiosListTile() {
    List<Widget> list = List();
    for (int i = 0; i < 3; i++) {
      list.add(RadioListTile(
        value: i,
        groupValue: _radiosValue2,
        onChanged: _changeRadiosValue2,
        title: Text('Title $i'),
        subtitle: Text('Subtitle'),
      ));
    }
    Column column = Column(children: list);
    return column;
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
              makeRadiosListTile(),
              makeRadios(),
            ],
          ),
        ),
      ),
    );
  }
}

