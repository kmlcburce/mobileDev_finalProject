//Open the database for the app to access it
import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

//open databse
class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();
  static AppDatabase get instance => _singleton;
  Completer<Database> _dbOpenCompleter;

  AppDatabase._();

  Future<Database> get database async {
    if (_dbOpenCompleter = null) {
      _dbOpenCompleter = Completer();
      _openDatabase();
    }
    return _dbOpenCompleter.future;
  }

  Future _openDatabase() async {
    //get directory
    final appDocumentDir = await getApplicationDocumentsDirectory();
    //path to specific form
    final dbPath = join(appDocumentDir.path, 'NotesDB.db');
    final database = await databaseFactoryIo.openDatabase((dbPath));
    //execute Completer's future
    _dbOpenCompleter.complete(database);
  }
}
