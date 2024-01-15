import 'package:hive/hive.dart';

 part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final int price;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
    };
}
