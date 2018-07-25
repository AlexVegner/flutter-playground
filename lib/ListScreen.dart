import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListScreen extends StatefulWidget {
  @override
  State createState() => _StateListScreen();
}

class _StateListScreen extends State<ListScreen> {
  String _date = '';

  Map _countries = Map<String, String>();


  @override
  void initState() {
    super.initState();
    _getListData();
  }

  void _getListData() async {
    var url = 'http://country.io/names.json';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _countries = json.decode(response.body);
      });
      print('Loaded ${_countries.length} countries');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: ListView.builder(
                  itemCount: _countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    String key = _countries.keys.elementAt(index);
                    String value = _countries[key];
                    return Row(
                      children: <Widget>[
                        Text('$key -'),
                        Text(value),
                      ],
                    );
                  })),
            ],
          ),
        ),
      ),
    );
  }
}

