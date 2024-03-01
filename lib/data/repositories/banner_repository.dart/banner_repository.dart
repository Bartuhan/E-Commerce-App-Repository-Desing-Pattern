import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_ui_project/data/services/local_storage/firebase_storage_service.dart';
import 'package:e_commerce_ui_project/features/shop/models/banner/banner_model.dart';
import 'package:e_commerce_ui_project/utils/exceptions/index.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all relted current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw TFormatException(e.message);
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while getching Banners.';
    }
  }

  // Updolad Banners to the CloudFireBadr
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      // Upload all the categories along with their Images
      final storage = Get.put(TFirebaseStorageService());

      // loop throught each category
      for (var banner in banners) {
        // get ImageData link From the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // Upload Image and get its url
        final url = await storage.uploadImageData('Banners', file, banner.targetScreen);

        // Assign Url to Category.image attribute
        banner.imageUrl = url;

        // Store Category in FireStore
        await _db.collection('Banners').doc(banner.targetScreen).set(banner.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
