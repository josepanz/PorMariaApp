import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por_maria_app/domain/usecases/login_usecase.dart';

enum SignInState {
  none,
  existing_user,
}

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(
    this._loginUseCase,
  ) : super(SignInState.none);

  final LoginUseCase _loginUseCase;

  void signIn() async {
    try {
      final result = await _loginUseCase.validateLogin();
      if (result) {
        print('existe');
        emit(SignInState.existing_user);
      }
    } catch (ex) {
      final result = await _loginUseCase.signIn();
      // ignore: unnecessary_null_comparison
      if (result != null) {
        emit(SignInState.none);
      }
    }
  }

  void signInWithEmail(String email, String password) async {
    try {
      final result = await _loginUseCase.validateLogin();
      if (result) {
        emit(SignInState.existing_user);
      }
    } catch (ex) {
      final result = await _loginUseCase.signInWithEmail(email, password);
      // ignore: unnecessary_null_comparison
      if (result != null) {
        emit(SignInState.none);
      }
    }
  }

  void signInAsGuest() async {
    try {
      print('como invitado');
      final result = await _loginUseCase.signInAsGuest();
      // ignore: unnecessary_null_comparison
      if (result != null) {
        emit(SignInState.existing_user);
      }
    } catch (ex) {
      final result = await _loginUseCase.signIn();
      // ignore: unnecessary_null_comparison
      if (result != null) {
        emit(SignInState.none);
      }
    }
  }
}
