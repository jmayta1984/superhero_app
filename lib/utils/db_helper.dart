import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  final int version = 1;
  final String name = 'superhero.db';
  Database? db;

  static final DbHelper _dbHelper = DbHelper._interal();

  DbHelper._interal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database?> openDb() async {
    db ??= await openDatabase(
      join(await getDatabasesPath(), name),
      onCreate: (database, version) {
        database.execute(
          'CREATE TABLE superheros(id TEXT PRIMARY KEY, name TEXT)',
        );
      },
      version: version,
    );
    return db;
  }
}
