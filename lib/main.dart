import 'package:FlutterPersistenciaDados/screens/dashboard.dart';
import 'package:FlutterPersistenciaDados/screens/heroes_list.dart';
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
        //accentColor: Colors.cyan[600],
        fontFamily: 'RobotoMono',
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.red[800],
          textTheme: ButtonTextTheme.primary
        ),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        )
      ),
        home: Dashboard(),
    );
  }
}



