import 'package:FlutterPersistenciaDados/database/app_database.dart';
import 'package:FlutterPersistenciaDados/models/caracter.dart';
import 'package:FlutterPersistenciaDados/screens/hero_form.dart';
import 'package:flutter/material.dart';

class HeroesList extends StatefulWidget {
  @override
  _HeroesListState createState() => _HeroesListState();
}

class _HeroesListState extends State<HeroesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heroes'),
      ),
      body: FutureBuilder<List<Caracter>>(
          initialData: List(),
          future:
              Future.delayed(Duration(seconds: 1)).then((value) => findAll()),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text("Loading")
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Caracter> caracters = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Caracter caracter = caracters[index];
                    return _HeroesItem(caracter);
                  },
                  itemCount: caracters.length,
                );
                break;
            }

            return Text('Ups!');
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HeroForm(),
            ),
          ).then((value) => setState(() {}));
        },
        child: Icon(Icons.adb_outlined),
      ),
    );
  }
}

class _HeroesItem extends StatelessWidget {
  final Caracter caracter;

  _HeroesItem(this.caracter);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          caracter.name,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(caracter.slogan),
      ),
    );
  }
}
