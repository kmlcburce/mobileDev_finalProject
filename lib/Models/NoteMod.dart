import 'package:flutter/material.dart';
import 'Notes_DB.dart';
//import 'package:random_string/random_string.dart' as random_string;

class NoteMod extends ChangeNotifier {
  List<Notes> notes = [];
  Notes activeNotes;

  Future<List<Notes>> getAllNotesByName() async {
    // Finder allows for filtering / sorting
    //final finder = Finder(sortOrders: [SortOrder('title')]);

    /*Get the data using our finder for sorting
    final noteSnapshots = await _noteStore.find(
      await _db,
      finder: finder,
    );
    */

    /* print("Notes: " + noteSnapshots.toString()); // json of note object
    List<Notes> allNotes = noteSnapshots.map((snapshot) {
      final note = Notes.fromMap(snapshot.value);
      return note;
    }).toList();
    */

    // print("note list: " + noteSnapshots.toString());

    // Update UI
    //notes = allNotes;
    notifyListeners();

    return notes;
  }

  Future<void> saveActiveNoteEdits() async {
    // print("Saving Active note, id: " + activeNotes.id.toString());
    // print("Saving Active note, name: " + activeNotes.name.toString());
    // Create a finder to isolate this note for update, by key (id).

    //final finder = Finder(filter: Filter.byKey(activeNotes.id));
    // Perform the update converting, converting the note to map, and updating the value at key identified by the finder
    //await _noteStore.update(await _db, activeNotes.toMap(), finder: finder);
    // Refresh notes list for UI
    await getAllNotesByName();
    return;
  }

  Future<int> createNewNote(Map<String, String> note) async {
    int _id;

    Notes newNote =
        Notes(id: _id, title: note['title'], message: note['message']);

    notes = await getAllNotesByName();

    return _id;
  }

  /// Set Active note
  Future<void> setActiveNote(int id) async {
    //activeNotes = await getNote(id);
    //    print("Active note Set, ID: " + activeNotes.id.toString());

    notifyListeners();
    return;
  }

  Future<void> clearActiveNote() async {
    activeNotes = null;

    notifyListeners();
    return;
  }

  Future<void> deleteNote(int id) async {
    // Delete this note from the db
    //await _noteStore.record(id).delete(await _db);

    // Refresh notes list for UI
    await getAllNotesByName();

    return;
  }

  int get notesLength {
    return notes.length;
  }

  List<Notes> get notesList {
    return notes;
  }

  Notes get getActiveNotes {
    return activeNotes;
  }
}
