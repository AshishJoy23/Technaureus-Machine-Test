// class ProductModel {
//     final int errorCode;
//     final List<Datum> data;
//     final String message;

//     ProductModel({
//         required this.errorCode,
//         required this.data,
//         required this.message,
//     });

//     factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         errorCode: json["error_code"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         message: json["message"],
//     );

//     Map<String, dynamic> toJson() => {
//         "error_code": errorCode,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "message": message,
//     };
// }

class ProductModel {
    final int id;
    final String name;
    final String image;
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
