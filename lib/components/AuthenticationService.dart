import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Future<String> signIn({String email, String password}) async {
    try {} on FirebaseAuthException catch (e) {}
  }

  Future<String> signUp({String email, String password}) {}
}
