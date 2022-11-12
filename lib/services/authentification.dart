

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthServices{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _google = GoogleSignIn();
  Future<UserCredential> signInWithGoogle() async{
    //obtenir les flux d'authentification
    final googleUser = await _google.signIn();
    // obtenir les details d'autentification

    final googleAuth = await googleUser!.authentication;
     final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
     );

     return await _auth.signInWithCredential(credential);
  }

  Stream<User?> get user => _auth.authStateChanges();
}