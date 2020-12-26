import 'package:final_project/components/AuthenticationService.dart';
import 'package:final_project/screens/DashboardScreen.dart';
import 'package:final_project/screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/NotepadForm.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  //initializes the firebase addon
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement

    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  const AuthenticationWrapper({
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) {
    final FirebaseUser = context.watch<User>();

    if (FirebaseUser != null) {
      return DashboardScreen();
    }

    return LoginScreen();
  }
}
