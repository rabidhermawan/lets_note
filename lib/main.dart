import 'package:flutter/material.dart';
import 'package:lets_note/models/app_db.dart';
import 'package:lets_note/pages/note/note_view.dart' show NoteView;
import 'package:lets_note/route.dart';
import 'package:provider/provider.dart';

// import 'package:lets_note/pages/note/note_list.dart';
import 'package:lets_note/pages/reminder/reminder_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Provider<AppDatabase>(
      create: (context) => AppDatabase(),
      dispose: (context, value) => AppDatabase().close(),
      child: MaterialApp(
        title: "Let's note!",
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const Home(),
      ),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Let's Note!"), centerTitle: true),
      body: ReminderList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NoteView(rowObject: NoteCompanion()),
            ),
          ),
        },
        child: Icon(Icons.fiber_manual_record_rounded),
      ),
    );
  }
}
