import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/blocs/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/controller/cart_controller.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  final int? customerId;
  final int? index;
  ProductCardWidget({
    super.key,
    required this.product,
    this.customerId,
    this.index,
  });

  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () async {
        ProductModel? returnProduct =
            await productController.getOneProduct(product.id);
        log(returnProduct.toString());
        log(returnProduct!.name);
        log(returnProduct.id.toString());
        if (customerId != null) {
          log('<<<********enteered>>>');
          log(cartController.eachCartList.value.cartProducts
              .containsKey(product.id)
              .toString());
          ;
        }
      },
      child: Material(
        elevation: 4.0,
        borderRadius: BorderRadius.circular(size.width * 0.05),
        child: Container(
          padding: EdgeInsets.all(size.width * 0.015),
          width: size.width * 0.45,
          height: size.height * 0.1,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(size.width * 0.05),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                "$kImageBaseUrl${product.image}",
                fit: BoxFit.cover,
                width: size.width * 0.3,
                height: size.width * 0.18,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: Transform.scale(
                        scale: 0.5,
                        child: const CircularProgressIndicator(
                          strokeWidth: 3,
                          backgroundColor: Colors.white,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          style: kBodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$${product.price}/-',
                          style: kBodySmall!.copyWith(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                    child: const VerticalDivider(
                      thickness: 0.5,
                      color: Colors.black38,
                    ),
                  ),
                  customerId != null
                      ? BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            if (state is CartLoaded) {
                              return Container(
                                width: size.width * 0.14,
                                height: size.height * 0.035,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: state.cart.cartProducts
                                        .containsKey(product.id)
                                    // child: cartController.eachCartList.value.cartProducts
                                    //         .containsKey(product.id)
                                    ? Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (customerId != null) {
                                                  if (state.cart.cartProducts[
                                                          product.id] ==
                                                      1) {
                                                    BlocProvider.of<CartBloc>(
                                                            context)
                                                        .add(CartProductDeleted(
                                                            productId:
                                                                product.id));
                                                    // cartController.deleteCartProduct(
                                                    //     customerId!, product.id);
                                                  } else {
                                                    BlocProvider.of<CartBloc>(
                                                            context)
                                                        .add(CartProductRemoved(
                                                            productId:
                                                                product.id));
                                                  }
                                                  // if (cartController
                                                  //         .eachCartList
                                                  //         .value
                                                  //         .cartProducts[product.id] ==
                                                  //     1) {
                                                  //   cartController.deleteCartProduct(
                                                  //       customerId!, product.id);
                                                  // } else {
                                                  //   cartController
                                                  //       .removeProductFromCart(
                                                  //           customerId!, product.id);
                                                  // }
                                                  Utils.showSnackBar(
                                                      'Product Removed',
                                                      'Product removed from the cart');
                                                }
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: kSecondaryColor,
                                                size: 14,
                                              ),
                                            ),
                                            Text(
                                              state
                                                  .cart.cartProducts[product.id]
                                                  .toString(),
                                              style: kBodySmall!.copyWith(
                                                color: kSecondaryColor,
                                              ),
                                            ),
                                            // Obx(
                                            //   () => Text(

                                            //     cartController.eachCartList.value
                                            //         .cartProducts[product.id]
                                            //         .toString(),
                                            //     style: kBodySmall!.copyWith(
                                            //       color: kSecondaryColor,
                                            //     ),
                                            //   ),
                                            // ),
                                            InkWell(
                                              onTap: () {
                                                if (customerId != null) {
                                                  BlocProvider.of<CartBloc>(
                                                          context)
                                                      .add(CartProductAdded(
                                                          productId:
                                                              product.id));
                                                  // cartController.addProductToCart(
                                                  //     customerId!, product.id);
                                                  Utils.showSnackBar(
                                                      'Product Added',
                                                      'Product added to the cart');
                                                }
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: kSecondaryColor,
                                                size: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (customerId != null) {
                                                  BlocProvider.of<CartBloc>(
                                                          context)
                                                      .add(CartProductAdded(
                                                          productId:
                                                              product.id));
                                                  // cartController.addProductToCart(
                                                  //     customerId!, product.id);
                                                  Utils.showSnackBar(
                                                      'Product Added',
                                                      'Product added to the cart');
                                                }
                                              },
                                              child: Text(
                                                'Add',
                                                style: kBodySmall!.copyWith(
                                                  color: kSecondaryColor,
                                                ),
                                              ),
                                            ),
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
                        )
                      : Container(
                          width: size.width * 0.14,
                          height: size.height * 0.035,
                          decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (customerId != null) {
                                      BlocProvider.of<CartBloc>(context).add(
                                          CartProductAdded(
                                              productId: product.id));
                                      // cartController.addProductToCart(
                                      //     customerId!, product.id);
                                      Utils.showSnackBar('Product Added',
                                          'Product added to the cart');
                                    }
                                  },
                                  child: Text(
                                    'Add',
                                    style: kBodySmall!.copyWith(
                                      color: kSecondaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                  // Obx(
                  //   () => Container(
                  //     width: size.width * 0.14,
                  //     height: size.height * 0.035,
                  //     decoration: BoxDecoration(
                  //         color: kPrimaryColor,
                  //         borderRadius: BorderRadius.circular(5)),
                  //     child: cartController.eachCartList.value.cartProducts
                  //             .containsKey(product.id)
                  //         ? Center(
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceEvenly,
                  //               children: [
                  //                 InkWell(
                  //                   onTap: () {
                  //                     if (customerId != null) {
                  //                       if (cartController.eachCartList.value
                  //                               .cartProducts[product.id] ==
                  //                           1) {
                  //                         cartController.deleteCartProduct(
                  //                             customerId!, product.id);
                  //                       } else {
                  //                         cartController.removeProductFromCart(
                  //                             customerId!, product.id);
                  //                       }
                  //                     }
                  //                     Utils.showSnackBar('Product Removed',
                  //                         'Product removed from the cart');
                  //                   },
                  //                   child: const Icon(
                  //                     Icons.remove,
                  //                     color: kSecondaryColor,
                  //                     size: 14,
                  //                   ),
                  //                 ),
                  //                 Obx(
                  //                   () => Text(
                  //                     cartController.eachCartList.value
                  //                         .cartProducts[product.id]
                  //                         .toString(),
                  //                     style: kBodySmall!.copyWith(
                  //                       color: kSecondaryColor,
                  //                     ),
                  //                   ),
                  //                 ),
                  //                 InkWell(
                  //                   onTap: () {
                  //                     if (customerId != null) {
                  //                       cartController.addProductToCart(
                  //                           customerId!, product.id);
                  //                     }
                  //                     Utils.showSnackBar('Product Added',
                  //                         'Product added to the cart');
                  //                   },
                  //                   child: const Icon(
                  //                     Icons.add,
                  //                     color: kSecondaryColor,
                  //                     size: 14,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           )
                  //         : Center(
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceEvenly,
                  //               children: [
                  //                 InkWell(
                  //                   onTap: () {
                  //                     if (customerId != null) {
                  //                       cartController.addProductToCart(
                  //                           customerId!, product.id);
                  //                     }
                  //                     Utils.showSnackBar('Product Added',
                  //                         'Product added to the cart');
                  //                   },
                  //                   child: Text(
                  //                     'Add',
                  //                     style: kBodySmall!.copyWith(
                  //                       color: kSecondaryColor,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
