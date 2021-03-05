import 'package:FlutterPersistenciaDados/screens/villain_form.dart';
import 'package:flutter/material.dart';

class VillainsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Villains'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Ultron', style: TextStyle(fontSize: 24.0),),
              subtitle: Text('A única ameaça ao planeta seria seus próprios habitantes.'),
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => VillainForm()));
        },
        child: Icon(Icons.adb_sharp),
      ),
    );
  }
}
