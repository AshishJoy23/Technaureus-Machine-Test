import 'dart:developer';

import 'package:get/get.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';
import 'package:technaureus_machine_test/services/services.dart';

class CustomerController extends GetxController {
  var isLoading = true.obs;
  var customersList = <CustomerModel>[].obs;
//getting all customers
  Future<void> getAllCustomers() async {
    try {
      isLoading.value = true;
      var customers = await APIServices().fetchAllCustomers();
      log('<<<<<<<<<<<<<<<<<<<<<<fetched customers>>>>>>>>>>>>>>>>>>>>>>');
      log(customers.toString());
      if (customers != null) {
        customersList.value = customers;
        isLoading.value = false;
        log(customers.length.toString());
      }
      HiveServices().allCustomersCartCreated();
    } catch (e) {
      isLoading.value = false;
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

//getting a single customer
  Future<CustomerModel?> getOneCustomer(int id) async {
    try {
      var customer = await APIServices().fetchOneCustomer(id);
      log('<<<<<<<<<<<<<<<<<<<<<<fetched customer>>>>>>>>>>>>>>>>>>>>>>');
      log(customer.toString());
      if (customer != null) {
        return customer;
      }
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    }
    return null;
  }

//editing customer
  editCustomer(int id,CustomerModel customer) async {
    log('<<<<<<<<edit customer comtrol>>>>>>>>');
    try {
      var responseCustomer = await APIServices().modifyCustomerDetails(id, customer);
      if (responseCustomer != null) {
        var editedCustomer = customersList.firstWhere((element) => element.id == responseCustomer.id);
        int index = customersList.indexWhere((element) => element.id == editedCustomer.id);
        customersList[index] = responseCustomer;
        log(responseCustomer.name);
        Utils.showSnackBar('Edited', 'Successfully updated the customer.');
      }
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
      log(e.toString());
    }
  }

  //adding new customer
  addNewCustomer(CustomerModel customer) async {
    log('<<<<<<<<add customer comtrol>>>>>>>>');
    try {
      var newCustomer = await APIServices().createCustomer(customer);
      if (newCustomer != null) {
        customersList.insert(0, newCustomer);
        Utils.showSnackBar('Created', 'New customer is created.');
      }
    } catch (e) {
      Utils.showSnackBar('Error', e.toString());
      log('controller log');
      log(e.toString());
    }
  }

  @override
  void onInit() async{
    await getAllCustomers();
    super.onInit();
  }
}
