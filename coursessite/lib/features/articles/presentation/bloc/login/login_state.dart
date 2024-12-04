part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String isLogged;
  final String userName;
  final String imageUrl;
  final String uid;
  final bool isAnonymous;
  final bool isEmailVerified;
  LoginState(
      {this.email = '',
      this.isLogged = '',
      this.userName = '',
      this.imageUrl = '',
      this.uid = '',
      this.isAnonymous = false,
      this.isEmailVerified = false});
}


// part of 'login_bloc.dart';

// @immutable
// abstract class LoginState {}

// class LoginInitial extends LoginState {}
