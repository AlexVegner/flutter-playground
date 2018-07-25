import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SliderScreen extends StatefulWidget {
  @override
  State createState() => _StateSliderScreen();
}

class _StateSliderScreen extends State<SliderScreen> {

  var _doubleSlider = 1.0;

  void _setSliderValue(double value) => setState(() => _doubleSlider = value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Screen'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Value is ${_doubleSlider.round()}'),
              Padding(padding: EdgeInsets.only(top: 10.0),),
              Slider(
                value: _doubleSlider,
                onChanged: _setSliderValue,
                min: 1.0,
                max: 100.0,
                label: 'Label',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

