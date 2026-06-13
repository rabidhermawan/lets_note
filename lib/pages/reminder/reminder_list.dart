import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Database
import 'package:lets_note/models/app_db.dart';

// Route
import 'package:lets_note/pages/note/note_view.dart';

class ReminderList extends StatefulWidget {
  const ReminderList({super.key});

  @override
  State<ReminderList> createState() => _ReminderListState();
}

class _ReminderListState extends State<ReminderList> {
  late final AppDatabase _db = context.read<AppDatabase>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: StreamBuilder<List<NoteData>>(
              stream: _db.watchAllNotes(),
              builder: (context, snapshot) {
                final List<NoteData>? notes = snapshot.data;
                if (snapshot.connectionState != ConnectionState.active) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (notes != null) {
                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return _ReminderCard(rowObject: note);
                    },
                  );
                } else {
                  return Center(child: Text("No notes"));
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _ReminderCard extends StatefulWidget {
  final NoteData _rowObject;

  const _ReminderCard({required this._rowObject});

  @override
  State<_ReminderCard> createState() => _ReminderCardState();
}

class _ReminderCardState extends State<_ReminderCard> {
  bool _foo = false;

  @override
  void initState() {
    _foo = widget._rowObject.reminderComplete;
    super.initState();
  }

  late final AppDatabase _db = context.read<AppDatabase>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      margin: const EdgeInsets.only(top: 8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.cyan[100],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: [
          Checkbox(
            checkColor: Colors.white,
            value: _foo,
            onChanged: (value) {
              setState(() {
                final rowCompanion = widget._rowObject.toCompanion(true);
                _db.insertOrUpdateNote(
                  rowCompanion.copyWith(reminderComplete: Value(value!)),
                );
                _foo = value;
              });
            },
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteView(
                      rowObject: widget._rowObject.toCompanion(true),
                    ),
                  ),
                );
              },
              child: Text(
                widget._rowObject.title.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  wordSpacing: -1,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    "Delete ${widget._rowObject.title == "" ? "Reminder" : widget._rowObject.title}",
                  ),
                  content: const Text("Are you sure you want to delete it?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        _db.deleteNote(widget._rowObject.id.toInt());
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}
