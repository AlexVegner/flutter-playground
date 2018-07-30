import 'package:flutter/material.dart';
import 'package:flutter_playground/ButtonsScreen.dart';
import 'package:flutter_playground/CheckboxScreen.dart';
import 'package:flutter_playground/DialogsScreen.dart';
import 'package:flutter_playground/ExpansionPanelScreen.dart';
import 'package:flutter_playground/PopupMenuScreen.dart';
import 'package:flutter_playground/ProgressScreen.dart';
import 'package:flutter_playground/RadiosScreen.dart';
import 'package:flutter_playground/RemoveItemsScreen.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'package:flutter_playground/SliderScreen.dart';
import 'package:flutter_playground/SwitchScreen.dart';
import 'package:flutter_playground/TabBarViewScreen.dart';
import 'package:flutter_playground/TextFieldScreen.dart';
import 'package:flutter_playground/TimerScreen.dart';
import 'package:flutter_playground/TooltipScreen.dart';
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

  Widget _buildRouteButton(ScreenWidget screen) {
    //screen.
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: Colors.blue.shade50,
              splashColor: Colors.blue.shade800,
              highlightColor: Colors.blue.shade300,
              child: Text(screen.title),
              onPressed: () {
                Navigator.push(context,  MaterialPageRoute(
                  builder: (BuildContext context) => screen,
                ));
              },
            ),
          ),
        ],
      ),
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
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _buildRouteButton(ExpansionPanelScreen()),
                _buildRouteButton(TimerScreen()),
                _buildRouteButton(TabBarViewScreen()),
                _buildRouteButton(PopupMenuScreen()),
                _buildRouteButton(ProgressScreen()),
                _buildRouteButton(RemoveItemsScreen()),
                _buildRouteButton(TooltipScreen()),
                _buildRouteButton(ListScreen()),
                _buildRouteButton(CheckboxScreen()),
                _buildRouteButton(SwitchScreen()),
                _buildRouteButton(RadiosScreen()),
                _buildRouteButton(DialogsScreen()),
                _buildRouteButton(SliderScreen()),
                _buildRouteButton(ButtonsScreen()),
                _buildRouteButton(TextFieldScreen()),
                _buildRouteButton(TextFieldScreen()),
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Icon(Icons.close),
                )
              ],
            ),
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
