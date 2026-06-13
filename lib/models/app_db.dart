import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:lets_note/models/tables/note.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [Note])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationDocumentsDirectory,
      ),
    );
  }

  // Create
  Future<int> insertNote(NoteCompanion entry) async =>
      await into(note).insert(entry);

  // Read
  Future<List<NoteData>> getAllNotes() async => await select(note).get();
  Stream<List<NoteData>> watchAllNotes() => select(note).watch();

  Future<NoteData> getByID(int id) async =>
      await (select(note)..where((t) => t.id.equals(id))).getSingle();

  // Update
  Future updateNote(NoteCompanion entry) async {
    await update(note).replace(entry);
  }

  // Delete
  Future deleteNote(int id) async =>
      await (delete(note)..where((t) => t.id.equals(id))).go();
}
