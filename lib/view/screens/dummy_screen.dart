import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: '',
        isHome: true,
      ),
      body: Center(
        child: Text(
          'Dummy Screen',
          style: kHeadlineLarge,
        ),
      ),
    );
  }
}
