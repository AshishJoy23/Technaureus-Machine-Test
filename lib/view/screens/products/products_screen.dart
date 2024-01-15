import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class ProductsScreen extends StatelessWidget {
  final CustomerModel? customer;
  ProductsScreen({super.key, this.customer});

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    bool checkCustomer = customer != null ? true : false;
    log(checkCustomer.toString());
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: checkCustomer ? customer!.name : 'Products',
      ),
      body: (productController.isLoading.value)
          ? const Center(
              child: CircularProgressIndicator(
                color: kPrimaryColor,
                strokeWidth: 3.0,
              ),
            )
          : productController.productsList.isEmpty
              ? const Center(
                  child: CustomAnimation(
                    animationUrl: 'assets/animation/no_data.json',
                    message: 'Data Not Found!!!',
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.width * 0.02),
                    child: Column(
                      children: [
                        CustomSearchBarWidget(
                          isProduct: true,
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: productController.productsList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                              customerId: checkCustomer ? customer!.id : null,
                              index: checkCustomer ? index : null,
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
      // body: Obx(() {
      //   return (productController.isLoading.value)
      //       ? const Center(
      //           child: CircularProgressIndicator(
      //             color: kPrimaryColor,
      //             strokeWidth: 3.0,
      //           ),
      //         )
      //       : productController.productsList.isEmpty
      //           ? const Center(
      //             child: CustomAnimation(
      //               animationUrl: 'assets/animation/no_data.json',
      //               message: 'Data Not Found!!!',
      //             ),
      //           )
      //           : SingleChildScrollView(
      //               child: Padding(
      //                 padding: EdgeInsets.symmetric(
      //                     horizontal: size.width * 0.04,
      //                     vertical: size.width * 0.02),
      //                 child: Column(
      //                   children: [
      //                     CustomSearchBarWidget(
      //                       isProduct: true,
      //                     ),
      //                     SizedBox(
      //                       height: size.height * 0.01,
      //                     ),
      //                     GridView.builder(
      //                       physics: const NeverScrollableScrollPhysics(),
      //                       shrinkWrap: true,
      //                       itemCount: productController.productsList.length,
      //                       gridDelegate:
      //                           SliverGridDelegateWithFixedCrossAxisCount(
      //                         crossAxisCount: 2,
      //                         childAspectRatio: 1.25,
      //                         mainAxisSpacing: size.width * 0.05,
      //                         crossAxisSpacing: size.width * 0.03,
      //                       ),
      //                       itemBuilder: (context, index) {
      //                         var product =
      //                             productController.productsList[index];
      //                         log(product.image);
      //                         return ProductCardWidget(
      //                           product: product,
      //                           customerId: checkCustomer ? customer!.id : null,
      //                           index: checkCustomer ? index : null,
      //                         );
      //                       },
      //                     )
      //                   ],
      //                 ),
      //               ),
      //             );
      // }),
      bottomSheet: checkCustomer
          ? CustomBottomNavWidget(
              customerId: customer!.id!,
            )
          : const CustomBottomNavWidget(),
    );
  }
}
