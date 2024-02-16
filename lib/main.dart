import 'package:e_commerce_ui_project/app.dart';
import 'package:e_commerce_ui_project/data/repositories/authentication/authentication_repository.dart';
import 'package:e_commerce_ui_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  // Widgets Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Flutter Native Splash Start
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // GetX Local Storage
  await GetStorage.init();

  // Firebase Initialize
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (value) => Get.put(AuthenticationRepository()),
  );

  runApp(const App());
}
