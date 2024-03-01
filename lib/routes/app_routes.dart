import 'package:e_commerce_ui_project/features/authentication/screens/login/login_screen.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/signup/signup.dart';
import 'package:e_commerce_ui_project/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/adress/address.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/profile/profile.dart';
import 'package:e_commerce_ui_project/features/personalization/screens/settings/settings.dart';
import 'package:e_commerce_ui_project/features/shop/screens/cart/cart_screen.dart';
import 'package:e_commerce_ui_project/features/shop/screens/checkout/checkout.dart';
import 'package:e_commerce_ui_project/features/shop/screens/home/home_screen.dart';
import 'package:e_commerce_ui_project/features/shop/screens/order/order.dart';
import 'package:e_commerce_ui_project/features/shop/screens/product_reviews/product_review.dart';
import 'package:e_commerce_ui_project/features/shop/screens/store/store_screen.dart';
import 'package:e_commerce_ui_project/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    //GetPage(name: TRoutes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnboardingScreen()),
  ];
}
