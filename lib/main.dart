import 'package:flutter/material.dart';
import 'package:lets_note/models/app_db.dart';
import 'package:lets_note/pages/notes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Provider<AppDatabase>(
      create: (context) => AppDatabase(),
      dispose: (context, value) => AppDatabase().close(),
      child: MaterialApp(home: Home()),
    ),
  );
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
