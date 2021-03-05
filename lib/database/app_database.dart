import 'package:FlutterPersistenciaDados/models/caracter.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'marvel.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute('CREATE TABLE caracter ('
            'id INTEGER PRIMARY KEY, '
            'name TEXT, '
            'slogan TEXT, '
            'born INTEGER, '
            'size INTEGER)');
      },
      version: 1,
      onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(Caracter caracter) {
  return createDatabase().then((db) {
    final Map<String, dynamic> caracterMap = Map();
    //caracterMap['id'] = caracter.id;
    caracterMap['name'] = caracter.name;
    caracterMap['slogan'] = caracter.slogan;
    caracterMap['born'] = caracter.born;
    caracterMap['size'] = caracter.size;
    return db.insert('caracter', caracterMap);
  });
}

Future<List<Caracter>> findAll() {
  return createDatabase().then((db) {
    return db.query('caracter').then((maps) {
      final List<Caracter> caracters = List();
      for (Map<String, dynamic> map in maps) {
        final Caracter caracter = Caracter(
            map['id'], map['name'], map['slogan'], map['born'], map['size']);
        caracters.add(caracter);
      }
      return caracters;
    });
  });
}

Future<void> removeAll() async {

  debugPrint('passou aqui');

  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'marvel.db');

  Database database = await openDatabase(
    path,
    version: 1,
    onOpen: (db) {
      db.rawQuery('DELETE FROM caracter');
    },
  );

  final int count =  Sqflite
      .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM caracter'));
  debugPrint(count.toString());

  await database.close();
}
