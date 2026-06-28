import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:lets_note/models/app_db.dart' show AppDatabase, NoteCompanion;
import 'package:provider/provider.dart';

import 'package:omni_datetime_picker/omni_datetime_picker.dart';

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
  late DateTime? _noteDeadlineDate;
  late bool? _reminderComplete;
  late AppDatabase _db;

  @override
  void didChangeDependencies() {
    _db = context.read<AppDatabase>();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _noteTitleController.text = (widget._rowObject.title == Value.absent()
        ? ""
        : widget._rowObject.title.value)!;
    _noteContentController.text = (widget._rowObject.content == Value.absent()
        ? ""
        : widget._rowObject.content.value)!;
    _noteDeadlineDate = (widget._rowObject.dateReminder == Value.absent()
        ? null
        : widget._rowObject.dateReminder.value);
    _reminderComplete = (widget._rowObject.reminderComplete == Value.absent()
        ? false
        : widget._rowObject.reminderComplete.value);
    super.initState();
  }

  @override
  void dispose() {
    if ((widget._rowObject.title == Value.absent() &&
            widget._rowObject.content == Value.absent()
        // &&
        // _noteTitleController.text != "" &&
        // _noteContentController.text != ""
        ) ||
        (widget._rowObject.title != Value.absent() &&
                (_noteTitleController.text != widget._rowObject.title.value) ||
            widget._rowObject.title != Value.absent() &&
                (_noteContentController.text !=
                    widget._rowObject.content.value))) {
      _db.insertOrUpdateNote(
        widget._rowObject.copyWith(
          title: Value(_noteTitleController.text.toString()),
          content: Value(_noteContentController.text.toString()),
          dateReminder: Value(_noteDeadlineDate),
          reminderComplete: Value(_reminderComplete!),
        ),
      );
      debugPrint("NOTE ADDED!");
    }

    _noteTitleController.dispose();
    _noteContentController.dispose();

    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showOmniDateTimePicker(
      context: context,
      is24HourMode: true,
      isShowSeconds: true,
    );

    setState(() {
      _noteDeadlineDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.settings),
        //     tooltip: 'Go to the next page',
        //     onPressed: () {},
        //   ),
        // ],
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: FilledButton(
          onPressed: () {
            _reminderComplete = _reminderComplete! ? false : true;
            Navigator.pop(context);
          },
          child: Text(
            _reminderComplete == false ? "Mark as done" : "Mark as not done",
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 28.0),
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
            GestureDetector(
              onTap: () {
                _selectDate();
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.fromLTRB(0, 0, 8.0, 0),
                    child: Icon(Icons.calendar_month),
                  ),
                  Text(
                    _noteDeadlineDate == null
                        ? "Add a deadline"
                        : "${_noteDeadlineDate!.day}/${_noteDeadlineDate!.month}/${_noteDeadlineDate!.year} ${_noteDeadlineDate!.hour > 10 ? _noteDeadlineDate!.hour.toString().padLeft(2, '0') : _noteDeadlineDate!.hour}:${_noteDeadlineDate!.minute > 10 ? _noteDeadlineDate!.minute.toString().padLeft(2, '0') : _noteDeadlineDate!.minute}",
                  ),
                ],
              ),
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
