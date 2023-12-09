import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/view/core/core.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'cart',
          style: kHeadlineLarge,
        ),
      ),
    );
  }
}
