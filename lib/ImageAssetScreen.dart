import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';

class ImageAssetScreen extends ScreenWidget {
  @override
  State createState() => _StateImageAssetScreen();

  @override
  String get title => 'Image Asset';

}

class _StateImageAssetScreen extends State<ImageAssetScreen> {

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
              Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/food.jpg'),
                    Text('Food'),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
