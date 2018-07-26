import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class TooltipScreen extends ScreenWidget {
  @override
  State createState() => _StateTooltipScreen();

  @override
  String get title => 'Tooltip';

}

class _StateTooltipScreen extends State<TooltipScreen> {
  String _value = "No data";

  void _onPressed() => setState(() => _value = DateTime.now().toString());

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
              Text(_value),
              IconButton(icon: Icon(Icons.print), onPressed: _onPressed, tooltip: 'Tooltip',)
            ],
          ),
        ),
      ),
    );
  }
}
