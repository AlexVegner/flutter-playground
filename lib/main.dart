import 'package:flutter/material.dart';
import 'package:flutter_playground/AuthScreen.dart';
import 'package:flutter_playground/ButtonsScreen.dart';
import 'package:flutter_playground/CardScreen.dart';
import 'package:flutter_playground/ChartGroupScreen.dart';
import 'package:flutter_playground/ChartsScreen.dart';
import 'package:flutter_playground/CheckboxScreen.dart';
import 'package:flutter_playground/DialogsScreen.dart';
import 'package:flutter_playground/ExpansionPanelScreen.dart';
import 'package:flutter_playground/GridViewScreen.dart';
import 'package:flutter_playground/PieChartScreen.dart';
import 'package:flutter_playground/PopupMenuScreen.dart';
import 'package:flutter_playground/ProgressScreen.dart';
import 'package:flutter_playground/RadiosScreen.dart';
import 'package:flutter_playground/RemoveItemsScreen.dart';
import 'package:flutter_playground/ScreenWidget.dart';
import 'package:flutter_playground/SliderScreen.dart';
import 'package:flutter_playground/StepperScreen.dart';
import 'package:flutter_playground/SwitchScreen.dart';
import 'package:flutter_playground/TabBarViewScreen.dart';
import 'package:flutter_playground/TextFieldScreen.dart';
import 'package:flutter_playground/ClockScreen.dart';
import 'package:flutter_playground/TimerScreen.dart';
import 'package:flutter_playground/TooltipScreen.dart';
import 'package:flutter_playground/screens/HomeScreen.dart';
import 'package:flutter_playground/screens/SecondScreen.dart';
import 'package:flutter_playground/screens/ThirdScreen.dart';
import 'dart:async';
import 'ListScreen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_playground/state/actions.dart';

//Actions for redux, these are the things we do

//The reducer will take the action and create a new state
int reducer(int state, dynamic action) {
  switch (action) {
    case Actions.Increment:
      state++;
      break;
    case Actions.Decrement:
      state--;
      break;
  }

  print('reducer: ${action.toString()}');

  return state;
}

loggingMiddleware(Store<int> store, action, NextDispatcher next) {
  print('${new DateTime.now()}: $action');

  next(action);
}


void main() {
  final store = new Store<int>(
    reducer,
    initialState: 0,
    middleware: [loggingMiddleware],
  );
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {

  MyApp({Key key, this.store}) : super(key: key);
  final Store<int> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        title: 'Navigation',
        routes: <String, WidgetBuilder>{
          //All available pages
          '/MyApp': (BuildContext context) => new MyHome(),
          '/Home': (BuildContext context) => new HomeScreen(),
          '/Second': (BuildContext context) => new SecondScreen(''),
          '/Third': (BuildContext context) => new ThirdScreen(),
        },
        home: MyHome(),
      ),
    );
  }
}


class MyHome extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyHome> {


  List<BottomNavigationBarItem> _bottomItems;
  String _bottomValue = '';
  int _bottomIndex = 0;

  @override
  void initState() {
    _bottomItems = List();
    _bottomItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.people), title: Text('People')));
    _bottomItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.weekend), title: Text('Weekend')));
    _bottomItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.message), title: Text('Message')));
  }

  Widget _buildRouteButton(ScreenWidget screen) {
    //screen.
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: Colors.blue.shade50,
              splashColor: Colors.blue.shade800,
              highlightColor: Colors.blue.shade300,
              child: Text(screen.title),
              onPressed: () {
                Navigator.push(context,  MaterialPageRoute(
                  builder: (BuildContext context) => screen,
                ));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoneNamedRoute(String route, String title) {
    //screen.
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              color: Colors.blue.shade50,
              splashColor: Colors.blue.shade800,
              highlightColor: Colors.blue.shade300,
              child: Text(title),
              onPressed: () {
                Navigator.of(context).pushNamed(route);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderFeatures() {
    return Container(
      padding: EdgeInsets.all(32.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildHoneNamedRoute('/Home', 'Named navigation'),
            _buildRouteButton(AuthScreen()),
            _buildRouteButton(TimerScreen()),
            _buildRouteButton(ClockScreen()),
            _buildRouteButton(PieChartsScreen()),
            _buildRouteButton(ChartGroupScreen()),
            _buildRouteButton(ChartsScreen()),
            _buildRouteButton(GridViewScreen()),
            _buildRouteButton(StepperScreen()),
            _buildRouteButton(ExpansionPanelScreen()),
            _buildRouteButton(TabBarViewScreen()),
            _buildRouteButton(PopupMenuScreen()),
            _buildRouteButton(ProgressScreen()),
            _buildRouteButton(RemoveItemsScreen()),
            _buildRouteButton(TooltipScreen()),
            _buildRouteButton(ListScreen()),
            _buildRouteButton(CardScreen()),
            _buildRouteButton(CheckboxScreen()),
            _buildRouteButton(SwitchScreen()),
            _buildRouteButton(RadiosScreen()),
            _buildRouteButton(DialogsScreen()),
            _buildRouteButton(SliderScreen()),
            _buildRouteButton(ButtonsScreen()),
            _buildRouteButton(TextFieldScreen()),
            _buildRouteButton(TextFieldScreen()),
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.close),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App name'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomItems,
        currentIndex: _bottomIndex,
        fixedColor: Colors.blue,
        onTap: (int itemIndex) {
          setState(() {
            _bottomIndex = itemIndex;
            _bottomValue = 'Bottom Index $itemIndex';
          });
        },
      ),
      drawer: Drawer(
        child: _renderFeatures(),
      ),
      body: Container(
        padding: EdgeInsets.all(2.0),
        child: _renderFeatures(),
      ),
    );
  }
}
