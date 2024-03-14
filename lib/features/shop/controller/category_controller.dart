import 'package:e_commerce_ui_project/commons/widgets/loaders/loader.dart';
import 'package:e_commerce_ui_project/data/dummy_data.dart';
import 'package:e_commerce_ui_project/data/repositories/category/category_repository.dart';
import 'package:e_commerce_ui_project/data/repositories/products/product_repository.dart';
import 'package:e_commerce_ui_project/features/shop/models/category/category_model.dart';
import 'package:e_commerce_ui_project/features/shop/models/product/product_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  // Load category data
  Future<void> fetchCategories() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore , API , etc.)
      final catagories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(catagories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.take(8).toList()
          //allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList(),
          );
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  // Load selected category data

  // Get category or Sub-Category Products
  Future<List<ProductModel>> getCategoryProducts({required String categoryId, int limit = 4}) async {
    // Fetch limited (4) products against each subCategory
    return await ProductRepository.instance.getProductsForCategory(categoryId: categoryId, limit: limit);
  }

  // Upload Category
  Future<void> updloadCategory() async {
    try {
      // Start Loader
      TFullScreenLoader.openLoadingDialog('Uploading Datas...', TImages.docerAnimation);

      // Category Repository
      await _categoryRepository.uploadDummyData(TDummyData.categories);

      // Stop Loader
      TFullScreenLoader.stopLoading();
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Category Upload Error!', message: e.toString());
    }
  }
}
