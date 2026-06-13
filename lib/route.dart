import 'package:flutter/material.dart';

import 'package:lets_note/pages/note/note_list.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => NoteList());
      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(title: Text("Let's Note!"), centerTitle: true),
        body: const Center(
          child: Text(
            "No route!",
            style: TextStyle(color: Colors.red, fontSize: 48.0),
          ),
        ),
      );
    },
  );
}
