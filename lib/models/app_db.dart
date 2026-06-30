import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:lets_note/models/tables/note.dart';
import 'package:lets_note/models/tables/tag.dart';
import 'package:lets_note/models/tables/note_tag.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [Note, Tag, NoteTag])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async => await m.createAll(),
      onUpgrade: (m, from, to) async {
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
        }
        await m.createAll();
      },
    );
  }

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'my_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationDocumentsDirectory,
      ),
    );
  }

  // Create/Update
  Future<int> insertOrUpdateNote(NoteCompanion entry) {
    return into(note).insertOnConflictUpdate(entry);
  }

  Future<int> insertOrUpdateTag(TagCompanion entry) {
    return into(tag).insertOnConflictUpdate(entry);
  }

  // Read
  Future<List<NoteData>> getAllNotes() async => await managers.note.get();
  Stream<List<NoteData>> watchAllNotes() => managers.note.watch();

  Stream<List<NoteData>> watchNotesByCompletion({
    required bool all,
    required bool completion,
  }) {
    if (all) {
      return managers.note.orderBy((o) => o.createdAt.desc()).watch();
    } else {
      return managers.note
          .filter((t) => t.reminderComplete.equals(completion))
          .orderBy((o) => o.createdAt.desc())
          .watch();
    }
  }

  Future<NoteData> getNoteByID(int id) async =>
      await managers.note.filter((t) => t.id.equals(id)).getSingle();

  Future<List<TagData>> getAllTag() async => await managers.tag.get();
  Future<List<Map<String, dynamic>>> getAllTagOfNoteAndAllWithCheck(
    int id,
  ) async {
    final List<Map<String, dynamic>> tagList = [];
    final tagOfNote = await managers.tag
        .withReferences((prefetch) => prefetch(noteTagRefs: true))
        .get();

    for (final (tag, refs) in tagOfNote) {
      //Check if null, if yes then return empty list
      final tags = refs.noteTagRefs.prefetchedData ?? [];
      tagList.add({
        "id": tag.id,
        "name": tag.name,
        "isChecked": tags.any((element) => element.noteId == id),
      });
    }

    return tagList;
  }

  // Update
  // Future updateNote(NoteCompanion entry) async {
  //   await update(note).replace(entry);
  // }

  // Delete
  Future deleteNote(int id) async =>
      await managers.note.filter((t) => t.id.equals(id)).delete();
}
