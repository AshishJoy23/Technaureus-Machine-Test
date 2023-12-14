import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/core/core.dart';

class Utils {
  static showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      colorText: Colors.white,
      backgroundColor: kPrimaryColor,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
      borderRadius: 6.0,
    );
  }
}
