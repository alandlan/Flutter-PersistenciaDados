import 'package:FlutterPersistenciaDados/database/dao/caracter_dao.dart';
import 'package:FlutterPersistenciaDados/models/caracter.dart';
import 'package:FlutterPersistenciaDados/screens/villain_form.dart';
import 'package:flutter/material.dart';

class VillainsList extends StatefulWidget {

  final CaracterDao _dao = CaracterDao();

  @override
  _VillainsListState createState() => _VillainsListState();
}

class _VillainsListState extends State<VillainsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Villains'),
      ),
      body: FutureBuilder<List<Caracter>>(
          initialData: List(),
          future:
          Future.delayed(Duration(seconds: 1)).then((value) => widget._dao.findAllSize(1)),
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
                    return _VillainItem(caracter);
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
              builder: (context) => VillainForm(),
            ),
          ).then((value) => setState(() {}));
        },
        child: Icon(Icons.adb_outlined),
      ),
    );
  }
}

class _VillainItem extends StatelessWidget {
  final Caracter caracter;

  _VillainItem(this.caracter);

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
