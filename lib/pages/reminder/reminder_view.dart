import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:lets_note/models/app_db.dart' show AppDatabase, NoteCompanion;
import 'package:lets_note/models/tables/tag.dart';
import 'package:provider/provider.dart';

import 'package:omni_datetime_picker/omni_datetime_picker.dart';

class ReminderView extends StatefulWidget {
  final NoteCompanion _rowObject;
  final bool isNew;

  const ReminderView({
    super.key,
    required this._rowObject,
    required this.isNew,
  });

  @override
  State<ReminderView> createState() => _ReminderViewState();
}

class _ReminderViewState extends State<ReminderView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _noteTitleController = TextEditingController();
  final TextEditingController _noteContentController = TextEditingController();
  late DateTime? _noteDeadlineDate;
  late bool? _reminderComplete;
  bool _toDelete = false;
  bool _hasTag = true;

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
    if (_toDelete) {
      _db.deleteNote(widget._rowObject.id.value);
    } else if (!(widget.isNew &&
        _noteTitleController.text.toString() == "" &&
        _noteContentController.text.toString() == "" &&
        _noteDeadlineDate == null)) {
      _db.insertOrUpdateNote(
        widget._rowObject.copyWith(
          title: Value(_noteTitleController.text.toString()),
          content: Value(_noteContentController.text.toString()),
          dateReminder: Value(_noteDeadlineDate),
          reminderComplete: Value(_reminderComplete!),
        ),
      );
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
      if (pickedDate != null) {
        _noteDeadlineDate = pickedDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.label),
            tooltip: 'Add tag',
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Tag'),
                  content: Column(children: [Text("Squeaky")]),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
          ),
          if (!widget.isNew)
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      "Delete ${widget._rowObject.title.value == "" ? "Reminder" : widget._rowObject.title.value}",
                    ),
                    content: const Text("Are you sure you want to delete it?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _toDelete = true;
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
          IconButton(
            icon: _noteDeadlineDate == null
                ? Icon(Icons.notifications_off_outlined)
                : Icon(Icons.notifications_outlined),
            tooltip: 'Toggle the deadline',
            onPressed: () {
              _selectDate();
            },
          ),
        ],
        centerTitle: true,
      ),
      bottomNavigationBar: !widget.isNew
          ? BottomAppBar(
              color: Colors.transparent,
              elevation: 0,
              child: FilledButton(
                onPressed: () {
                  _reminderComplete = _reminderComplete! ? false : true;
                  Navigator.pop(context);
                },
                child: Text(
                  _reminderComplete == false
                      ? "Mark as done"
                      : "Mark as not done",
                ),
              ),
            )
          : null,
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.fromLTRB(0, 0, 8.0, 0),
                  child: Icon(Icons.notifications),
                ),
                Text(
                  _noteDeadlineDate == null
                      ? "No deadline"
                      : "${_noteDeadlineDate!.day}/${_noteDeadlineDate!.month}/${_noteDeadlineDate!.year} ${_noteDeadlineDate!.hour < 10 ? _noteDeadlineDate!.hour.toString().padLeft(2, '0') : _noteDeadlineDate!.hour}:${_noteDeadlineDate!.minute < 10 ? _noteDeadlineDate!.minute.toString().padLeft(2, '0') : _noteDeadlineDate!.minute}",
                ),
              ],
            ),
            Row(
              children: _hasTag
                  ? [
                      Chip(
                        label: const Text('Aaron Burr'),
                        shape: StadiumBorder(),
                      ),
                    ]
                  : [GestureDetector(onTap: () {}, child: Text("+ Add a tag"))],
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

// class _TagChips extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector();
//   }
// }

// class _TagModifyAlert extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog();
//   }
// }

// class TagChooseDialog extends StatefulWidget {
//   const TagChooseDialog({super.key});

//   @override
//   State<TagChooseDialog> createState() => _TagChooseDialogState();
// }

// class _TagChooseDialogState extends State<TagChooseDialog> {
//   late final AppDatabase _db;

//   @override
//   void didChangeDependencies() {
//     _db = context.read<AppDatabase>();
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog();
//   }
// }
