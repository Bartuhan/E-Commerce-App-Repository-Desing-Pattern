import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  // Empty Helper Function
  static BrandModel empty() => BrandModel(id: "", name: "", image: "");

  // Convert Model to Json stracture so that so that you can store data in firebase
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'productsCount': productsCount,
      'isFeatured': isFeatured,
    };
  }

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON record to the Model
      return BrandModel(
        id: data['id'],
        name: data['name'],
        image: data['image'],
        isFeatured: data['isFeatured'],
        productsCount: data['productsCount'],
      );
    } else {
      return BrandModel.empty();
    }
  }

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['id'],
      name: data['name'],
      image: data['image'],
      isFeatured: data['isFeatured'],
      productsCount: data['productsCount'],
    );
  }
}
