import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class DatabaseSembast {
  static final DatabaseSembast _singleton = DatabaseSembast._internal();

  static DatabaseSembast get instance => _singleton;

  late Database _database;

  DatabaseSembast._internal();

  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;    
  }

  Future<Database> _initDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dbPath = "${appDocDir.path}/app_sb_form_online_db.db";
    DatabaseFactory dbFactory = databaseFactoryIo;
    return await dbFactory.openDatabase(dbPath);
  
  }

}
