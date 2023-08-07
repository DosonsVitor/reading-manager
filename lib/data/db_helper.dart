import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  initDB() async {
    String databasesPath = await getDatabasesPath();
    String databaseName = join(databasesPath, 'stand.db');
    var db = await openDatabase(databaseName,
        version: 1,
        onCreate: onCreate
    );
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql = "CREATE TABLE BOOK (id VARCHAR(100) PRIMARY KEY, name varchar(100), author varchar(100), description varchar(1000), pages integer, pages_read integer, status_id integer);";
    await db.execute(sql);

    sql = "CREATE TABLE STATUS (id INTEGER PRIMARY KEY, status_name VARCHAR(20));";
    await db.execute(sql);

    sql = "INSERT INTO STATUS (id, status_name) VALUES (1, 'Lista de Leitura'), (2, 'Lendo'), (3, 'Pausados'), (4, 'Lidos');";
    await db.execute(sql);
  }
}