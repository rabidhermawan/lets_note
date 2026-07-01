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
                builder: (context) => StatefulBuilder(
                  builder: (context, setState) => AlertDialog(
                    title: Text("Add a tag"),
                    content: TextFormField(
                      controller: tagController,
                      decoration: InputDecoration(
                        hint: Text("New tag"),
                        // border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        setState(() {});
                      },
                    ),
                    actions: [
                      TextButton(
                        onPressed: tagController.text.trim().isNotEmpty
                            ? () {
                                Navigator.pop(context, true);
                              }
                            : null,
                        child: const Text('OK'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ),
              );
              if (doAddTag) {
                _db.insertOrUpdateTag(
                  TagCompanion(name: Value(tagController.text)),
                );
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${tagController.text} tag created!'),
                    ),
                  );
                }
              }
            },
            icon: Icon(Icons.add_circle_outline_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        child: StreamBuilder<List<TagData>>(
          stream: _db.watchAllTag(),
          builder: (context, snapshot) {
            final List<TagData>? tags = snapshot.data;
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (tags != null && tags.isNotEmpty) {
              return ListView.separated(
                itemCount: tags.length,
                itemBuilder: (context, index) {
                  final tag = tags[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ReminderTagNote(tagId: tag.id, tagName: tag.name),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      // color: Colors.amber[colorCodes[index]],
                      child: Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsetsGeometry.fromLTRB(
                                0,
                                0,
                                8.0,
                                0,
                              ),
                              child: Icon(Icons.label_outline),
                            ),
                            Expanded(
                              child: Text(
                                tag.name,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
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
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
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
  final String tagName;
  const ReminderTagNote({
    super.key,
    required this.tagId,
    required this.tagName,
  });

  @override
  State<ReminderTagNote> createState() => _ReminderTagNoteState();
}

class _ReminderTagNoteState extends State<ReminderTagNote> {
  late final AppDatabase _db = context.read<AppDatabase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.tagName)),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        child: StreamBuilder<List<NoteData>>(
          stream: _db.watchNotesByTag(tagId: widget.tagId),
          builder: (context, snapshot) {
            final List<NoteData>? notes = snapshot.data;
            if (snapshot.connectionState != ConnectionState.active) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            } else if (notes != null && notes.isNotEmpty) {
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
