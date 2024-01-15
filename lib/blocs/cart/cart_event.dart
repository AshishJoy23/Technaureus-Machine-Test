part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AllCustomersCartCreated extends CartEvent {
  const AllCustomersCartCreated();
   @override
  List<Object> get props => [];
}

class AllCustomersCartLoaded extends CartEvent {
  const AllCustomersCartLoaded();
   @override
  List<Object> get props => [];
}

class EachCustomerCartLoaded extends CartEvent {
  final int customerId;

  const EachCustomerCartLoaded({required this.customerId});

  @override
  List<Object> get props => [customerId];
}

class CartProductAdded extends CartEvent {
  final int productId;

  const CartProductAdded({required this.productId});

  @override
  List<Object> get props => [productId];
}

class CartProductRemoved extends CartEvent {
  final int productId;

  const CartProductRemoved({required this.productId});

  @override
  List<Object> get props => [productId];
}

class CartProductDeleted extends CartEvent {
  final int productId;

  const CartProductDeleted({required this.productId});

  @override
  List<Object> get props => [productId];
}

class OrderConfirmed extends CartEvent {
  final CartModel cart;

  const OrderConfirmed({required this.cart});

  @override
  List<Object> get props => [cart];
}
