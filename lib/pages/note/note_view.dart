import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:lets_note/models/app_db.dart' show AppDatabase, NoteCompanion;
import 'package:provider/provider.dart';

class NoteView extends StatefulWidget {
  final NoteCompanion _rowObject;

  const NoteView({super.key, required this._rowObject});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteContentController = TextEditingController();

  late AppDatabase _db;

  @override
  void didChangeDependencies() {
    _db = context.read<AppDatabase>();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _noteTitleController.text =
        widget._rowObject.title.toString() == Value.absent().toString()
        ? ""
        : widget._rowObject.title.toString();
    _noteContentController.text =
        widget._rowObject.content.toString() == Value.absent().toString()
        ? ""
        : widget._rowObject.content.toString();

    super.initState();
  }

  @override
  void dispose() {
    if ((_noteTitleController.text != widget._rowObject.title.toString()) ||
        (_noteContentController.text != widget._rowObject.content.toString())) {
      _db.insertOrUpdateNote(
        widget._rowObject.copyWith(
          title: Value(_noteTitleController.text.toString()),
          content: Value(_noteContentController.text.toString()),
        ),
      );

      debugPrint("NOTE ADDED!");
    }

    _noteTitleController.dispose();
    _noteContentController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 28.0),
        child: Column(
          children: [
            // Title
            TextFormField(
              controller: _noteTitleController,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
              decoration: InputDecoration(
                hint: Text("Title"),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
            ),
            Expanded(
              child: TextFormField(
                controller: _noteContentController,
                decoration: InputDecoration(
                  hint: Text("Content"),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
