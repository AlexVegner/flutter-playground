import 'package:flutter/material.dart';
import '../state/GlobalState.dart';


class SecondScreen extends StatefulWidget {

  SecondScreen(this.name);
  String name;


  @override
  _SecondState createState() => new _SecondState(name);
}

class _SecondState extends State<SecondScreen> {

  _SecondState(this.name);
  String name;

  GlobalState _store = GlobalState.instance;

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
                new Text('Second Page'),
                new RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Third');}, child: new Text('Next'),),
                new RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Home');}, child: new Text('Back'),),
                Padding(padding: EdgeInsets.only(top: 10.0)),
                new Text('Hello ${_store.get('name')}'),
                new Text('Hello ${name}'),
              ],
            ),
          )
      ),
    );
  }
}