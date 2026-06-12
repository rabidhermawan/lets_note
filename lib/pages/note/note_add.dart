import 'package:flutter/material.dart';

class NoteAdd extends StatelessWidget {
  const NoteAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
            decoration: InputDecoration(
              hint: Text("Title"),
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
          ),
          Expanded(
            child: TextField(
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
    );
  }
}
