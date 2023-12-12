import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/core/core.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'NewOrder',
          style: kHeadlineLarge,
        ),
      ),
    );
  }
}
