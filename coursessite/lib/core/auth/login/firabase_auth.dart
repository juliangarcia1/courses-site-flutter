import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_interface.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

class FirebaseAuthentication implements Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static final FirebaseAuthentication _instance = FirebaseAuthentication._internal();
  FirebaseAuthentication._internal();

  @override
  late String email;
  @override
  late String password;

  factory FirebaseAuthentication(String email, String password) {
    _instance.email = email;
    _instance.password = password;
    return _instance;
  }


  @override
  Future<CustomUser?> login() async {
    final User? user;
    try {
      final UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      return CustomUser(
          userName: user?.displayName,
          email: user?.email,
          imageUrl: user?.photoURL,
          uid: user?.uid,
          isAnonymous: user?.isAnonymous,
          isEmailVerified: user?.emailVerified);
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<CustomUser?> register() async {
    final User? user;
    try {
      final UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
      return CustomUser(
        userName: user?.displayName,
        email: user?.email,
        imageUrl: user?.photoURL,
        uid: user?.uid,
        isAnonymous: user?.isAnonymous,
        isEmailVerified: user?.emailVerified,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  @override
  bool isUserLoggedIn() {
    return _firebaseAuth.currentUser != null;
  }
}
