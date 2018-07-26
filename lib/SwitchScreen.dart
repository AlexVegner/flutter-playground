import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class SwitchScreen extends ScreenWidget {
  @override
  State createState() => _StateSwitchScreen();

  @override
  String get title => 'Switch';
}

class _StateSwitchScreen extends State<SwitchScreen> {
  var _switchValue1 = false;
  var _switchValue2 = false;

  void _changeSwitchValue1(bool value) => setState(() => _switchValue1 = value);

  void _changeSwitchValue2(bool value) => setState(() => _switchValue2 = value);

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
              Switch(value: _switchValue1, onChanged: _changeSwitchValue1),
              SwitchListTile(
                value: _switchValue2,
                onChanged: _changeSwitchValue2,
                title: Text(
                  'Switch Title',
                  style: TextStyle(
                    fontWeight:
                    _switchValue2 ? FontWeight.bold : FontWeight.normal,
                    color: _switchValue2 ? Colors.pink : Colors.grey,
                  ),
                ),
                subtitle: Text('Sub'),
                activeColor: Colors.pink,
                secondary: Icon(
                  Icons.ac_unit,
                  color: _switchValue2 ? Colors.pink : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

