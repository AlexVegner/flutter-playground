import 'package:flutter/material.dart';
import 'dart:async';

enum Answers { YES, NO, MAYBE }

class DialogsScreen extends StatefulWidget {
  @override
  State createState() => _StateDialogsScreen();
}

class _StateDialogsScreen extends State<DialogsScreen> {

  var _valueSimpleDialog = '';

  void setSimpleDialog(String value) =>
      setState(() => _valueSimpleDialog = value);

  Future _showAlertDialog(BuildContext context, String message) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert!'),
            content: Row(
              children: <Widget>[
                Text(message),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  Future _askUser(BuildContext context, String message) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Title'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Yes'),
                onPressed: () => Navigator.pop(context, Answers.YES),
              ),
              SimpleDialogOption(
                child: Text('No'),
                onPressed: () => Navigator.pop(context, Answers.NO),
              ),
              SimpleDialogOption(
                child: Text('Maybe'),
                onPressed: () => Navigator.pop(context, Answers.MAYBE),
              ),
            ],
          );
        })) {
      case Answers.YES:
        setState(() {
          _valueSimpleDialog = 'Yes';
        });
        _showAlertDialog(context, 'Yes');
        break;
      case Answers.NO:
        setState(() {
          _valueSimpleDialog = 'No';
        });
        _showAlertDialog(context, 'No');
        break;
      case Answers.MAYBE:
        setState(() {
          _valueSimpleDialog = 'Maybe';
        });
        _showAlertDialog(context, 'Maybe');
        break;
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey<ScaffoldState>();

  void _showSnackBar() {
    _scaffoldStateKey.currentState.showSnackBar(SnackBar(
      content: Text('Hello'),
      action: SnackBarAction(
          label: 'Show bottom dialog', onPressed: () => _showAlertDialog(context, 'SnackBar button pressed')),
    ));
  }

  void _showBottomDialog() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text('Text 1'),
                Text('Text 2'),
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: Colors.blue.shade500,
                  ),
                ),
              ],
            ),
          );
        });
  }

  String _date = '';

  Future selectDate() async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      setState(() {
        _date = picked.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldStateKey,
      appBar: AppBar(
        title: Text('Checkbox Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Last selection $_valueSimpleDialog'),
              RaisedButton(child: Text('Show Alert dialog'),onPressed: () {
                _showAlertDialog(context, 'Alert message...');
              }),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              RaisedButton(child: Text('Show Choose dialog'),onPressed: () {
                _askUser(context, 'Please select answer:');
              }),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              RaisedButton(child: Text('Show Snack bar'),onPressed: () {
                _showSnackBar();
              }),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              RaisedButton(child: Text('Show Bottom dialog'),onPressed: _showBottomDialog),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              Text('Selected date $_date'),
              RaisedButton(
                onPressed: selectDate,
                child: Text('Select Date'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

