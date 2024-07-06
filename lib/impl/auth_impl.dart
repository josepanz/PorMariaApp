import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:por_maria_app/models/auth_user.dart';
import 'package:por_maria_app/repository/auth_repository.dart';

class AuthImpl extends AuthRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<AuthUser> getAuthUser() async {
    // _auth.currentUser!.delete();
    final user = _auth.currentUser;
    print('fire user $user');
    if (user != null) {
      print('no null');
      return AuthUser(user.uid);
    }
    return AuthUser('jpanza');
  }

  @override
  Future<UserCredential> signInAsGuest() async {
    final user = _auth.signInAnonymously();
    return user;
  }

  @override
  Future<AuthUser> signIn() async {
    try {
      UserCredential userCredential;
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final OAuthCredential googleAuthCredential =
          GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      userCredential = await _auth.signInWithCredential(googleAuthCredential);
      final user = userCredential.user;
      return AuthUser(user!.uid);
    } catch (e) {
      print(e);
      throw Exception('login error');
    }
  }

  @override
  Future<AuthUser> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = userCredential.user;
      return AuthUser(user!.uid);
    } catch (e) {
      print(e);
      throw Exception('login error');
    }
  }

  @override
  Future<void> logout() async {
    return _auth.signOut();
  }
}
