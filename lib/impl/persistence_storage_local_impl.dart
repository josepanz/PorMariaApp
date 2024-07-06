import 'package:por_maria_app/repository/persistent_storage_repository.dart';

class PersistentStorageLocalImpl extends PersistentStorageRepository {
  @override
  Future<bool> isDarkMode() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return false;
  }

  @override
  Future<void> updateDarkMode(bool isDarkMode) async {
    await Future.delayed(const Duration(milliseconds: 50));
    return;
  }
}
