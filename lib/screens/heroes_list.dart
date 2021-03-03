import 'package:FlutterPersistenciaDados/models/caracter.dart';
import 'package:FlutterPersistenciaDados/screens/caracter_form.dart';
import 'package:flutter/material.dart';

class HeroesList extends StatelessWidget {

  final List<Caracter> caracters = new List();

  @override
  Widget build(BuildContext context) {
    caracters.add(new Caracter(0, 'Wanda Maximoff', 'Nos Criamos os nossos proprios demonios', 1993));
    caracters.add(new Caracter(0, 'Wanda Maximoff', 'Nos Criamos os nossos proprios demonios', 1993));
    caracters.add(new Caracter(0, 'Wanda Maximoff', 'Nos Criamos os nossos proprios demonios', 1993));
    caracters.add(new Caracter(0, 'Wanda Maximoff', 'Nos Criamos os nossos proprios demonios', 1993));
    return Scaffold(
      appBar: AppBar(
        title: Text('Heroes'),
      ),
      body:
      ListView.builder(
        itemBuilder: (context, index){
          final Caracter caracter = caracters[index];
          return _HeroesItem(caracter);
        },
        itemCount: caracters.length,
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

class _HeroesItem extends StatelessWidget {

  final Caracter caracter;

  _HeroesItem(this.caracter);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(caracter.name,style: TextStyle(fontSize: 24.0),),
        subtitle: Text(caracter.slogan),
      ),
    );
  }
}

