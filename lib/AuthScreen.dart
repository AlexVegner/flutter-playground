import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'package:flutter_playground/auth/Authenticator.dart';

class AuthScreen extends ScreenWidget {
  @override
  State createState() => _StateAuthScreen();

  @override
  String get title => 'Auth';

}

class _StateAuthScreen extends State<AuthScreen> {


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
              new Authenticator(onAuthenticated: _onAuthenticated,),
              new Text('Authenticated: ${_isAuthenticated}'),
            ],
          ),
        ),
      ),
    );
  }
}
