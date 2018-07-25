import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TextFieldScreen extends StatefulWidget {
  @override
  State createState() => _TextFieldScreen();
}

class _TextFieldScreen extends State<TextFieldScreen> {

  String _value = 'Hello world';

  void _onChange(String value) {
    setState(() {
      _value = value;
    });
  }

  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('$_value'),
              TextField(
                decoration: new InputDecoration(
                    labelText: 'Hello',
                    hintText: 'Hint',
                    icon: Icon(Icons.ac_unit)),
                onChanged: _onChange,
                onSubmitted: (value) => _onChange('Submit: $value'),
                autocorrect: true,
                // autofocus: true,
                maxLength: 20,
                keyboardType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                child: Row(
                  children: <Widget>[
                    Text('Username'),
                    Padding(padding: EdgeInsets.only(right: 10.0),),
                    Expanded(
                        child: TextField(
                          controller: _textEditingController1,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
                child: Row(
                  children: <Widget>[
                    Text('Password'),
                    Padding(padding: EdgeInsets.only(right: 10.0),),
                    Expanded(
                        child: TextField(
                          controller: _textEditingController2,
                          obscureText: true,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

