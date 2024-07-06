import 'dart:io';
import 'package:por_maria_app/repository/stream_api_respository.dart';
import 'package:por_maria_app/repository/upload_storage_repository.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';
import 'package:uuid/uuid.dart';

class CreateGroupInput {
  CreateGroupInput(
      {required this.imageFile, required this.name, required this.members});
  final File imageFile;
  final String name;
  final List<String> members;
}

class CreateGroupUseCase {
  CreateGroupUseCase(
    this._streamApiRepository,
    this._uploadStorageRepository,
  );

  final UploadStorageRepository _uploadStorageRepository;
  final StreamApiRepository _streamApiRepository;

  Future<Channel> createGroup(CreateGroupInput input) async {
    final channelId = Uuid().v4();
    String image =
        'https://ui-avatars.com/api/?background=random&color=random&name=jpanza&rounded=true&size=100';
    // ignore: unnecessary_null_comparison
    if (input.imageFile != null) {
      image = await _uploadStorageRepository.uploadPhoto(
          input.imageFile, 'channels/$channelId');
    }
    final channel = await _streamApiRepository.createGroupChat(
      channelId,
      input.name,
      input.members,
      image: image,
    );
    return channel;
  }
}
