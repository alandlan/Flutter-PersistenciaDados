import 'package:FlutterPersistenciaDados/models/caracter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'marvel.db');
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

  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'marvel.db');
  //   return openDatabase(
  //     path,
  //     onCreate: (db, version) {
  //       db.execute('CREATE TABLE caracter ('
  //           'id INTEGER PRIMARY KEY, '
  //           'name TEXT, '
  //           'slogan TEXT, '
  //           'born INTEGER, '
  //           'size INTEGER)');
  //     },
  //     version: 1,
  //     onDowngrade: onDatabaseDowngradeDelete,
  //   );
  // });
}

Future<int> save(Caracter caracter) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> caracterMap = Map();
  caracterMap['name'] = caracter.name;
  caracterMap['slogan'] = caracter.slogan;
  caracterMap['born'] = caracter.born;
  caracterMap['size'] = caracter.size;
  return db.insert('caracter', caracterMap);

  // return createDatabase().then((db) {
  //   final Map<String, dynamic> caracterMap = Map();
  //   //caracterMap['id'] = caracter.id;
  //   caracterMap['name'] = caracter.name;
  //   caracterMap['slogan'] = caracter.slogan;
  //   caracterMap['born'] = caracter.born;
  //   caracterMap['size'] = caracter.size;
  //   return db.insert('caracter', caracterMap);
  // });
}

Future<List<Caracter>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('caracter');
  final List<Caracter> caracters = List();

  for (Map<String, dynamic> row in result) {
    final Caracter caracter = Caracter(
        row['id'], row['name'], row['slogan'], row['born'], row['size']);
    caracters.add(caracter);
  }
  return caracters;

  // return createDatabase().then((db) {
  //   return db.query('caracter').then((maps) {
  //     final List<Caracter> caracters = List();
  //     for (Map<String, dynamic> map in maps) {
  //       final Caracter caracter = Caracter(
  //           map['id'], map['name'], map['slogan'], map['born'], map['size']);
  //       caracters.add(caracter);
  //     }
  //     return caracters;
  //   });
  // });
}

Future<void> removeAll() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'marvel.db');

  Database database = await openDatabase(
    path,
    version: 1,
    onOpen: (db) {
      db.rawQuery('DELETE FROM caracter');
    },
  );

  // final int count =  Sqflite
  //     .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM caracter'));

  await database.close();
}
