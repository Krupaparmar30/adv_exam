import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  FirebaseService._();
  static FirebaseService firebaseService=FirebaseService._();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signIn(String email, String pass) async {
    UserCredential userCredential =
    await _auth.signInWithEmailAndPassword(email: email, password: pass);
    return userCredential.user;
  }

  Future<User?> signUp(String email, String pass) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: pass);
    return userCredential.user;
  }

  Future<void> signOut()
  async {
    await  _auth.signOut();
  }

  User? getCurrunt()
  {
    User? user=_auth.currentUser;
    if(user!=null)
    {
      log("email:${user.email}");
    }
    return user;
  }
}
