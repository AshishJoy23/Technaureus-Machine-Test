import 'dart:developer';

import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';
import 'package:technaureus_machine_test/services/services.dart';

class CartController extends GetxController {
  var allCartLists = <CartModel>[].obs;
  var eachCartList =
      CartModel(customerId: 0, totalPrice: 0, cartProducts: {}).obs;

  final ProductController productController = Get.put(ProductController());

  createAllCustomersCart() async {
    await HiveServices().allCustomersCartCreated();
  }

  getAllCartLists() async {
    try {
      var carts = await HiveServices().fetchAllCartLists();

      allCartLists.value = carts;
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
    }
  }

  addProductToCart(int customerId, int productId) async {
    try {
      int customerIndex =
          allCartLists.indexWhere((element) => element == eachCartList.value);
      eachCartList.value.cartProducts.update(
        productId,
        (quantity) => quantity + 1,
        ifAbsent: () => 1,
      );

      eachCartList.value.totalPrice =
          eachCartList.value.cartProducts.entries.fold(0, (total, entry) {
        int id = entry.key;
        int quantity = entry.value;
        ProductModel product = productController.productsList
            .firstWhere((element) => element.id == id);
        return total + (product.price * quantity);
      });
      allCartLists[customerIndex] = eachCartList.value;
      await HiveServices()
          .updateCustomerCart(customerIndex, eachCartList.value);
      allCartLists.clear();
      allCartLists.value = await HiveServices().fetchAllCartLists();
      eachCartList.value = allCartLists[customerIndex];
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
    }
  }

  removeProductFromCart(int customerId, int productId) async {
    try {
      int customerIndex =
          allCartLists.indexWhere((element) => element == eachCartList.value);
      eachCartList.value.cartProducts.update(
        productId,
        (quantity) => quantity - 1,
      );

      eachCartList.value.totalPrice =
          eachCartList.value.cartProducts.entries.fold(0, (total, entry) {
        int id = entry.key;
        int quantity = entry.value;
        ProductModel product = productController.productsList
            .firstWhere((element) => element.id == id);
        return total + (product.price * quantity);
      });
      allCartLists[customerIndex] = eachCartList.value;
      await HiveServices()
          .updateCustomerCart(customerIndex, eachCartList.value);
      allCartLists.clear();
      allCartLists.value = await HiveServices().fetchAllCartLists();
      eachCartList.value = allCartLists[customerIndex];
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
    }
  }

  deleteCartProduct(int customerId, int productId) async {
    try {
      int customerIndex =
          allCartLists.indexWhere((element) => element == eachCartList.value);
      eachCartList.value.cartProducts.remove(productId);

      eachCartList.value.totalPrice =
          eachCartList.value.cartProducts.entries.fold(0, (total, entry) {
        int id = entry.key;
        int quantity = entry.value;
        ProductModel product = productController.productsList
            .firstWhere((element) => element.id == id);

        return total + (product.price * quantity);
      });
      allCartLists[customerIndex] = eachCartList.value;
      await HiveServices()
          .updateCustomerCart(customerIndex, eachCartList.value);
      allCartLists.clear();
      allCartLists.value = await HiveServices().fetchAllCartLists();
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
    }
  }

  confirmOrder(CartModel cart) async {
    List<OrderProduct> orderProducts = [];
    try {
      for (var element in cart.cartProducts.entries) {
        ProductModel product = productController.productsList
            .firstWhere((e) => e.id == element.key);
        OrderProduct orderProduct = OrderProduct(
            productId: product.id,
            quantity: element.value,
            price: product.price);
        orderProducts.add(orderProduct);
      }
      OrderModel newOrder = OrderModel(
          customerId: cart.customerId,
          totalPrice: cart.totalPrice,
          products: orderProducts);
      await APIServices().confirmYourOrder(newOrder);
      int customerIndex = allCartLists.indexWhere((element) => element == cart);
      eachCartList.value = CartModel(
          customerId: cart.customerId, totalPrice: 0, cartProducts: {});
      allCartLists[customerIndex] = eachCartList.value;
      await HiveServices()
          .updateCustomerCart(customerIndex, eachCartList.value);
          Utils.showSnackBar('Confirmed', 'Order has beenm placed successfully!');
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
