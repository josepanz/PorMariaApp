import 'dart:io';
import 'package:por_maria_app/models/chat_user.dart';
import 'package:por_maria_app/repository/auth_repository.dart';
import 'package:por_maria_app/repository/stream_api_respository.dart';
import 'package:por_maria_app/repository/upload_storage_repository.dart';

class ProfileInput {
  ProfileInput({required this.imageFile, required this.name});
  final File imageFile;
  final String name;
}

class ProfileSignInUseCase {
  ProfileSignInUseCase(this._authRepository, this._uploadStorageRepository,
      this._streamApiRepository);

  final AuthRepository _authRepository;
  final UploadStorageRepository _uploadStorageRepository;
  final StreamApiRepository _streamApiRepository;

  Future<void> verify(ProfileInput input) async {
    final auth = await _authRepository.getAuthUser();
    final token = await _streamApiRepository.getToken(auth.id);
    String image = "";
    // if (input.imageFile != null) {
    image = await _uploadStorageRepository.uploadPhoto(
        input.imageFile, 'users/${auth.id}');
    // }
    await _streamApiRepository.connectUser(
        ChatUser(name: input.name, id: auth.id, image: image), token);
  }
}
