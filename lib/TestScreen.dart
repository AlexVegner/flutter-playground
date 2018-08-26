import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'package:flutter_playground/auth/Authenticator.dart';

class TestScreen extends ScreenWidget {
  @override
  State createState() => _StateTestScreen();

  @override
  String get title => 'Test';

}

class _StateTestScreen extends State<TestScreen> {


  bool _isAuthenticated;

  void _onAuthenticated(bool value) {
    setState(() => _isAuthenticated = value);
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
              Text('Test hello'),
              
            ],
          ),
        ),
      ),
    );
  }
}
