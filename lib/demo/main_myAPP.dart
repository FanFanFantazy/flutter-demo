import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main() {
  debugPaintSizeEnabled = false;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Test Layout',
      home: new MyHomePage(),
      theme: new ThemeData(
        primaryColor: Colors.teal,
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('LayOut Test'),
      ),
      body: _myBody(),
      floatingActionButton: CounterButton()
    );
  }
  Widget _myBody() {
    return new Center(
      child: ListView(
        children: <Widget>[
          _myImage(),
          _myFirstRow(),
          _mySecondRow(),
          _myThirdRow(),
        ],
      )
    );
  }
  Widget _myImage() {
    return Card(
      child: Image.asset('images/camel.jpg', fit: BoxFit.cover)
    );
  }
  Widget _myFirstRow() {
    return Card (
      child: Container (
        padding:const EdgeInsets.all(32.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('A Fat Camel on my Screen', style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
                  ),
                  Text('A camel from Inner Mongolia', style: new TextStyle(
                    color: Colors.grey[500],
                  ))
                ],
              )
            ),
            FavoriteWidget()
          ],
        )
      )
    );
  }
  Widget _mySecondRow() {
    return Card (
      child: Container(
        padding:const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buttonColumn(Icons.call, 'CALL'),
            buttonColumn(Icons.near_me, 'ROUTE'),
            buttonColumn(Icons.share, 'SHARE')
          ],
        )
      )
    );
  }
  Column buttonColumn(IconData icon, String label) {
    Color color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: color),
        Text(
          label,
          style: new TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        )
      ],
    );
  }
  Widget _myThirdRow() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(32.0),
        child: Text('''A camel is an even-toed ungulate in the genus Camelus that bears distinctive fatty deposits known as humps on its back. Camels have long been domesticated and, as livestock, they provide food (milk and meat) and textiles (fiber and felt from hair). As working animals, camels—which are uniquely suited to their desert habitats—are a vital means of transport for passengers and cargo. There are three surviving species of camel. The one-humped dromedary makes up 94% of the world's camel population, and the two-humped Bactrian camel makes up the remainder. The Wild Bactrian camel is a separate species and is now critically endangered.''', softWrap: true),
      )
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}
class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 100;
  var _displayCount = '99+';
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
      _displayCount = _favoriteCount > 99 ? '99+' : _favoriteCount.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited ? new Icon(Icons.star) : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        new SizedBox(
          width: 30.0,
          child: new Container(
            child: new Text('$_displayCount'),
          ),
        ),
      ],
    );
  }
}
class CounterButton extends StatefulWidget {
  @override
  _CounterButtonState createState() => new _CounterButtonState();
}
class _CounterButtonState extends State<CounterButton> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter+=1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        Text('$_counter',
        style: new TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: Colors.purpleAccent,
          ),
        )
      ]
    );
  }
}