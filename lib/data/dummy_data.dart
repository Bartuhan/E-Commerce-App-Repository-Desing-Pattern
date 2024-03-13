import 'package:e_commerce_ui_project/features/shop/models/banner/banner_model.dart';
import 'package:e_commerce_ui_project/features/shop/models/brand/brand_model.dart';
import 'package:e_commerce_ui_project/features/shop/models/category/category_model.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_attribute_model.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_model.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_variation_model.dart';
import 'package:e_commerce_ui_project/routes/routes.dart';
import 'package:e_commerce_ui_project/utils/contants/image_strings.dart';

class TDummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Electronics', image: TImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Clothes', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Animals', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furnitures', image: TImages.furnitureIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: TImages.cosmeticsIcon, isFeatured: true),
    CategoryModel(id: '14', name: 'Jewelry', image: TImages.jeweleryIcon, isFeatured: true),

    // Sub Categories
    // - Sports
    CategoryModel(id: '8', name: 'Sport Shoes', image: TImages.sportIcon, isFeatured: false, parentId: '1'),
    CategoryModel(id: '9', name: 'Track Suites', image: TImages.sportIcon, isFeatured: false, parentId: '1'),
    CategoryModel(id: '10', name: 'Sports Equipments', image: TImages.sportIcon, isFeatured: false, parentId: '1'),

    // - Furnitures
    CategoryModel(id: '11', name: 'Bedroom furniture', image: TImages.furnitureIcon, isFeatured: false, parentId: '5'),
    CategoryModel(id: '12', name: 'Kitchen furniture', image: TImages.furnitureIcon, isFeatured: false, parentId: '5'),
    CategoryModel(id: '13', name: 'Office furniture', image: TImages.furnitureIcon, isFeatured: false, parentId: '5'),

    // - Electronics
    CategoryModel(id: '14', name: 'Laptop', image: TImages.electronicsIcon, isFeatured: false, parentId: '2'),
    CategoryModel(id: '15', name: 'Laptop', image: TImages.electronicsIcon, isFeatured: false, parentId: '2'),
    CategoryModel(id: '16', name: 'Laptop', image: TImages.electronicsIcon, isFeatured: false, parentId: '2'),

    // - Cloth
    CategoryModel(id: '16', name: 'Shirts', image: TImages.clothIcon, isFeatured: false, parentId: '3'),
  ];

  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike Sports Shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike Sports Shoe',
      brand: BrandModel(id: '1', name: 'Nike', image: TImages.nikeLogo, productsCount: 265, isFeatured: true),
      images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productType: 'ProductType.variable',
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description: 'This ,s a Product description for Green Nike Sports Shoe',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      id: '002',
      title: 'Green Puma Sports Shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage4,
      description: 'Green Puma Sports Shoe',
      brand: BrandModel(id: '2', name: 'Puma', image: TImages.pumaLogo, productsCount: 265, isFeatured: true),
      images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productType: 'ProductType.variable',
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description: 'This ,s a Product description for Green Nike Sports Shoe',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      id: '003',
      title: 'Green Reebok Sports Shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage21,
      description: 'Green Reebok Sports Shoe',
      brand: BrandModel(id: '3', name: 'Adidas', image: TImages.adidasLogo, productsCount: 265, isFeatured: true),
      images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productType: 'ProductType.variable',
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description: 'This ,s a Product description for Green Nike Sports Shoe',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
    ),
    ProductModel(
      id: '004',
      title: 'Green Adidas Sports Shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: TImages.productImage23,
      description: 'Green Adidas Sports Shoe',
      brand: BrandModel(id: '4', name: 'Zara', image: TImages.zaraLogo, productsCount: 265, isFeatured: true),
      images: [TImages.productImage1, TImages.productImage23, TImages.productImage21, TImages.productImage9],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productType: 'ProductType.variable',
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 134,
          salePrice: 122.6,
          image: TImages.productImage1,
          description: 'This ,s a Product description for Green Nike Sports Shoe',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
    ),
  ];

  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImages.banner5, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImages.banner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImages.banner8, targetScreen: TRoutes.checkout, active: false),
  ];

  static final List<BrandModel> brands = [
    BrandModel(id: '1', name: 'Nike', image: TImages.nikeLogo, isFeatured: true, productsCount: 10),
    BrandModel(id: '2', name: 'Puma', image: TImages.pumaLogo, isFeatured: true, productsCount: 20),
    BrandModel(id: '3', name: 'Adidas', image: TImages.adidasLogo, isFeatured: true, productsCount: 30),
    BrandModel(id: '4', name: 'Zara', image: TImages.zaraLogo, isFeatured: true, productsCount: 40),
    BrandModel(id: '5', name: 'Jordan', image: TImages.jordanLogo, isFeatured: true, productsCount: 50),
    BrandModel(id: '6', name: 'Apple', image: TImages.appleLogo, isFeatured: true, productsCount: 60),
    BrandModel(id: '7', name: 'Kenwood', image: TImages.kenwoodLogo, isFeatured: true, productsCount: 70),
    BrandModel(id: '8', name: 'Ikea', image: TImages.ikeaLogo, isFeatured: true, productsCount: 80),
    BrandModel(id: '9', name: 'HermanMiller', image: TImages.hermanMillerLogo, isFeatured: true, productsCount: 90),
    BrandModel(id: '10', name: 'TStore', image: TImages.darkAppLogo, isFeatured: true, productsCount: 100),
  ];
}
