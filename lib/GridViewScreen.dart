import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'dart:math';

class GridViewScreen extends ScreenWidget {
  @override
  State createState() => _StateGridViewScreen();

  @override
  String get title => 'Grid View Treasure';
}

class Area {
  int index;
  String name;
  Color color;

  Area({this.index: -1, this.name: 'Area', this.color: Colors.lightBlueAccent});

}

class _StateGridViewScreen extends State<GridViewScreen> {

  int _location;
  List<Area> _areas;

  @override
  void initState() {
//    _areas = List<Area>();
//    for (var i = 0; i < 16; ++i) {
//      _areas.add(Area(index:  i, name: 'Area $i'));
//    }
//
//    var random = Random();
//    _location = random.nextInt(_areas.length);
    _onRestart();
  }

  Widget _generate(int index) {
    return GridTile(
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: RaisedButton(
          onPressed: () => _onPressed(index),
          color: _areas[index].color,
          child: Text(_areas[index].name, textAlign: TextAlign.center,),
        ),
      )
    );
  }

  void _onPressed(int index) {
    setState(() {
      if (index == _location) {
        _areas[index].color = Colors.green;
      } else {
        _areas[index].color = Colors.red;
      }
    });
  }

  void _onRestart() {
    var areas = List<Area>();
    for (var i = 0; i < 16; ++i) {
      areas.add(Area(index:  i, name: 'Area $i'));
    }

    var random = Random();
    _location = random.nextInt(areas.length);

    if (_areas != null) {
      setState(() {
        _areas = areas;
      });
    } else {
      _areas = areas;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} Screen'),
      ),
      body: Container(
        color: Colors.green,
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(onPressed: _onRestart, child: Text('Restart Game'), color: Colors.amber,),
              Padding(padding: EdgeInsets.only(bottom: 10.0)),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  children: List<Widget>.generate(16, _generate),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
