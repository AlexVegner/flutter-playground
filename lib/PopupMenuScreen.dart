import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class PopupMenuScreen extends ScreenWidget {

  @override
  State createState() => _StatePopupMenuScreen();

  @override
  String get title => 'PopupMenu';
}

enum Animals {Dog, Cat, Bird, Lizard, Fish}

class _StatePopupMenuScreen extends State<PopupMenuScreen> {

  Animals _selected = Animals.Cat;
  String _value = 'Make a selection';

  List<PopupMenuItem<Animals>> _items = List();

  @override
  void initState() {
    super.initState();
    for (var animal in Animals.values) {
      _items.add(PopupMenuItem<Animals>(
        child: Text(_getDisplay(animal)),
        value: animal,
      ));
    }
  }
  
  void _onSelectAnimal(Animals animal) {
    setState(() {
      _selected = animal;
      _value = 'You selected ${_getDisplay(animal)}';
    });
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
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(_value),
              ),
              PopupMenuButton<Animals>(
                child: Icon(Icons.input),
                initialValue: _selected,
                onSelected: _onSelectAnimal,
                itemBuilder: (BuildContext context) {
                  return _items;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getDisplay(Animals animal) {
    //int index = animal.toString().indexOf('.') + 1;
    //return animal.toString().substring(index);
    return animal.toString();
  }
}
