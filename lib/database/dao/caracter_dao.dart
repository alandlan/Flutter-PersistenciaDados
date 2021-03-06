import 'package:FlutterPersistenciaDados/models/caracter.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../app_database.dart';

class CaracterDao{

  static const String tableSql = 'CREATE TABLE $_tableName ('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_slogan TEXT, '
      '$_born INTEGER, '
      '$_size INTEGER)';

  static const String _tableName = 'caracter';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _slogan = 'slogan';
  static const String _born = 'born';
  static const String _size = 'size';

  Future<int> save(Caracter caracter) async {
    final Database db = await getDatabase();
    Map<String, dynamic> caracterMap = _toMap(caracter);
    return db.insert(_tableName, caracterMap);
  }

  Map<String, dynamic> _toMap(Caracter caracter) {
    final Map<String, dynamic> caracterMap = Map();
    caracterMap[_name] = caracter.name;
    caracterMap[_slogan] = caracter.slogan;
    caracterMap[_born] = caracter.born;
    caracterMap[_size] = caracter.size;
    return caracterMap;
  }

  Future<List<Caracter>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Caracter> caracters = _toList(result);
    return caracters;
  }

  Future<List<Caracter>> findAllSize(int size) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName,where: '$_size = ?',whereArgs: [size]);
    List<Caracter> caracters = _toList(result);
    return caracters;
  }

  List<Caracter> _toList(List<Map<String, dynamic>> result) {
    final List<Caracter> caracters = List();

    for (Map<String, dynamic> row in result) {
      final Caracter caracter = Caracter(
        row[_id],
        row[_name],
        row[_slogan],
        row[_born],
        row[_size],
      );
      caracters.add(caracter);
    }
    return caracters;
  }

  Future<void> removeAll() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'marvel.db');

    Database database = await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        db.rawQuery('DELETE FROM $_tableName');
      },
    );

    await database.close();
  }
}