import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class ButtonsScreen extends ScreenWidget {
  @override
  State createState() => _StateButtonsScreen();

  @override
  String get title => 'Buttons';
}

class _StateButtonsScreen extends State<ButtonsScreen> {

  String _value = 'Hello world';
  var _clickCounter = 1;

  void _onPressed(String value) {
    setState(() {
      _clickCounter = _clickCounter + 1;
      _value = '$value ${DateTime.now().toString()}';
    });
  }

  void _increment() {
    setState(() {
      _clickCounter++;
    });
  }

  void _decrement() {
    setState(() {
      _clickCounter--;
    });
  }

  var _floatingText = '';

  void _floatingAction() =>
      setState(() => _floatingText = DateTime.now().toString());

  var _actionCounter = 1;

  void _actionAdd() => setState(() => _actionCounter++);

  void _actionRemove() => setState(() => _actionCounter--);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('${widget.title} Screen $_actionCounter'),
        backgroundColor: Colors.indigo,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: _actionAdd),
          IconButton(icon: Icon(Icons.remove), onPressed: _actionRemove),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _floatingAction,
        child: Icon(Icons.timer),
        mini: false,
      ),
      persistentFooterButtons: <Widget>[
        IconButton(icon: Icon(Icons.add), onPressed: _actionAdd),
        IconButton(icon: Icon(Icons.remove), onPressed: _actionRemove),
        IconButton(
            icon: Icon(
              Icons.timer,
              color: Colors.blueAccent,
            ),
            onPressed: _floatingAction),
      ],
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('$_value $_clickCounter times'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () => _onPressed("Last update -> "),
                  child: Text('Click'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  onPressed: () => _onPressed("Last update -> "),
                  child: Text('Click'),
                ),
              ),
              IconButton(
                onPressed: _increment,
                icon: Icon(Icons.add),
              ),
              IconButton(
                onPressed: _decrement,
                icon: Icon(Icons.remove),
              ),
              Text(_floatingText),
            ],
          ),
        ),
      ),
    );
  }
}

