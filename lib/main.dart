import 'package:flutter/material.dart';
import 'package:lets_note/pages/notes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Let's Note!"), centerTitle: true),
      body: NotesPage(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   child: Icon(Icons.fiber_manual_record_rounded),
      // ),
    );
  }
}
