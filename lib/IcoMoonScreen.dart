import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'package:flutter_playground/utils/IcomoonFont.dart';

class IcoMoonScreen extends ScreenWidget {
  @override
  State createState() => _StateIcoMoonScreen();

  @override
  String get title => 'Ico Moon';
}

class _StateIcoMoonScreen extends State<IcoMoonScreen> {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                IconData(IcomoonFont.quill, fontFamily: 'icomoon'),
                size: 30.0,
              ),
              SizedBox(height: 10.0),
              Icon(
                IconData(IcomoonFont.images, fontFamily: 'icomoon'),
                size: 30.0,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
