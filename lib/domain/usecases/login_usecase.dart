import 'package:firebase_auth/firebase_auth.dart';
import 'package:por_maria_app/domain/exceptions/auth_exception.dart';
import 'package:por_maria_app/models/auth_user.dart';
import 'package:por_maria_app/repository/auth_repository.dart';
import 'package:por_maria_app/repository/stream_api_respository.dart';

class LoginUseCase {
  LoginUseCase(this.authRepository, this.streamApiRepository);

  final AuthRepository authRepository;
  final StreamApiRepository streamApiRepository;

  Future<bool> validateLogin() async {
    print('validateLogin');
    final user = await authRepository.getAuthUser();
    print('user: ${user.id}');
    if (user.id != '') {
      final result = await streamApiRepository.connectIfExist(user.id);
      print('despues del connectIfExist $result');
      if (result) {
        print('retorno true');
        return true;
      } else {
        print('retorno false');
        throw AuthException(AuthErrorCode.not_chat_user);
      }
    }
    throw AuthException(AuthErrorCode.not_auth);
  }

  Future<AuthUser> signIn() async {
    return await authRepository.signIn();
  }

  Future<AuthUser> signInWithEmail(String email, String password) async {
    return await authRepository.signInWithEmail(email, password);
  }

  Future<UserCredential> signInAsGuest() async {
    return authRepository.signInAsGuest();
  }
}
