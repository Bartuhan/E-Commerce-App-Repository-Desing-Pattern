import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_ui_project/data/services/local_storage/firebase_storage_service.dart';
import 'package:e_commerce_ui_project/features/shop/models/brand/brand_model.dart';
import 'package:e_commerce_ui_project/utils/exceptions/index.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      return snapshot.docs.map((brand) => BrandModel.fromSnapshot(brand)).toList();
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

  // Get brands for category

  // Upload dummy data
  Future<void> uploadDummyData(List<BrandModel> banners) async {
    try {
      // Upload all the categories along with their Images
      final storage = Get.put(TFirebaseStorageService());

      // loop throught each category
      for (var banner in banners) {
        // get ImageData link From the local assets
        final file = await storage.getImageDataFromAssets(banner.image);

        // Upload Image and get its url
        final url = await storage.uploadImageData('Brands', file, banner.name);

        // Assign Url to Category.image attribute
        banner.image = url;

        // Store Category in FireStore
        await _db.collection('Brands').doc(banner.id).set(banner.toJson());
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
