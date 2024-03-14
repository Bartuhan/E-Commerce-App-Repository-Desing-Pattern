import 'package:e_commerce_ui_project/commons/widgets/loaders/loader.dart';
import 'package:e_commerce_ui_project/data/dummy_data.dart';
import 'package:e_commerce_ui_project/data/repositories/brand/brand_repository.dart';
import 'package:e_commerce_ui_project/data/repositories/products/product_repository.dart';
import 'package:e_commerce_ui_project/features/shop/models/brand/brand_model.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_model.dart';
import 'package:e_commerce_ui_project/utils/contants/image_strings.dart';
import 'package:e_commerce_ui_project/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final RxBool isLoading = true.obs;
  final RxList<BrandModel> featureBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  // Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      // Show loader while loading brands
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featureBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Get Brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      return await brandRepository.getBrandsForCategory(categoryId);
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Get Brands Specific Products from your data source
  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      return await ProductRepository.instance.getProductsForBrands(brandId: brandId, limit: limit);
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  // Upload Dummy data
  Future<void> uploadData() async {
    try {
      // Show loader
      TFullScreenLoader.openLoadingDialog('Uploading Brands...', TImages.docerAnimation);

      // Upload data
      await brandRepository.uploadDummyData(TDummyData.brands);
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
  }
}
