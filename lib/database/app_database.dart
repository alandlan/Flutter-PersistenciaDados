import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dao/caracter_dao.dart';

//sem asyn await
// Future<Database> createDatabase() {
//   return getDatabasesPath().then((dbPath) {
//     final String path = join(dbPath, 'marvel.db');
//     return openDatabase(
//       path,
//       onCreate: (db, version) {
//         db.execute('CREATE TABLE caracter ('
//             'id INTEGER PRIMARY KEY, '
//             'name TEXT, '
//             'slogan TEXT, '
//             'born INTEGER, '
//             'size INTEGER)');
//       },
//       version: 1,
//       onDowngrade: onDatabaseDowngradeDelete,
//     );
//   });
// }
//
// Future<int> save(Caracter caracter) {
//   return createDatabase().then((db) {
//     final Map<String, dynamic> caracterMap = Map();
//     //caracterMap['id'] = caracter.id;
//     caracterMap['name'] = caracter.name;
//     caracterMap['slogan'] = caracter.slogan;
//     caracterMap['born'] = caracter.born;
//     caracterMap['size'] = caracter.size;
//     return db.insert('caracter', caracterMap);
//   });
// }
//
// Future<List<Caracter>> findAll() {
//   return createDatabase().then((db) {
//     return db.query('caracter').then((maps) {
//       final List<Caracter> caracters = List();
//       for (Map<String, dynamic> map in maps) {
//         final Caracter caracter = Caracter(
//             map['id'], map['name'], map['slogan'], map['born'], map['size']);
//         caracters.add(caracter);
//       }
//       return caracters;
//     });
//   });
// }
//
// Future<void> removeAll() async {
//   var databasesPath = await getDatabasesPath();
//   String path = join(databasesPath, 'marvel.db');
//
//   Database database = await openDatabase(
//     path,
//     version: 1,
//     onOpen: (db) {
//       db.rawQuery('DELETE FROM caracter');
//     },
//   );
//
//   await database.close();
// }

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'marvel.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(CaracterDao.tableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}


