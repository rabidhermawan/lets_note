import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Database
import 'package:lets_note/models/app_db.dart';

// Route
import 'package:lets_note/pages/note/note_view.dart';

class NoteList extends StatefulWidget {
  const NoteList({super.key});

  @override
  State<NoteList> createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputCtrl = TextEditingController();
  late final AppDatabase _db = context.read<AppDatabase>();
  bool isInitialized = false;

  List<_NoteCard> notes = [];
  int _noteCount = 0;

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
                  _noteCount = notes.length;

                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 10, // Spacing between columns
                          mainAxisSpacing: 10, // Spacing between rows
                        ),
                    // primary: false
                    itemCount: _noteCount,
                    itemBuilder: (context, index) {
                      final note = notes[index];

                      return _NoteCard(rowObject: note);
                    },
                  );
                } else {
                  return Center(child: Text("No notes"));
                }
              },
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _inputCtrl,
                  decoration: InputDecoration(label: Text("Content")),
                  validator: (value) => value == null || value.isEmpty
                      ? "Insert your text"
                      : null,
                  onSaved: (value) => setState(() {
                    _db.insertNote(
                      NoteCompanion(
                        title: Value("Note #$_noteCount"),
                        content: Value(_inputCtrl.text),
                        createdAt: Value(DateTime.now()),
                      ),
                    );
                    _noteCount++;
                  }),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      _formKey.currentState!.reset();
                    }
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _NoteCard extends StatelessWidget {
  final NoteData _rowObject;

  const _NoteCard({required this._rowObject});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                NoteView(rowObject: _rowObject.toCompanion(true)),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: const EdgeInsets.only(top: 8.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.cyan[100],
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            Text(_rowObject.title.toString()),
            Text(_rowObject.content.toString()),
          ],
        ),
      ),
    );
  }
}
