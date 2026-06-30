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

  Future<void> insertOrUpdateNoteTag(
    NoteCompanion noteEntry,
    List<NoteTagCompanion> tagEntry,
  ) async {
    await managers.note.create((note) => noteEntry, mode: InsertMode.replace);
    await managers.noteTag
        .filter((f) => f.noteId.id(noteEntry.id.value))
        .delete();
    await managers.noteTag.bulkCreate(
      (noteTag) => tagEntry,
      mode: InsertMode.replace,
    );
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

  // Assisted with AI too because Drift documentation is confusing
  Stream<List<NoteData>> watchNotesByTag({required int tagId}) {
    return customSelect(
      //Turns out Drift uses snake case. BRUUHHH
      'SELECT * FROM note WHERE id IN (SELECT note_id FROM note_tag WHERE tag_id = ?)',
      variables: [Variable(tagId)],
      readsFrom: {note, noteTag},
    ).map((row) => note.map(row.data)).watch();
  }

  Future<NoteData> getNoteByID(int id) async =>
      await managers.note.filter((t) => t.id.equals(id)).getSingle();

  Future<List<TagData>> getAllTag() async => await managers.tag.get();
  Stream<List<TagData>> watchAllTag() => managers.tag.watch();

  // Assisted with AI
  Future<List<Map<String, dynamic>>> getAllTagWithCheck(int id) async {
    final query = select(tag).join([
      leftOuterJoin(
        noteTag,
        noteTag.tagId.equalsExp(tag.id) & noteTag.noteId.equals(id),
      ),
    ]);

    final results = await query.get();

    return results.map((row) {
      final tagRows = row.readTable(tag);
      final noteTagRows = row.readTableOrNull(noteTag);

      return {
        "id": tagRows.id,
        "name": tagRows.name,
        "isChecked": noteTagRows != null,
      };
    }).toList();
  }

  // Update
  // Future updateNote(NoteCompanion entry) async {
  //   await update(note).replace(entry);
  // }

  // Delete
  Future<void> deleteNote(int id) async {
    // Delete tags and relation in the junction table
    await managers.noteTag.filter((t) => t.noteId.id(id)).delete();
    await managers.note.filter((t) => t.id.equals(id)).delete();
  }

  Future<void> deleteTag(int id) async {
    // Delete tags and relation in the junction table
    await managers.noteTag.filter((t) => t.tagId.id(id)).delete();
    await managers.tag.filter((t) => t.id.equals(id)).delete();
  }
}
