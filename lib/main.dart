import 'package:final_project/components/AuthenticationService.dart';
import 'package:final_project/screens/DashboardScreen.dart';
import 'package:final_project/screens/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  //initializes the firebase addon
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
<<<<<<< HEAD
    final Firebaseuser = context.watch<User>();
    if (Firebaseuser != null) {
=======
    final firebaseUser = context.watch<User>();
    
    if (firebaseUser != null) {
>>>>>>> 6374beb6ff2e53e9d4338400ab4d5bfc96eae7c8
      return DashboardScreen();
    }
    return LoginScreen();
  }
}
