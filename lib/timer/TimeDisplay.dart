import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeDisplay extends StatelessWidget {

  TimeDisplay({Key key,Color this.color, Duration this.duration, this.onClear}) : super(key: key);

  Duration duration = new Duration();
  Color color = Colors.green;
  final ValueChanged<Duration> onClear;

  void _onClicked() {
    onClear(duration);
  }

  String _formatWith2Zero(int value) {
    return value > 9 ? value.toString() : '0$value';
  }

  @override
  Widget build(BuildContext context) {
    var hours = duration.inHours;
    var minutes = duration.inMinutes - hours * 60;
    var seconds = duration.inSeconds - minutes * 60 - hours * 60 * 60;
    var formatter = '${_formatWith2Zero(hours)}:${_formatWith2Zero(minutes)}:${_formatWith2Zero(seconds)}';

    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.all(5.0),
          child: new Text(formatter, style: new TextStyle(fontSize: 32.0, color: color),),
        ),
        new IconButton(icon: new Icon(Icons.clear), onPressed: _onClicked)

      ],
    );
  }
}