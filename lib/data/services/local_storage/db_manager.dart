import 'package:get_storage/get_storage.dart';

class DbManager {
  static final storage = GetStorage();

  //
  static void add(String key, dynamic value) {
    storage.write(key, value);
  }

  static dynamic read(String key) {
    return storage.read(key);
  }

  static void addIfNull(String key, dynamic value) {
    storage.writeIfNull(key, value);
  }
}
