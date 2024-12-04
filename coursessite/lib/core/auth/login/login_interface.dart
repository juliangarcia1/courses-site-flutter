// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:dartz/dartz.dart';

class CustomUser {
  final String? userName;
  final String? email;
  final String? imageUrl;
  final String? uid;
  final bool? isAnonymous;
  final bool? isEmailVerified;

  CustomUser({
    required this.userName,
    required this.email,
    required this.imageUrl,
    required this.uid,
    required this.isAnonymous,
    required this.isEmailVerified,
  });
}

abstract class Authentication {
  String email;
  String password;

  Authentication({required this.email, required this.password});
  Future<CustomUser?> login();
  Future<CustomUser?> register();
  Future<void> logout();
  bool isUserLoggedIn();
}

enum LoginStatus {
  isLogged,
  isNotLogged,
}