import 'package:firebase_auth/firebase_auth.dart';
import 'package:por_maria_app/models/auth_user.dart';
import 'package:por_maria_app/repository/auth_repository.dart';

class AuthLocalImpl extends AuthRepository {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<AuthUser> getAuthUser() async {
    await Future.delayed(const Duration(seconds: 2));
    return AuthUser('jpanza');
  }

  @override
  Future<AuthUser> signIn() async {
    await Future.delayed(const Duration(seconds: 2));
    return AuthUser('jpanza');
  }

  @override
  Future<AuthUser> signInWithEmail(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return AuthUser('jpanza');
  }

  @override
  Future<UserCredential> signInAsGuest() async {
    final user = _auth.signInAnonymously();
    return user;
  }

  @override
  Future<void> logout() async {
    return;
  }
}
