import 'package:flutter/material.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartsScreen extends ScreenWidget {
  @override
  State createState() => _StateChartsScreen();

  @override
  String get title => 'Charts';

}


class Sales {
  String year;
  int sales;
  Sales(this.year, this.sales);
}

class _StateChartsScreen extends State<ChartsScreen> {

  List<Sales> _data;
  List<charts.Series<Sales, String>> _chartdata;

  void _makeData() {
    _data = new List<Sales>();
    _chartdata = new List<charts.Series<Sales, String>>();

    final rnd = new Random();
    for(int i = 2010; i < 2019; i++) {
      _data.add(new Sales(i.toString(), rnd.nextInt(1000)));
    }

    _chartdata.add(new charts.Series(
        id: 'Sales',
        colorFn: (_,__) => charts.MaterialPalette.green.shadeDefault,
        data: _data,
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        fillPatternFn: (_,__) => charts.FillPatternType.forwardHatch,
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
