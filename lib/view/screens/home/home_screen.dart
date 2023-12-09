import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/view/core/core.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'home',
          style: kHeadlineLarge,
        ),
      ),
    );
  }
}
