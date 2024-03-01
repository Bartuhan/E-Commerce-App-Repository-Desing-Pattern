import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_ui_project/features/shop/models/brand/brand_model.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_attribute_model.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.stock,
    required this.price,
    required this.title,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.date,
    this.brand,
    this.images,
    this.categoryId,
    this.isFeatured,
    this.description,
    this.salePrice = 0.0,
    this.productAttributes,
    this.productVariations,
  });

  static ProductModel empty() => ProductModel(id: '', stock: 0, price: 0, title: '', thumbnail: '', productType: '');

  toJson() {
    return {
      'sku': sku,
      'title': title,
      'stock': stock,
      'price': price,
      'images': images ?? [],
      'thumbnail': thumbnail,
      'salePrice': salePrice,
      'isFeatured': isFeatured,
      'categoryId': categoryId,
      'brand': brand!.toJson(),
      'description': description,
      'productType': productType,
      'productAttributes': productAttributes != null ? productAttributes!.map((e) => e.toJson()).toList() : [],
      'productVariations': productVariations != null ? productVariations!.map((e) => e.toJson()).toList() : [],
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;

    return ProductModel(
      id: document.id,
      sku: data['sku'],
      title: data['title'],
      stock: data['stock'] ?? 0,
      isFeatured: data['isFeatured'] ?? false,
      price: double.parse((data['price'] ?? 0).toString()),
      salePrice: double.parse((data['salePrice'] ?? 0).toString()),
      thumbnail: data['thumbnail'] ?? '',
      categoryId: data['categoryId'],
      description: data['description'] ?? '',
      productType: data['productionType'] ?? '',
      brand: BrandModel.fromJson(data['brand']),
      productAttributes: (data['productAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['productVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }
}
