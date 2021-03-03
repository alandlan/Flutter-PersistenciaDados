import 'package:flutter/material.dart';

class CaracterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Caracter'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Full name'
              ),
              style: TextStyle(
                fontSize: 24.0
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Slogan'
                ),
                style: TextStyle(
                  fontSize: 24.0
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Born'
                ),
                style: TextStyle(
                  fontSize: 24.0
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                    child: Text('Create'),
                    onPressed: (){}),
              ),
            )
          ],
        ),
      )
    );
  }
}
