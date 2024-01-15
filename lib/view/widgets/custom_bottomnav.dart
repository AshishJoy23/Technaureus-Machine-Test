import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/blocs/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/cart/cart_model.dart';
import 'package:technaureus_machine_test/view/screens/cart/cart_screen.dart';

class CustomBottomNavWidget extends StatelessWidget {
  const CustomBottomNavWidget({
    super.key,
    this.customerId,
  });

  final int? customerId;

  @override
  Widget build(BuildContext context) {
    //int? cartLength;
    //CartModel? cart;
    final CartController cartController = Get.put(CartController());
    if (customerId != null) {
      // cart = cartController.allCartLists
      //     .firstWhere((element) => element.customerId == customerId);
      //cartLength = cart.cartProducts.length;
    }
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.07,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.home,
                color: kPrimaryColor,
                size: 28,
              ),
              Text(
                'Home',
                style: kBodySmall!.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.post_add,
                color: kPrimaryColor,
                size: 28,
              ),
              Text(
                'New Order',
                style: kBodySmall!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 8),
              ),
            ],
          ),
          // Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         InkWell(
          //           // onTap: customerId != null?() => Get.to(CartScreen(cart: cart!)):(){},
          //           onTap: customerId != null
          //               ? () => Get.to(() => const CartScreen())
          //               : () {},
          //           child: Center(
          //             child: Stack(
          //               children: [
          //                 const Icon(
          //                   Icons.shopping_cart_outlined,
          //                   color: kPrimaryColor,
          //                   size: 28,
          //                 ),
          //                 customerId != null
          //                     ? cartController.eachCartList.value.cartProducts
          //                             .isNotEmpty
          //                         ? Positioned(
          //                             top: 0,
          //                             right: 0,
          //                             child: CircleAvatar(
          //                               radius: 6,
          //                               backgroundColor: kPrimaryColor,
          //                               child: Text(
          //                                 //cartLength != null ? cartLength.toString() : '2',
          //                                 cartController.eachCartList.value
          //                                     .cartProducts.length
          //                                     .toString(),
          //                                 style: kBodySmall!.copyWith(
          //                                   color: Colors.white,
          //                                   fontSize: 8,
          //                                 ),
          //                               ),
          //                             ),
          //                           )
          //                         : const SizedBox()
          //                     : const SizedBox(),
          //               ],
          //             ),
          //           ),
          //         ),
          //         Text(
          //           'Cart',
          //           style: kBodySmall!
          //               .copyWith(fontWeight: FontWeight.w600, fontSize: 8),
          //         ),
          //       ],
          //     )
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                // onTap: customerId != null?() => Get.to(CartScreen(cart: cart!)):(){},
                onTap: customerId != null
                    ? () => Get.to(() => const CartScreen())
                    : () {},
                child: Center(
                  child: Stack(
                    children: [
                      const Icon(
                        Icons.shopping_cart_outlined,
                        color: kPrimaryColor,
                        size: 28,
                      ),
                      customerId != null
                          ? BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                if (state is CartLoaded) {
                                  return state.cart.cartProducts.isNotEmpty
                                      ? Positioned(
                                          top: 0,
                                          right: 0,
                                          child: CircleAvatar(
                                            radius: 6,
                                            backgroundColor: kPrimaryColor,
                                            child: Text(
                                              //cartLength != null ? cartLength.toString() : '2',
                                              state.cart.cartProducts.length
                                                  .toString(),
                                              style: kBodySmall!.copyWith(
                                                color: Colors.white,
                                                fontSize: 8,
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox();
                                } else {
                                  return const Icon(
                                    Icons.error,
                                    size: 36,
                                    color: Colors.red,
                                  );
                                }
                              },
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
              Text(
                'Cart',
                style: kBodySmall!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 8),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.subdirectory_arrow_left,
                color: kPrimaryColor,
                size: 28,
              ),
              Text(
                'Return Order',
                style: kBodySmall!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 8),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.group_outlined,
                color: kPrimaryColor,
                size: 28,
              ),
              Text(
                'Customers',
                style: kBodySmall!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 8),
              ),
            ],
          )
        ],
      ),
    );
  }
}
