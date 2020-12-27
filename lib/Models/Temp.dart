import 'package:sembast/sembast.dart';
import 'package:final_project/Database/app_database.dart';
import 'package:final_project/Models/Note_dao.dart';
//Data Access object (DAO)-> Crud controller

class NoteDao {
  static const String NOTE_STORE_TITLE = 'note';

  final _noteStore = intMapStoreFactory.store(NOTE_STORE_TITLE);

  Future<Database> get _db async => await AppDatabase.instance.database;

  //insert
  Future insert(Notes note) async {
    await _noteStore.add(await _db, note.toMap());
  }

  //update
  Future update(Notes note) async {
    final finder = Finder(filter: Filter.byKey(note.id));
    await _noteStore.update(
      await _db,
      note.toMap(),
      finder: finder,
    );
  }

  Future delete(Notes note) async {
    final finder = Finder(filter: Filter.byKey(note.id));
    await _noteStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future<List<Notes>> getAllSortedByName() async {
    final finder = Finder(sortOrders: [SortOrder('title')]);
    final recordSnapshots = await _noteStore.find(
      await _db,
      finder: finder,
    );
    return recordSnapshots.map((snapshot) {
      final note = Notes.fromMap(snapshot.value);
      note.id = snapshot.key;
      return note;
    }).toList();
  }
}
