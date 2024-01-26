import 'package:get_storage/get_storage.dart';

class TLocaleStorage {
  static final TLocaleStorage _instance = TLocaleStorage._internal();

  factory TLocaleStorage() {
    return _instance;
  }

  TLocaleStorage._internal();

  final _storage = GetStorage();

  // Generic Method to Save Data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic Method to Read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic Method to Remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
