import 'package:por_maria_app/repository/auth_repository.dart';
import 'package:por_maria_app/repository/stream_api_respository.dart';

class LogoutUseCase {
  LogoutUseCase(this.streamApiRepository, this.authRepository);

  final StreamApiRepository streamApiRepository;
  final AuthRepository authRepository;

  Future<void> logout() async {
    await streamApiRepository.logout();
    await authRepository.logout();
  }
}
