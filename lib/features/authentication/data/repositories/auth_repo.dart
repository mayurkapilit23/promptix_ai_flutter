import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> login(String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  Future<User?> register(String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential.user;
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  Stream<User?> get authStateChanges =>
      _firebaseAuth.authStateChanges();
}