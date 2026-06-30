import 'package:drift/drift.dart';
import 'package:lets_note/models/tables/note.dart';
import 'package:lets_note/models/tables/tag.dart';

@DataClassName('NoteTag')
class NoteTag extends Table {
  IntColumn get noteId => integer().references(Note, #id)();
  IntColumn get tagId => integer().references(Tag, #id)();

  @override
  Set<Column> get primaryKey => {noteId, tagId};
}
