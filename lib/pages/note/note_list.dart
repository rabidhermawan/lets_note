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

                // Jadi ternyata disini kalo ngecompare connectionState.done
                // gak bakal selesai2 soalnya stream expect the connection to be
                // active, not done
                if (snapshot.connectionState != ConnectionState.active) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (notes != null) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 10, // Spacing between columns
                          mainAxisSpacing: 10, // Spacing between rows
                        ),
                    // primary: false
                    itemCount: notes.length,
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
