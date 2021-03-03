import 'package:FlutterPersistenciaDados/models/caracter.dart';
import 'package:flutter/material.dart';

class CaracterForm extends StatefulWidget {

  @override
  _CaracterFormState createState() => _CaracterFormState();
}

class _CaracterFormState extends State<CaracterForm> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _sloganController = TextEditingController();

  final TextEditingController _bornController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Caracter'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
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
                  controller: _sloganController,
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
                  controller: _bornController,
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
                      onPressed: (){
                        final String name = _nameController.text;
                        final String slogan = _sloganController.text;
                        final int born = int.tryParse(_bornController.text);

                        final Caracter caracter = Caracter(0,name,slogan,born);

                        Navigator.pop(context,caracter);
                      }),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
