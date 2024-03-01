import 'package:e_commerce_ui_project/commons/widgets/loaders/loader.dart';
import 'package:e_commerce_ui_project/data/dummy_data.dart';
import 'package:e_commerce_ui_project/data/repositories/banner_repository.dart/banner_repository.dart';
import 'package:e_commerce_ui_project/features/shop/models/banner/banner_model.dart';
import 'package:e_commerce_ui_project/utils/contants/index.dart';
import 'package:e_commerce_ui_project/utils/popups/full_screen_loader.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  // Variables
  final carousalCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  // Fetch banner
  Future<void> fetchBanner() async {
    try {
      // Show loader while loading categories
      isLoading.value = true;

      // Get all banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  // Upload banner
  Future<void> uploadData() async {
    try {
      // Show Loader
      TFullScreenLoader.openLoadingDialog('Upload Datas....', TImages.docerAnimation);

      // Upload Data
      await BannerRepository.instance.uploadDummyData(TDummyData.banners);

      // Cloase Loader
      TFullScreenLoader.stopLoading();
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
