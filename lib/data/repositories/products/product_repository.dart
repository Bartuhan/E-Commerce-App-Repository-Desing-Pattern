import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_ui_project/data/services/local_storage/firebase_storage_service.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_model.dart';
import 'package:e_commerce_ui_project/utils/exceptions/index.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/contants/index.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  // FireStore instance for database interactions
  final _db = FirebaseFirestore.instance;

  // Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapsot = await _db.collection('Products').where('isFeatured', isEqualTo: true).limit(4).get();
      return snapsot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get All featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapsot = await _db.collection('Products').where('isFeatured', isEqualTo: true).get();
      return snapsot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get limited featured products
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      return querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Get Products For Brands
  Future<List<ProductModel>> getProductsForBrands({required brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1 //
          ? await _db.collection('Products').where('brand.id', isEqualTo: brandId).get()
          : await _db.collection('Products').where('brand.id', isEqualTo: brandId).limit(limit).get();
      return querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Upload dummy data to the Cloud Firebase
  Future<void> uplaodDummyData(List<ProductModel> products) async {
    try {
      // Upload all the pşroducts along with their images
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its url
        final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its url
            final url = await storage.uploadImageData('Products/Images', assetImage, image);

            // Assign URL to product.thumnail attribute
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(variation.image);

            // Upload image amd get its url
            final url = await storage.uploadImageData('Product/Images', assetImage, variation.image);

            // Assign url to variation.image attribute
            variation.image = url;
          }
        }

        // Store Product in FireStore
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
