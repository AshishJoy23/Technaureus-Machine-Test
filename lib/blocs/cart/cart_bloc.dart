import 'dart:developer';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:technaureus_machine_test/controller/controllers.dart';
import 'package:technaureus_machine_test/core/core.dart';
import 'package:technaureus_machine_test/model/models.dart';
import 'package:technaureus_machine_test/services/hive_db_services.dart';
import 'package:technaureus_machine_test/services/services.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final HiveServices _cartServices;
  List<CartModel> allCartLists = [];
  final ProductController productController = Get.put(ProductController());
  CartBloc({required HiveServices cartServices})
      : _cartServices = cartServices,
        super(CartLoading()) {
    on<AllCustomersCartCreated>(_onAllCustomersCartCreated);
    on<AllCustomersCartLoaded>(_onAllCustomersCartLoaded);
    on<EachCustomerCartLoaded>(_onEachCustomerCartLoaded);
    on<CartProductAdded>(_cartProductAdded);
    on<CartProductRemoved>(_cartProductRemoved);
    on<CartProductDeleted>(_cartProductDeleted);
    on<OrderConfirmed>(_onOrderConfirmed);
  }

  void _onAllCustomersCartCreated(
      AllCustomersCartCreated event, Emitter<CartState> emit) async {
    try {
      await _cartServices.allCustomersCartCreated();
    } catch (e) {
      log(e.toString());
    }
  }

  void _onAllCustomersCartLoaded(
      AllCustomersCartLoaded event, Emitter<CartState> emit) async {
    try {
      allCartLists = await HiveServices().fetchAllCartLists();
    } catch (e) {
      log(e.toString());
    }
  }

  void _onEachCustomerCartLoaded(
      EachCustomerCartLoaded event, Emitter<CartState> emit) async {
    try {
      CartModel eachCustomerCart = allCartLists
          .firstWhere((element) => element.customerId == event.customerId);
      emit(
        CartLoaded(
          cart: eachCustomerCart,
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  void _cartProductAdded(
      CartProductAdded event, Emitter<CartState> emit) async {
    try {
      final state = this.state;
      if (state is CartLoaded) {
        int customerIndex = allCartLists.indexWhere(
            (element) => element.customerId == state.cart.customerId);
        state.cart.cartProducts.update(
          event.productId,
          (quantity) => quantity + 1,
          ifAbsent: () => 1,
        );
        state.cart.totalPrice =
            state.cart.cartProducts.entries.fold(0, (total, entry) {
          int id = entry.key;
          int quantity = entry.value;
          ProductModel product = productController.productsList
              .firstWhere((element) => element.id == id);
          return total + (product.price * quantity);
        });
        emit(
          CartLoaded(
            cart: state.cart,
          ),
        );
        allCartLists[customerIndex] = state.cart;
        await _cartServices.updateCustomerCart(customerIndex, state.cart);
        // allCartLists.clear();
        // allCartLists = await _cartServices.fetchAllCartLists();
        // int updatedIndex = allCartLists.indexWhere(
        //     (element) => element.customerId == state.cart.customerId);
        
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void _cartProductRemoved(
      CartProductRemoved event, Emitter<CartState> emit) async {
    try {
      final state = this.state;
      if (state is CartLoaded) {
        int customerIndex = allCartLists.indexWhere(
            (element) => element.customerId == state.cart.customerId);
        state.cart.cartProducts.update(
          event.productId,
          (quantity) => quantity - 1,
        );
        state.cart.totalPrice =
            state.cart.cartProducts.entries.fold(0, (total, entry) {
          int id = entry.key;
          int quantity = entry.value;
          ProductModel product = productController.productsList
              .firstWhere((element) => element.id == id);
          return total + (product.price * quantity);
        });
        emit(
          CartLoaded(
            cart: state.cart,
          ),
        );
        allCartLists[customerIndex] = state.cart;
        await _cartServices.updateCustomerCart(customerIndex, state.cart);
        // allCartLists.clear();
        // allCartLists = await _cartServices.fetchAllCartLists();
        // int updatedIndex = allCartLists.indexWhere(
        //     (element) => element.customerId == state.cart.customerId);
        // emit(
        //   CartLoaded(
        //     cart: allCartLists[updatedIndex],
        //   ),
        // );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void _cartProductDeleted(
      CartProductDeleted event, Emitter<CartState> emit) async {
    try {
      final state = this.state;
      if (state is CartLoaded) {
        int customerIndex = allCartLists.indexWhere(
            (element) => element.customerId == state.cart.customerId);
        state.cart.cartProducts.remove(event.productId);
        state.cart.totalPrice =
            state.cart.cartProducts.entries.fold(0, (total, entry) {
          int id = entry.key;
          int quantity = entry.value;
          ProductModel product = productController.productsList
              .firstWhere((element) => element.id == id);
          return total + (product.price * quantity);
        });
        emit(
          CartLoaded(
            cart: state.cart,
          ),
        );
        allCartLists[customerIndex] = state.cart;
        await _cartServices.updateCustomerCart(customerIndex, state.cart);
        // allCartLists.clear();
        // allCartLists = await _cartServices.fetchAllCartLists();
        // int updatedIndex = allCartLists.indexWhere(
        //     (element) => element.customerId == state.cart.customerId);
        // emit(
        //   CartLoaded(
        //     cart: allCartLists[updatedIndex],
        //   ),
        // );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void _onOrderConfirmed(OrderConfirmed event, Emitter<CartState> emit) async {
    List<OrderProduct> orderProducts = [];
    try {
      for (var element in event.cart.cartProducts.entries) {
        ProductModel product = productController.productsList
            .firstWhere((e) => e.id == element.key);
        OrderProduct orderProduct = OrderProduct(
          productId: product.id,
          quantity: element.value,
          price: product.price,
        );
        orderProducts.add(orderProduct);
      }
      OrderModel newOrder = OrderModel(
        customerId: event.cart.customerId,
        totalPrice: event.cart.totalPrice,
        products: orderProducts,
      );
      await APIServices().confirmYourOrder(newOrder);
      int customerIndex = allCartLists
          .indexWhere((element) => element.customerId == event.cart.customerId);
      CartModel updatedCart = CartModel(
        customerId: event.cart.customerId,
        totalPrice: 0,
        cartProducts: {},
      );
      emit(
        CartLoaded(
          cart: updatedCart,
        ),
      );
      allCartLists[customerIndex] = updatedCart;
      await _cartServices.updateCustomerCart(customerIndex, updatedCart);
      Utils.showSnackBar('Confirmed', 'Order has beenm placed successfully!');
    } catch (e) {
      log(e.toString());
    }
  }
}
