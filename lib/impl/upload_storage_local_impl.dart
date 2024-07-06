import 'dart:io';
import 'package:por_maria_app/repository/upload_storage_repository.dart';

class UploadStorageLocalImpl extends UploadStorageRepository {
  @override
  Future<String> uploadPhoto(File file, String path) async {
    return 'https://avatars.githubusercontent.com/u/55883267?v=4';
  }
}
