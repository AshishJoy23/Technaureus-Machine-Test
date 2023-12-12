import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
  ProductsScreen({super.key});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Products',
      ),
      body: Obx(() {
        return (productController.isLoading.value)
            ? const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                  strokeWidth: 3.0,
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.width * 0.02),
                  child: Column(
                    children: [
                      const SearchBarWidget(),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: productController.productsList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.25,
                          mainAxisSpacing: size.width * 0.05,
                          crossAxisSpacing: size.width * 0.03,
                        ),
                        itemBuilder: (context, index) {
                          var product = productController.productsList[index];
                          log(product.image);
                          return ProductCardWidget(
                            product: product,
                            productController: productController,
                          );
                        },
                      )
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
