import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THelperFunctions {
  static void showSnackBar({required String message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert({required String title, required String message}) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Tamam'),
            )
          ],
        );
      },
    );
  }

  static void navigateToScreen({required Widget screen}) {
    Navigator.push(Get.context!, MaterialPageRoute(builder: (context) => screen));
  }

  static String truncateText({required String text, required int maxLenght}) {
    if (text.length <= maxLenght) {
      return text;
    } else {
      return '${text.substring(0, maxLenght)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }
}
