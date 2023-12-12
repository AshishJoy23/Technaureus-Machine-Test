import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.black45,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 6.0,
    );
  }
}
