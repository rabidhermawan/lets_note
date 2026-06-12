import 'package:drift/drift.dart' hide Column;
import 'package:flutter/material.dart';
import 'package:lets_note/models/app_db.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputCtrl = TextEditingController();
  late final AppDatabase _db = context.read<AppDatabase>();
  List<_NoteCard> notes = [];
  int _noteCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: FutureBuilder<List<NoteData>>(
              future: _db.getAllNotes(),
              builder: (context, snapshot) {
                final List<NoteData>? notes = snapshot.data;

                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }

                if (notes != null) {
                  _noteCount = notes.length;

                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];

                      return _NoteCard(
                        id: note.id.toInt(),
                        title: note.title.toString(),
                        content: note.content.toString(),
                      );
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
  final int id;
  final String title;
  final String? content;

  const _NoteCard({
    required this.id,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(top: 8.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.cyan[100],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(children: [Text(title), Text(content!)]),
    );
  }
}
