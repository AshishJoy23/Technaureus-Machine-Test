import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/cart_controller.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductModel product;
  final int? customerId;
  ProductCardWidget({
    super.key,
    required this.product,
    this.customerId,
  });

  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // CartModel customerCart = cartController.checkCartExistsOrNot(customerId!);

    return InkWell(
      onTap: () async {
        var returnProduct =
            await productController.getOneProduct(product.id) as ProductModel;
        log(returnProduct.toString());
        log(returnProduct.name);
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
                  Container(
                    width: size.width * 0.14,
                    height: size.height * 0.035,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Obx(() {
                      var cart = cartController.allCartLists.firstWhere(
                          (element) => element.customerId == customerId);
                      
                      
                      log('checking bad state');
                      log(cart.customerId.toString());
                      log(cart.totalPrice.toString());
                      log(cart.cartProducts.length.toString());
                      log(cart.cartProducts[product].toString());
                      log(cart.cartProducts.values.elementAt(0).toString());
                      log(cart.cartProducts.keys.elementAt(0).toString());
                      var sample = cart.cartProducts.keys.elementAt(0);
                      log(sample.name);
                      log(cart.cartProducts.containsKey(product).toString());
                      return cart.cartProducts.containsKey(product)
                          ? Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (customerId != null) {
                                        if (cart.cartProducts[product] == 1) {
                                          cartController.deleteCartProduct(
                                              customerId!, product);
                                        } else {
                                          cartController.removeProductFromCart(
                                              customerId!, product);
                                        }
                                      }
                                      Utils.showSnackBar('Product Removed',
                                          'Product removed from the cart');
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: kSecondaryColor,
                                      size: 14,
                                    ),
                                  ),
                                  Text(
                                    cart.cartProducts[product].toString(),
                                    style: kBodySmall!.copyWith(
                                      color: kSecondaryColor,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (customerId != null) {
                                        cartController.addProductToCart(
                                            customerId!, product);
                                      }
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
                            )
                          : Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (customerId != null) {
                                        cartController.addProductToCart(
                                            customerId!, product);
                                      }
                                      Utils.showSnackBar('Product Added',
                                          'Product added to the cart');
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
                            );
                    }),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
