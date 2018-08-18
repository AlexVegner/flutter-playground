import 'package:flutter/material.dart';
import '../state/GlobalState.dart';
import './SecondScreen.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomeScreen> {

  TextEditingController _nameTextController;
  GlobalState _store = GlobalState.instance;

  @override
  void initState() {
    _nameTextController = new TextEditingController();
    _store.set('name', '');
    _nameTextController.text = _store.get('name');
  }

  void _onPressed() {
    _store.set('name', _nameTextController.text);
    Navigator.push(context, new MaterialPageRoute(
      builder: (BuildContext context) => new SecondScreen(_nameTextController.text + ' value'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text('Welcome Home'),
                new RaisedButton(onPressed: (){Navigator.of(context).pushNamedAndRemoveUntil('/Second', (Route<dynamic> route) => false);}, child: new Text('Next'),),
                new TextField(
                  controller: _nameTextController,
                  decoration: new InputDecoration(labelText: 'Enter your name'),
                ),
                new RaisedButton(onPressed: _onPressed, child: new Text('Next'),)
              ],
            ),
          )
      ),
    );
  }
}