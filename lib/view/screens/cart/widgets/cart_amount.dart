import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/blocs/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/view/screens/new_order/order_confirm.dart';

class CartAmountWidget extends StatelessWidget {
  CartAmountWidget({
    super.key,
  });

  // final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.27,
      width: size.width,
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.03,
        horizontal: size.height * 0.02,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
        borderRadius: BorderRadius.circular(size.height * 0.02),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
                style: kBodyMedium!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return Text(
                      '\$${state.cart.totalPrice}.00',
                      style: kBodyMedium!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black87),
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
              // Obx(
              //   ()=> Text(
              //     '\$${cartController.eachCartList.value.totalPrice}.00',
              //     style: kBodyMedium!.copyWith(
              //         fontWeight: FontWeight.bold,
              //         color: Colors.black87),
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tax',
                style: kBodyMedium!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              Text(
                '\$50.00',
                style: kBodyMedium!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          const Divider(
            thickness: 1,
          ),
          SizedBox(
            height: size.height * 0.005,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: kTitleLarge!.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return Text(
                      '\$${state.cart.totalPrice + 50}.00',
                      style: kTitleLarge!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black87),
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
              // Obx(
              //   () => Text(
              //     '\$${cartController.eachCartList.value.totalPrice + 50}.00',
              //     style: kTitleLarge!.copyWith(
              //         fontWeight: FontWeight.bold, color: Colors.black87),
              //   ),
              // ),
            ],
          ),
          const Spacer(),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) { 
              if (state is CartLoaded) {
                return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ElevatedButton(
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
                              BlocProvider.of<CartBloc>(context).add(OrderConfirmed(cart: state.cart));
                              // await cartController
                              //     .confirmOrder(cartController.eachCartList.value);
                              Get.to(() => const OrderConfirmScreen());
                            },
                            child: Text(
                              'Order',
                              style: kBodyMedium!.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Expanded(
                          child: ElevatedButton(
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
                              BlocProvider.of<CartBloc>(context).add(OrderConfirmed(cart: state.cart));
                              // await cartController
                              //     .confirmOrder(cartController.eachCartList.value);
                              Get.to(() => const OrderConfirmScreen());
                            },
                            child: Text(
                              'Order & Deliver',
                              style: kBodyMedium!.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
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
        ],
      ),
    );
  }
}
