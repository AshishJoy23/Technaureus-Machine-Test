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

  static showAlertBox(String title, String message, VoidCallback onPressed) {
    Get.defaultDialog(
      backgroundColor: kSecondaryColor,
        title: title,
        content: Text(
          message,
          style: kBodyMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel',style: kBodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),),
          ),
          ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(kPrimaryColor)),
              onPressed: onPressed,
              child: Text(
                'Okay',
                style: kBodyMedium!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ]);
  }
}
