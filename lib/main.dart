import 'package:e_commerce_ui_project/app.dart';
import 'package:e_commerce_ui_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
//import 'package:get/get.dart';

Future<void> main() async {
  // Widgets Binding
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Firebase Initialize
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  // Flutter Native Splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const App());
  FlutterNativeSplash.remove();
}
