import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:technaureus_machine_test/core/api_endpoints.dart';
import 'package:technaureus_machine_test/model/models.dart';

class APIServices {
  Future<List<ProductModel>?> fetchAllProducts() async {
    var response = await http.get(Uri.parse(kProductsUrl));
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      List<ProductModel> products = List.from(
          body['data'].map((product) => ProductModel.fromJson(product)));
      return products;
    } else {
      return null;
    }
  }

  Future<ProductModel?> fetchOneProduct(int id) async {
    var response = await http.get(Uri.parse("$kProductUrl$id"));
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      ProductModel product = ProductModel.fromJson(body['data']);
      return product;
    } else {
      return null;
    }
  }

  Future<List<CustomerModel>?> fetchAllCustomers() async {
    var response = await http.get(Uri.parse(kCustomersUrl));
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      List<CustomerModel> customers = List.from(
          body['data'].map((customer) => CustomerModel.fromJson(customer)));
      return customers;
    } else {
      return null;
    }
  }

  Future<CustomerModel?> fetchOneCustomer(int id) async {
    var response = await http.get(Uri.parse("$kCustomerUrl$id"));
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      CustomerModel customer = CustomerModel.fromJson(body['data']);
      return customer;
    } else {
      return null;
    }
  }

  Future<CustomerModel?> modifyCustomerDetails(
      int id, CustomerModel customer) async {
        log(customer.name);
    try {
      var response = await http.put(Uri.parse("$kCustomerUrl$id"),
          body: jsonEncode(customer.toJson()));
      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        var body = await json.decode(response.body);
        CustomerModel updatedCustomer = CustomerModel.fromJson(body['data']);
        return updatedCustomer;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<CustomerModel?> createCustomer(CustomerModel customer) async {
    try {
      var response =
        await http.post(Uri.parse(kCustomersUrl), body: json.encode(customer.toJson()));
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      CustomerModel updatedCustomer = CustomerModel.fromJson(body['data']);
      return updatedCustomer;
    } else {
      return null;
    }
    } catch (e) {
      log('services log');
      log(e.toString());
    }
    return null;
  }

  Future<List<ProductModel>?> fetchSearchedProducts(String query) async {
    var response = await http.get(Uri.parse("$kSearchProductUrl$query"));
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      List<ProductModel> products = List.from(
          body['data'].map((product) => ProductModel.fromJson(product)));
      return products;
    } else {
      return null;
    }
  }

  Future<List<CustomerModel>?> fetchSearchedCustomers(String query) async {
    var response = await http.get(Uri.parse("$kSearchCustomerUrl$query"));
    if (response.statusCode == 200) {
      var body = await json.decode(response.body);
      List<CustomerModel> customers = List.from(
          body['data'].map((customer) => CustomerModel.fromJson(customer)));
      return customers;
    } else {
      return null;
    }
  }
}
