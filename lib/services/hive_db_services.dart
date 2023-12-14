import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';

class HiveServices {
  final Box<CartModel> box = Hive.box('cart');
  final CustomerController customerController = Get.put(CustomerController());

  Future<void> allCustomersCartCreated() async {
    log('on db service');
    log(customerController.customersList.length.toString());
    log('-------90090909090---');
    // for (var customer in customerController.customersList) {
    //   CartModel cart =
    //       CartModel(customerId: customer.id!, totalPrice: 0, cartProducts: {});
    //   await box.add(cart);
    // }
    var existingCarts = await fetchAllCartLists();

      // Check if the cart for each customer already exists
      for (var customer in customerController.customersList) {
        if (!existingCarts.any((cart) => cart.customerId == customer.id)) {
          CartModel cart =
              CartModel(customerId: customer.id!, totalPrice: 0, cartProducts: {});
          await box.add(cart);
        }
      }
    log('added completely');
  }

  Future<List<CartModel>> fetchAllCartLists() async{
    var carts = box.values.toList();
    log(box.toString());
    log(box.values.toString());
    log(box.values.toList().toString());
    log('fetched completely');
    return carts;
  }

  Future<void> updateCustomerCart(int index, CartModel updatedCart) async {
    try {
      await box.putAt(index, updatedCart);
      log('successfully updated');
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    }
  }

  Future<void> closeHiveBox() async {
    try {
      await box.close();
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    }
  }
}
