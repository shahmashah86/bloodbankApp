import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project1/domain/auth/auth_model/auth_model.dart';

class FirebaseAuthService {
  FirebaseAuthService._();
   static final _instance=FirebaseAuthService._();
   factory FirebaseAuthService()=>_instance;

 Future<void> signinWithGoogle() async {
    
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
     
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
     

      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);
      UserCredential? user =
          await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw "Error in code";
    }
  }
  Future<AuthModel> getUserInfo() async {
    AuthModel usermodel = const AuthModel();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      log("inside user");
      usermodel = AuthModel(
        
        userName: user.displayName,
          phoneNumber: user.phoneNumber,
          photoURL: user.photoURL,
          email: user.email);
    }

    return usermodel;
  }
   Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

    Future<void> signInWithEmailAndPass({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createAccountWithEmailAndPass({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }


}