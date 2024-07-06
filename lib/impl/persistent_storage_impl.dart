import 'package:por_maria_app/repository/persistent_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _isDarkMode = 'isDarkMode';

class PersistentStorageImpl extends PersistentStorageRepository {
  @override
  Future<bool> isDarkMode() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool(_isDarkMode) ?? false;
  }

  @override
  Future<bool> updateDarkMode(bool isDarkMode) async {
    final preference = await SharedPreferences.getInstance();
    return await preference.setBool(_isDarkMode, isDarkMode);
  }
}
