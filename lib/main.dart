import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'RobotoMono',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        )
      ),
        home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.wb_auto),
            title: Text('The Avengers'),
          ),

          body: Column(
            children: <Widget>[
              Image.asset('images/marvel.png'),
              Container(
                height: 120,
                width: 100,
                color: Colors.red[800],
                child: Column(
                  children: <Widget>[
                    Icon(Icons.people),
                    Text('Heroes')
                  ],
                ),
              )
            ],
          ),
    ));
  }
}
