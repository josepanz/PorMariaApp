import 'package:firebase_auth/firebase_auth.dart';
import 'package:por_maria_app/models/auth_user.dart';

abstract class AuthRepository {
  Future<AuthUser> getAuthUser();
  Future<AuthUser> signIn();
  Future<AuthUser> signInWithEmail(String email, String password);
  Future<UserCredential> signInAsGuest();
  Future<void> logout();
}
