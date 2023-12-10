import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/view/core/core.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'My Cart',
      ),
      body: Center(
        child: Text(
          'cart',
          style: kHeadlineSmall,
        ),
      ),
    );
  }
}
