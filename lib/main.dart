import 'package:flutter/material.dart';
import 'package:flutter_playground/ButtonsScreen.dart';
import 'package:flutter_playground/CheckboxScreen.dart';
import 'package:flutter_playground/DialogsScreen.dart';
import 'package:flutter_playground/RadiosScreen.dart';
import 'package:flutter_playground/SliderScreen.dart';
import 'package:flutter_playground/SwitchScreen.dart';
import 'package:flutter_playground/TextFieldScreen.dart';
import 'dart:async';
import 'ListScreen.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {

  var _footerValue = '';

  void _onFooterButtonClick(String value) =>
      setState(() => _footerValue = value);

  List<BottomNavigationBarItem> _bottomItems;
  String _bottomValue = '';
  int _bottomIndex = 0;

  @override
  void initState() {
    _bottomItems = List();
    _bottomItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.people), title: Text('People')));
    _bottomItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.weekend), title: Text('Weekend')));
    _bottomItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.message), title: Text('Message')));
  }

  Widget _buildRouteButton(String title, WidgetBuilder routeBuilder) {
    return Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            color: Colors.blue.shade50,
            splashColor: Colors.blue.shade800,
            highlightColor: Colors.blue.shade300,
            child: Text(title),
            onPressed: () {
              Navigator.push(context,  MaterialPageRoute(
                builder: routeBuilder,
              ));
            },
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App name'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItems,
        currentIndex: _bottomIndex,
        fixedColor: Colors.blue,
        onTap: (int itemIndex) {
          setState(() {
            _bottomIndex = itemIndex;
            _bottomValue = 'Bottom Index $itemIndex';
          });
        },
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              _buildRouteButton('Show ListView', (BuildContext context) => ListScreen()),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              _buildRouteButton('Show Checkbox', (BuildContext context) => CheckboxScreen()),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              _buildRouteButton('Show Switch', (BuildContext context) => SwitchScreen()),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              _buildRouteButton('Show Radios', (BuildContext context) => RadiosScreen()),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              _buildRouteButton('Show Dialogs', (BuildContext context) => DialogsScreen()),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              _buildRouteButton('Show Slider', (BuildContext context) => SliderScreen()),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              _buildRouteButton('Show Buttons', (BuildContext context) => ButtonsScreen()),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              _buildRouteButton('Show TextField', (BuildContext context) => TextFieldScreen()),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Icon(Icons.close),
              )
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: SingleChildScrollView(
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
                )),
                Text(_bottomValue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
