import 'package:flutter/material.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class OrderConfirmScreen extends StatelessWidget {
  const OrderConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomAnimation(
            animationUrl: 'assets/animation/order_confirm.json',
            message: 'Order has been confirmed.',
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          const MainButtonWidget(
            buttonText: 'Back To Home',
          ),
        ],
      ),
    );
  }
}
