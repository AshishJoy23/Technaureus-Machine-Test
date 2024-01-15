import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/blocs/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/model/cart/cart_model.dart';
import 'package:technaureus_machine_test/model/models.dart';
import 'package:technaureus_machine_test/view/screens/screens.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Your Cart',
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded) {
            return state.cart.cartProducts.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomAnimation(
                        animationUrl: 'assets/animation/empty_cart.json',
                        message: 'You cart is empty\nAdd what you love..',
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const MainButtonWidget(
                        buttonText: 'Back To Home',
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.06,
                          vertical: size.width * 0.02),
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: state.cart.cartProducts.length,
                            itemBuilder: (context, index) {
                              return CartItemCardWidget(
                                //cart: cart,
                                index: index,
                                productId: state.cart.cartProducts.keys.elementAt(index),
                                isLast: index == state.cart.cartProducts.length-1,
                              );
                            },
                          ),
                          CartAmountWidget(),
                        ],
                      ),
                    ),
                  );
          } else {
            return const Icon(
              Icons.error,
              size: 36,
              color: Colors.red,
            );
          }
        },
      ),

      // body: Obx(
      //   () => cartController.eachCartList.value.cartProducts.isEmpty
      //       ? Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             const CustomAnimation(
      //               animationUrl: 'assets/animation/empty_cart.json',
      //               message: 'You cart is empty\nAdd what you love..',
      //             ),
      //             SizedBox(
      //               height: size.height * 0.01,
      //             ),
      //             const MainButtonWidget(
      //               buttonText: 'Back To Home',
      //             ),
      //           ],
      //         )
      //       : SingleChildScrollView(
      //           child: Padding(
      //             padding: EdgeInsets.symmetric(
      //                 horizontal: size.width * 0.06,
      //                 vertical: size.width * 0.02),
      //             child: Column(
      //               children: [
      //                 ListView.builder(
      //                   physics: const NeverScrollableScrollPhysics(),
      //                   padding: EdgeInsets.zero,
      //                   shrinkWrap: true,
      //                   itemCount: cartController
      //                       .eachCartList.value.cartProducts.length,
      //                   itemBuilder: (context, index) {
      //                     return CartItemCardWidget(
      //                       //cart: cart,
      //                       index: index,
      //                     );
      //                   },
      //                 ),
      //                 CartAmountWidget(),
      //               ],
      //             ),
      //           ),
      //         ),
      // ),
      bottomSheet: const CustomBottomNavWidget(),
    );
  }
}
