import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/blocs/cart/cart_bloc.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/view/screens/screens.dart';
import 'package:technaureus_machine_test/view/widgets/widgets.dart';

class NewOrderScreen extends StatelessWidget {
  NewOrderScreen({super.key});

  final CustomerController customerController = Get.put(CustomerController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Customers',
      ),
      body: Obx(
        () => customerController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                  strokeWidth: 3.0,
                ),
              )
            : customerController.customersList.isEmpty
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
                          CustomSearchBarWidget(),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: customerController.customersList.length,
                            itemBuilder: (context, index) {
                              var customer =
                                  customerController.customersList[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: size.width * 0.02),
                                child: InkWell(
                                  onTap: () {
                                    BlocProvider.of<CartBloc>(context).add(
                                      EachCustomerCartLoaded(
                                          customerId: customer.id!),
                                    );
                                    // cartController.eachCartList.value =
                                    //     cartController.allCartLists.firstWhere(
                                    //         (element) =>
                                    //             element.customerId ==
                                    //             customer.id);
                                    // log(cartController
                                    //     .eachCartList.value.customerId
                                    //     .toString());
                                    log('<<<<<<finded>>>>>>');
                                    Get.to(
                                      () => ProductsScreen(
                                        customer: customer,
                                      ),
                                    );
                                    log('<<<<<<<<<<<<<moved to next>>>>>>>>>>>>>');
                                  },
                                  child: CustomerCardWidget(
                                    customer: customer,
                                  ),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
      ),
      bottomSheet: const CustomBottomNavWidget(
        customerId: null,
      ),
    );
  }
}
