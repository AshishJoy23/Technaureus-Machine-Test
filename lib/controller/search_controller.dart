import 'dart:developer';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';
import 'package:technaureus_machine_test/services/services.dart';

class SearchController extends GetxController {
  var isProductSearching = false.obs;
  var isCustomerSearching = false.obs;
  var productsSuggestionList = <ProductModel>[].obs;
  var customersSuggestionList = <CustomerModel>[].obs;

  final ProductController productController = Get.put(ProductController());
  final CustomerController customerController = Get.put(CustomerController());

  getSearchedProducts(String textQuery) async {
    try {
      isProductSearching.value = true;
      if (textQuery.isEmpty) {
        productsSuggestionList.value = productController.productsList;
        isProductSearching.value = false;
        return;
      }
      var products = await APIServices().fetchSearchedProducts(textQuery);
      log('<<<<<<<<<<<<<<<<<<<<<<fetched>>>>>>>>>>>>>>>>>>>>>>');
      log(products.toString());
      if (products != null) {
        productsSuggestionList.value = products;
        isProductSearching.value = false;
      }
    } catch (e) {
      isProductSearching.value = false;
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    } finally {
      isProductSearching.value = false;
    }
  }

  getSearchedCustomers(String textQuery) async {
    try {
      isCustomerSearching.value = true;
      if (textQuery.isEmpty) {
        customersSuggestionList.value = customerController.customersList;
        isCustomerSearching.value = false;
        return;
      }
      var customers = await APIServices().fetchSearchedCustomers(textQuery);
      log('<<<<<<<<<<<<<<<<<<<<<<fetched>>>>>>>>>>>>>>>>>>>>>>');
      log(customers.toString());
      if (customers != null) {
        customersSuggestionList.value = customers;
        isCustomerSearching.value = false;
      }
    } catch (e) {
      isCustomerSearching.value = false;
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    } finally {
      isCustomerSearching.value = false;
    }
  }

  @override
  void onInit() {
    productsSuggestionList.value = productController.productsList;
    customersSuggestionList.value = customerController.customersList;
    super.onInit();
  }
  @override
  void onClose() {
    productsSuggestionList.value = productController.productsList;
    customersSuggestionList.value = customerController.customersList;
    super.onClose();
  }
}