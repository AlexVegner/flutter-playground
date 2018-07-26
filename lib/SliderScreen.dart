import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class SliderScreen extends ScreenWidget {
  @override
  State createState() => _StateSliderScreen();

  // TODO: implement title
  @override
  String get title => 'Slider';
}

class _StateSliderScreen extends State<SliderScreen> {

  var _doubleSlider = 1.0;

  void _setSliderValue(double value) => setState(() => _doubleSlider = value);

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

