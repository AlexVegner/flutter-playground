import 'package:flutter/material.dart';
import 'package:flutter_playground/state/actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdState createState() => new _ThirdState();
}

class _ThirdState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Name here'),
      ),
      body: new Container(
          padding: new EdgeInsets.all(32.0),
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Text('Third Page'),
                new RaisedButton(onPressed: (){Navigator.of(context).pushNamed('/Second');}, child: new Text('Back'),),
                new StoreConnector<int, String>(
                  converter: (store) {
                    print('store.state: ${store.state}');
                    return store.state.toString();
                  },
                  builder: (context, count) {
                    return new Text(
                      count,
                      style: Theme.of(context).textTheme.display1,
                    );
                  },
                ),
                new StoreConnector<int, VoidCallback>(
                  converter: (store) {
                    // Return a `VoidCallback`, which is a fancy name for a function
                    // with no parameters. It only dispatches an Increment action.
                    return () => store.dispatch(Actions.Increment);
                  },
                  builder: (context, callback) {
                    return IconButton(icon: Icon(Icons.add), onPressed: callback);
                  },
                ),
                new StoreConnector<int, VoidCallback>(
                  converter: (store) {
                    // Return a `VoidCallback`, which is a fancy name for a function
                    // with no parameters. It only dispatches an Increment action.
                    return () => store.dispatch(Actions.Decrement);
                  },
                  builder: (context, callback) {
                    return IconButton(icon: Icon(Icons.remove), onPressed: callback);
                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}