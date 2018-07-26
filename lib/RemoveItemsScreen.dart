import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class RemoveItemsScreen extends ScreenWidget {
  @override
  State createState() => _StateRemoveItemsScreen();

  @override
  String get title => 'RemoveItems';
}

class _StateRemoveItemsScreen extends State<RemoveItemsScreen> {

  int _counter = 0;

  var _list = List<Widget>();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 5; i++) {
      Widget item = _newItem(i);
      _list.add(item);
    }
  }

  void _onClick() {
    Widget item = _newItem(_counter);
    setState(() => _list.add(item));
  }

  Widget _newItem(int index) {
    Key key = Key('item_$index');
    Container child = Container(
      key: key,
      child: Chip(
        label: Text('$index Name here'),
        deleteIconColor: Colors.red,
        deleteButtonTooltipMessage: 'Delete',
        onDeleted: () => _removeItem(key),
        avatar: CircleAvatar(
          backgroundColor: Colors.grey.shade800,
          child: Text(index.toString()),
        ),
      ),

    );
    _counter++;
    return child;
  }

  void _removeItem(Key key) {
    for (int i = 0; i < _list.length; i++) {
      Widget child = _list.elementAt(i);
      if (child.key == key) {
        setState(() {
          _list.removeAt(i);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} Screen'),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _onClick, child: Icon(Icons.add),),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: _list,
          ),
        ),
      ),
    );
  }
}
