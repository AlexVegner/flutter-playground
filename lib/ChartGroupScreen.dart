import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartGroupScreen extends ScreenWidget {
  @override
  State createState() => _StateChartGroupScreen();

  @override
  String get title => 'Group Chart';

}

class Sales {
  String year;
  int sales;
  Sales(this.year, this.sales);
}

class _StateChartGroupScreen extends State<ChartGroupScreen> {

  List<Sales> _laptop;
  List<Sales> _desktop;
  List<charts.Series<Sales, String>> _chartdata;

  void _makeData() {
    _laptop = new List<Sales>();
    _desktop = new List<Sales>();
    _chartdata = new List<charts.Series<Sales, String>>();

    final rnd = new Random();
    for(int i = 2010; i < 2019; i++) {
      _laptop.add(new Sales(i.toString(), rnd.nextInt(1000)));
      _desktop.add(new Sales(i.toString(), rnd.nextInt(1000)));
    }

    _chartdata.add(new charts.Series(
        id: 'Sales',
        colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
        data: _laptop,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_,__) => charts.FillPatternType.solid,
        displayName: 'sales'
      )
    );

    _chartdata.add(new charts.Series(
        id: 'Sales',
        colorFn: (_,__) => charts.MaterialPalette.red.shadeDefault,
        data: _desktop,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_,__) => charts.FillPatternType.solid,
        displayName: 'sales'
    )
    );

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
              Expanded(child: charts.BarChart(_chartdata))
            ],
          ),
        ),
      ),
    );
  }
}
