import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
          title: Text('Dashboard'),
      ),
          body: Column(
            children: <Widget>[
              Image.asset('images/marvel.png'),
              Container(
                height: 120,
                width: 100,
                color: Colors.grey,
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
