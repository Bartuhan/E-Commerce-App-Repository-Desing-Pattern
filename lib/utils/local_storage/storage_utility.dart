import 'package:get_storage/get_storage.dart';

class TLocaleStorage {
  late final GetStorage _storage;

  // Singleton instance
  static TLocaleStorage? _instance;

  TLocaleStorage._internal();

  factory TLocaleStorage.instance() {
    _instance ??= TLocaleStorage._internal();
    return _instance!;
  }

  static Future<void> init(String buckedName) async {
    await GetStorage.init(buckedName);
    _instance = TLocaleStorage._internal();
    _instance!._storage = GetStorage(buckedName);
  }

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
