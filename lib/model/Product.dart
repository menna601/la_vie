class Product {
  Product({required this.name, required this.price, this.imageUrl});
  final String? imageUrl;
  final String name;
  final int price;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        name: json['name'], price: json['price'], imageUrl: json['imageUrl']);
  }
}
