import 'package:final_project/screens/DashboardScreen.dart';
import 'package:final_project/screens/NotepadScreen.dart';
import 'package:flutter/material.dart';
import './screens/NotepadForm.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  //initializes the firebase addon
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      home: AuthenticationWrapper(),
    ),
  );
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
