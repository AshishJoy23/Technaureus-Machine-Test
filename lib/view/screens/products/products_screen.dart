import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/view/core/core.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Products',
          style: kHeadlineLarge,
        ),
      ),
    );
  }
}