import 'package:sembast/sembast.dart';
import 'package:final_project/Database/app_database.dart';
import 'package:final_project/Models/Notes_DB.dart';
//Data Access object -> Crud controller

class NoteDao {
  static const String NOTE_STORE_TITLE = 'note';

  final _noteStore = intMapStoreFactory.store(NOTE_STORE_TITLE);

  Future<Database> get _db async => await AppDatabase.instance.database;

  //insert
  Future insert(Note note) async {
    await _noteStore.add(await _db, note.toMap());
  }

  //update
  Future update(Note note) async {
    final finder = Finder(filter: Filter.byKey(note.id));
    await _noteStore.update(
      await _db,
      note.toMap(),
      finder: finder,
    );
  }
}
