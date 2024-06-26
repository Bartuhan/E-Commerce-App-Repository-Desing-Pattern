// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDpD1-TiERIQpRpyI3lm-c0veDDQYMU8ak',
    appId: '1:435409494550:android:1cd017c6e6e9c249d7cb37',
    messagingSenderId: '435409494550',
    projectId: 'e-commerceapp-d2db3',
    storageBucket: 'e-commerceapp-d2db3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB96kKXkRJSj85FgevPuxIR8a3jlT6Y14o',
    appId: '1:435409494550:ios:4e62a9e4c44e7edcd7cb37',
    messagingSenderId: '435409494550',
    projectId: 'e-commerceapp-d2db3',
    storageBucket: 'e-commerceapp-d2db3.appspot.com',
    androidClientId: '435409494550-fol1rakfo40rtlibmu7bh10ineeln5pf.apps.googleusercontent.com',
    iosClientId: '435409494550-lrm0d61a5bg02caju3qjsccsl4mdggv8.apps.googleusercontent.com',
    iosBundleId: 'com.example.eCommerceUiProject',
  );
}
