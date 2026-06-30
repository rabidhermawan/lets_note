import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lets_note/models/app_db.dart';
import 'package:lets_note/pages/reminder/reminder_list.dart' show ReminderCard;

class ReminderTag extends StatefulWidget {
  const ReminderTag({super.key});

  @override
  State<ReminderTag> createState() => _ReminderTagState();
}

class _ReminderTagState extends State<ReminderTag> {
  late final AppDatabase _db = context.read<AppDatabase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final TextEditingController tagController =
                  TextEditingController();
              bool doAddTag = await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Add a tag"),
                  content: TextFormField(
                    controller: tagController,
                    decoration: InputDecoration(
                      hint: Text("New tag"),
                      // border: InputBorder.none,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        print("TAG: ${tagController.text}");
                        Navigator.pop(context, true);
                      },
                      child: const Text('OK'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              );
              if (doAddTag) {
                _db.insertOrUpdateTag(
                  TagCompanion(name: Value(tagController.text)),
                );
              }
            },
            icon: Icon(Icons.add_circle_outline_outlined),
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder<List<TagData>>(
          stream: _db.watchAllTag(),
          builder: (context, snapshot) {
            final List<TagData>? tags = snapshot.data;
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (tags != null) {
              return ListView.builder(
                itemCount: tags.length,
                itemBuilder: (context, index) {
                  final tag = tags[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReminderTagNote(tagId: tag.id),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      // color: Colors.amber[colorCodes[index]],
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.label),
                            Text(tag.name),
                            IconButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      "Delete ${tag.name == "" ? "(NO NAME TAG)" : tag.name}",
                                    ),
                                    content: const Text(
                                      "Are you sure you want to delete it?",
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          _db.deleteTag(tag.id);
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
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text("No tags"));
            }
          },
        ),
      ),
    );
  }
}

class ReminderTagNote extends StatefulWidget {
  final int tagId;
  const ReminderTagNote({super.key, required this.tagId});

  @override
  State<ReminderTagNote> createState() => _ReminderTagNoteState();
}

class _ReminderTagNoteState extends State<ReminderTagNote> {
  late final AppDatabase _db = context.read<AppDatabase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder<List<NoteData>>(
          stream: _db.watchNotesByTag(tagId: widget.tagId),
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
                  return ReminderCard(rowObject: note);
                },
              );
            } else {
              return Center(child: Text("No notes"));
            }
          },
        ),
      ),
    );
  }
}
