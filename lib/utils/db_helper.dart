import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:superhero_app/models/super_hero.dart';

class DbHelper {
  final int version = 1;
  final String name = 'superhero.db';
  final String tableName = 'superheros';
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
          'CREATE TABLE $tableName(id TEXT PRIMARY KEY, name TEXT)',
        );
      },
      version: version,
    );
    return db;
  }

  Future inserSuperHero(SuperHero superHero) async {
    await db!.insert(tableName, superHero.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future deleteSuperHero(SuperHero superHero) async {
    await db!.delete(
      tableName,
      where: 'id=?',
      whereArgs: [superHero.id],
    );
  }

  Future<List> fetchSuperHeros() async {
    final maps = await db!.query(tableName);
    List superHeros = maps.map((map) => SuperHero.fromMap(map)).toList();
    return superHeros;
  }

  Future<bool> isFavorite(SuperHero superHero) async {
    final maps =
        await db!.query(tableName, where: 'id=?', whereArgs: [superHero.id]);
    return maps.isNotEmpty;
  }
}
