import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/blocs/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';

class CartItemCardWidget extends StatelessWidget {
  final int index;
  final int productId;
  final bool isLast;
  const CartItemCardWidget({
    super.key,
    required this.index,
    required this.productId,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final ProductController productController = Get.put(ProductController());
    var size = MediaQuery.of(context).size;

    // int productId =
    //     cartController.eachCartList.value.cartProducts.keys.elementAt(index);
    ProductModel product = productController.productsList
        .firstWhere((element) => element.id == productId);
    return SizedBox(
      height: size.height * 0.09,
      width: size.width,
      child: Column(
        children: [
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.name} | 550g',
                      style: kBodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${product.price}/-',
                      style: kBodyMedium!.copyWith(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return Row(
                      children: [
                        Container(
                          width: size.width * 0.19,
                          height: size.height * 0.035,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () async {
                                  if (state.cart.cartProducts[productId] == 1) {
                                    Utils.showAlertBox('Delete Product',
                                        'Are you sure? Do you want to delete it.',
                                        () async {
                                      Get.back();
                                      BlocProvider.of<CartBloc>(context).add(
                                          CartProductDeleted(
                                              productId: product.id));
                                      Utils.showSnackBar('Product Deleted',
                                          'Product deleted from the cart');
                                    });
                                  } else {
                                    BlocProvider.of<CartBloc>(context).add(
                                        CartProductRemoved(
                                            productId: product.id));
                                    Utils.showSnackBar('Product Removed',
                                        'Product removed from the cart');
                                  }
                                },
                                // onTap: () async {
                                //   if (cartController.eachCartList.value
                                //           .cartProducts[productId] ==
                                //       1) {
                                //     Utils.showAlertBox('Delete Product',
                                //         'Are you sure? Do you want to delete it.',
                                //         () async {
                                //       Get.back();
                                //       await cartController.deleteCartProduct(
                                //           cartController
                                //               .eachCartList.value.customerId,
                                //           product.id);
                                //       Utils.showSnackBar('Product Deleted',
                                //           'Product deleted from the cart');
                                //     });
                                //   } else {
                                //     await cartController.removeProductFromCart(
                                //         cartController.eachCartList.value.customerId,
                                //         product.id);
                                //     Utils.showSnackBar('Product Removed',
                                //         'Product removed from the cart');
                                //   }
                                // },
                                child: const Icon(
                                  Icons.remove,
                                  color: kSecondaryColor,
                                  size: 14,
                                ),
                              ),
                              Text(
                                '${state.cart.cartProducts[productId]}',
                                style: kBodyMedium!.copyWith(
                                  color: kSecondaryColor,
                                ),
                              ),
                              // Obx(
                              //   () => Text(
                              //     '${cartController.eachCartList.value.cartProducts[productId]}',
                              //     style: kBodyMedium!.copyWith(
                              //       color: kSecondaryColor,
                              //     ),
                              //   ),
                              // ),
                              InkWell(
                                onTap: () async {
                                  // await cartController.addProductToCart(
                                  //     cartController
                                  //         .eachCartList.value.customerId,
                                  //     product.id);
                                  BlocProvider.of<CartBloc>(context).add(
                                      CartProductAdded(productId: product.id));
                                  Utils.showSnackBar('Product Added',
                                      'Product added to the cart');
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: kSecondaryColor,
                                  size: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        InkWell(
                          onTap: () async {
                            Utils.showAlertBox('Delete Product',
                                'Are you sure? Do you want to delete it.',
                                () async {
                              Get.back();
                              // await cartController.deleteCartProduct(
                              //     cartController.eachCartList.value.customerId,
                              //     product.id);
                              BlocProvider.of<CartBloc>(context).add(
                                  CartProductDeleted(productId: product.id));
                              Utils.showSnackBar('Product Deleted',
                                  'Product deleted from the cart');
                            });
                          },
                          child: const Icon(
                            CupertinoIcons.delete_solid,
                            color: Colors.red,
                            size: 24,
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
          const Spacer(),
          //index == cartController.eachCartList.value.cartProducts.length - 1
          isLast
              ? const SizedBox(
                  height: 1.0,
                )
              : const Divider(
                  thickness: 1.0,
                ),
        ],
      ),
    );
  }
}
