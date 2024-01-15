import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/view/screens/screens.dart';

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget({
    super.key,
    required this.buttonText,
  });

  final String buttonText;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
            EdgeInsets.symmetric(horizontal: size.height * 0.02)),
        backgroundColor: const MaterialStatePropertyAll<Color>(
          kPrimaryColor,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              size.height * 0.03,
            ),
          ),
        ),
      ),
      onPressed: () async {
        Get.to(() => MyAppScreen());
      },
      child: Text(
        buttonText,
        style: kBodyLarge!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
