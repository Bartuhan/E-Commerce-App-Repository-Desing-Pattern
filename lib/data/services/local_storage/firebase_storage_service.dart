import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageService extends GetxController {
  static TFirebaseStorageService get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  // Upload Local Assets from IDE
  // Return a Uint8List containning image data
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      return byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    } catch (e) {
      throw 'Error loading image data: $e';
    }
  }

  // Upload Image using ImageData on clouad Firebase Storage
  // Returns the download URL of the uploaded image.
  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      return await ref.getDownloadURL();
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FireBaseException : ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception : ${e.message}';
      } else {
        throw 'Something went wrong. Please try again';
      }
    }
  }

  // Upload Image on Cloud Firebase Storage
  // Returns the download Url of the uploaded image,
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      //
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      return await ref.getDownloadURL();
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FireBaseException : ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception : ${e.message}';
      } else {
        throw 'Something went wrong. Please try again';
      }
    }
  }
}
