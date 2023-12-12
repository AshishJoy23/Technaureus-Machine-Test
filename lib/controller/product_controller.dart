import 'dart:developer';

import 'package:get/get.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';
import 'package:technaureus_machine_test/services/services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productsList = <ProductModel>[].obs;

  getAllProducts() async {
    try {
      isLoading.value = true;
      var products = await APIServices().fetchAllProducts();
      log('<<<<<<<<<<<<<<<<<<<<<<fetched>>>>>>>>>>>>>>>>>>>>>>');
      log(products.toString());
      if (products != null) {
        productsList.value = products;
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<ProductModel?> getOneProduct(int id) async {
    try {
      var product = await APIServices().fetchOneProduct(id);
      log('<<<<<<<<<<<<<<<<<<<<<<fetched>>>>>>>>>>>>>>>>>>>>>>');
      log(product.toString());
      if (product != null) {
        return product;
      }
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    }
    return null;
  }

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }
}
