import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class PieChartsScreen extends ScreenWidget {
  @override
  State createState() => _StatePieChartsScreen();

  @override
  String get title => 'Pie Charts';

}


class Sales {
  int year;
  int sales;
  charts.Color color;
  Sales(this.year,this.sales,this.color);
}

class _StatePieChartsScreen extends State<PieChartsScreen> {

  List<Sales> _data;
  List<charts.Series<Sales, int>> _chartdata;

  void _makeData() {
    _chartdata = new List<charts.Series<Sales, int>>();
    _data = <Sales>[
      new Sales(0,100, charts.MaterialPalette.red.shadeDefault),
      new Sales(1,75, charts.MaterialPalette.blue.shadeDefault),
      new Sales(2,25, charts.MaterialPalette.green.shadeDefault),
      new Sales(3,5, charts.MaterialPalette.yellow.shadeDefault),
    ];

    _chartdata.add(new charts.Series(
      id: 'Sales',
      data: _data,
      colorFn: (Sales sales,_) => sales.color,
      domainFn: (Sales sales,_) => sales.year,
      measureFn: (Sales sales,_) => sales.sales,
    ));

  }

  @override
  void initState() {
    _makeData();
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
              Expanded(child: charts.PieChart(
                _chartdata,
                animate: true,
                animationDuration: Duration(seconds: 5),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
