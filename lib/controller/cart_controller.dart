import 'dart:developer';

import 'package:get/get.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';
import 'package:technaureus_machine_test/services/services.dart';

class CartController extends GetxController {
  var allCartLists = <CartModel>[].obs;
  var eachCartList =
      CartModel(customerId: 0, totalPrice: 0, cartProducts: {}).obs;

  createAllCustomersCart() async {
    await HiveServices().allCustomersCartCreated();
  }

  getAllCartLists() async{
    try {
      var carts = await HiveServices().fetchAllCartLists();
      log('<<<<<<<<<<<<<<<<<<<<<<fetched cart>>>>>>>>>>>>>>>>>>>>>>');
      log(carts.length.toString());
      allCartLists.value = carts;
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    }
  }

  // Future<void> chooseEachCustomerCart(int customerId) async {
  //   eachCartList.value = allCartLists.firstWhere(
  //     (element) => element.customerId == customerId,
  //   );
  //   log('<<<<<<<<<<<<choosing>>>>>>>>>>>>');
  //   log(eachCartList.value.customerId.toString());
  // }

  addProductToCart(int customerId, ProductModel product) async {
    try {
      var cart = allCartLists.firstWhere((element) => element.customerId == customerId );
      int customerIndex =
          allCartLists.indexWhere((element) => element == cart);
      cart.cartProducts.update(
        product,
        (quantity) => quantity + 1,
        ifAbsent: () => 1,
      );
      log('<<<<<<<<<<<<adding one pdt>>>>>>>>=>>>>');
      log(cart.customerId.toString());
      cart.totalPrice =
          cart.cartProducts.entries.fold(0, (total, entry) {
        ProductModel product = entry.key;
        int quantity = entry.value;
        return total + (product.price * quantity);
      });
      allCartLists[customerIndex] = cart;
      await HiveServices()
          .updateCustomerCart(customerIndex, cart);
      log('<<<<<<<<<<<<checking total>>>>>>>>>>>>');
      log(cart.totalPrice.toString());
      log('product added successfully');
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    }
  }
  removeProductFromCart(int customerId, ProductModel product) async {
    try {
      var cart = allCartLists.firstWhere((element) => element.customerId == customerId );
      int customerIndex =
          allCartLists.indexWhere((element) => element == cart);
      cart.cartProducts.update(
        product,
        (quantity) => quantity - 1,
      );
      log('<<<<<<<<<<<<removing one pdt>>>>>>>>=>>>>');
      log(cart.customerId.toString());
      cart.totalPrice =
          cart.cartProducts.entries.fold(0, (total, entry) {
        ProductModel product = entry.key;
        int quantity = entry.value;
        return total + (product.price * quantity);
      });
      allCartLists[customerIndex] = cart;
      await HiveServices()
          .updateCustomerCart(customerIndex, cart);
      log('<<<<<<<<<<<<checking total>>>>>>>>>>>>');
      log(cart.totalPrice.toString());
      log('product removed successfully');
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    }
  }
  deleteCartProduct(int customerId, ProductModel product) async {
    try {
      var cart = allCartLists.firstWhere((element) => element.customerId == customerId );
      int customerIndex =
          allCartLists.indexWhere((element) => element == cart);
      cart.cartProducts.remove(product);
      log('<<<<<<<<<<<<removing one pdt>>>>>>>>=>>>>');
      log(cart.customerId.toString());
      cart.totalPrice =
          cart.cartProducts.entries.fold(0, (total, entry) {
        ProductModel product = entry.key;
        int quantity = entry.value;
        return total + (product.price * quantity);
      });
      allCartLists[customerIndex] = cart;
      await HiveServices()
          .updateCustomerCart(customerIndex, cart);
      log('<<<<<<<<<<<<checking total>>>>>>>>>>>>');
      log(cart.totalPrice.toString());
      log('product removed successfully');
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    }
  }

  @override
  void onInit() {
    createAllCustomersCart();
    getAllCartLists();
    super.onInit();
  }

  @override
  void onClose() {
    HiveServices().closeHiveBox();
    super.onClose();
  }
}
