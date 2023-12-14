import 'package:hive/hive.dart';
import 'package:technaureus_machine_test/model/models.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartModel extends HiveObject {
  @HiveField(0)
  final int customerId;

  @HiveField(1)
  int totalPrice;

  @HiveField(2)
  final Map<ProductModel, int> cartProducts;

  CartModel({
    required this.customerId,
    required this.totalPrice,
    required this.cartProducts,
  });
}

