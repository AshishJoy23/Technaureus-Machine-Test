class OrderModel {
    int customerId;
    int totalPrice;
    List<OrderProduct> products;

    OrderModel({
        required this.customerId,
        required this.totalPrice,
        required this.products,
    });

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "total_price": totalPrice,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class OrderProduct {
    int productId;
    int quantity;
    int price;

    OrderProduct({
        required this.productId,
        required this.quantity,
        required this.price,
    });

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
        "price": price,
    };
}