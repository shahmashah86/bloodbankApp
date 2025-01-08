import 'package:project1/domain/auth/auth_model/auth_model.dart';
import 'package:project1/domain/auth/auth_repository/auth_repository.dart';
import 'package:project1/package/firebase/firebase_auth.dart';

class AuthRepositoryImplementation implements AuthRepository{
  @override
  Future<void> signInWithGoogle() async{
    await FirebaseAuthService().signinWithGoogle();
  }
   @override
  Future<AuthModel> getUserInfo() async {
    return await FirebaseAuthService().getUserInfo();
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuthService().signOut();
  }


   @override
  Future<void> signInWithEmailAndPass(
      {required String email, required String password}) async {
    await FirebaseAuthService()
        .signInWithEmailAndPass(email: email, password: password);
  }

   @override
  Future<void> createAccountWithEmailAndPass(
      {required String email, required String password}) async {
    await FirebaseAuthService()
        .createAccountWithEmailAndPass(email: email, password: password);
  }
}