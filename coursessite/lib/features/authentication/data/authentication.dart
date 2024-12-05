import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:fluttr_facebook_auth/flutter_facebook_auth.dart';

Future<UserCredential> signInWithEmail(String email, String password) async {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  return userCredential;
}


// Future<UserCredential> signInWithGoogle() async {
//   GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
//   GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//   return userCredential;
// }

// Future<UserCredential> signInWithFacebook() async {
//   AccessToken accessToken = await FacebookAuth.instance.login();
//   final FacebookAuthCredential facebookAuthCredential = 
//     FacebookAuthProvider.credential(accessToken.token);

//   UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
//   return userCredential;
// }