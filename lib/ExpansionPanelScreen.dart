import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(this.isExpanded, this.header, this.body);
}

class ExpansionPanelScreen extends ScreenWidget {
  @override
  State createState() => _StateExpansionPanelScreen();

  @override
  String get title => 'Expansion Panel';

}

class _StateExpansionPanelScreen extends State<ExpansionPanelScreen> {

  List<MyItem> _items = List<MyItem>();

  @override
  void initState() {
    for (var i = 0; i < 10; ++i) {
      _items.add(
        MyItem(
          false,
          'Item $i',
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text('Hello world!'),
           )
        )
      );
    }
  }

  ExpansionPanel _createItem(MyItem item) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          padding: EdgeInsets.all(5.0),
          child: Text('Header ${item.header }'),
        );
      },
      body: item.body,
      isExpanded: item.isExpanded,
    );
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
          child: ListView(
            children: <Widget>[
              ExpansionPanelList(
                children:  _items.map( _createItem).toList(),
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _items[index].isExpanded = !isExpanded;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
