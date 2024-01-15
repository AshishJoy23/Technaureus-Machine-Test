import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:technaureus_machine_test/core/core.dart';

class CustomAnimation extends StatelessWidget {
  final String animationUrl;
  final String message;
  const CustomAnimation({
    super.key,
    required this.animationUrl,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animationUrl,
            repeat: false,
            width: size.width * 0.65,
            height: size.height * 0.3,
            fit: BoxFit.contain,
          ),
          Text(
            message,
            style: kTitleMedium,
          ),
        ],
      ),
    );
  }
}
