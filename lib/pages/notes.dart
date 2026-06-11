import 'package:flutter/material.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _inputCtrl = TextEditingController();
  List<_NotesCard> notes = [];
  int _counter = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [for (var x in notes) x],
          ),
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextFormField(
                  controller: _inputCtrl,
                  decoration: InputDecoration(label: Text("Content")),
                  validator: (value) => value == null || value.isEmpty
                      ? "Insert your text"
                      : null,
                  onSaved: (value) => setState(() {
                    notes.add(
                      _NotesCard(
                        title: "Note #$_counter",
                        content: _inputCtrl.text,
                      ),
                    );
                    _counter += 1;
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

class _NotesCard extends StatelessWidget {
  final String title;
  final String content;

  const _NotesCard({required this.title, required this.content});

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
      child: Column(children: [Text(title), Text(content)]),
    );
  }
}
