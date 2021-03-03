import 'package:FlutterPersistenciaDados/screens/caracter_form.dart';
import 'package:flutter/material.dart';

class HeroesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heroes'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Iron Man',style: TextStyle(fontSize: 24.0),),
              subtitle: Text('Gênio, bilionário, playboy, filantropo.'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CaracterForm(),
          ),
          )
              .then((caracter) => debugPrint(caracter.toString()),
          );
        },
        child: Icon(Icons.adb_outlined),
      ),
    );
  }
}
