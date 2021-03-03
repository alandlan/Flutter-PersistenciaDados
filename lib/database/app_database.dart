import 'package:FlutterPersistenciaDados/models/caracter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase(){
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath,'marvel.db');
    return openDatabase(path, onCreate: (db, version){
      db.execute('CREATE TABLE heroes ('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'slogan TEXT, '
          'born INTEGER)');
      db.execute('CREATE TABLE villains ('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'slogan TEXT, '
          'born INTEGER)');
    },version: 1);
  });
}

Future<int> saveHeroes(Caracter caracter){
  return createDatabase().then((db){
    final Map<String,dynamic> caracterMap = Map();
    //caracterMap['id'] = caracter.id;
    caracterMap['name'] = caracter.name;
    caracterMap['slogan'] = caracter.slogan;
    caracterMap['born'] = caracter.born;
    return db.insert('heroes', caracterMap);
  });
}

Future<int> saveVillains(Caracter caracter){
  return createDatabase().then((db){
    final Map<String,dynamic> caracterMap = Map();
    //caracterMap['id'] = caracter.id;
    caracterMap['name'] = caracter.name;
    caracterMap['slogan'] = caracter.slogan;
    caracterMap['born'] = caracter.born;
    return db.insert('villains', caracterMap);
  });
}

Future<List<Caracter>> findAllHeroes(){
  return createDatabase().then((db){
    return db.query('heroes').then((maps){
      final List<Caracter> caracters = List();
      for(Map<String, dynamic> map in maps){
        final Caracter caracter = Caracter(map['id'], map['name'], map['slogan'], map['born']);
        caracters.add(caracter);
      }
      return caracters;
    });
  });
}

Future<List<Caracter>> findAllVillains(){
  return createDatabase().then((db){
    return db.query('villains').then((maps){
      final List<Caracter> caracters = List();
      for(Map<String, dynamic> map in maps){
        final Caracter caracter = Caracter(map['id'], map['name'], map['slogan'], map['born']);
        caracters.add(caracter);
      }
      return caracters;
    });
  });
}