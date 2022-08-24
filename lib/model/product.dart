class Product {
  Product({
    required this.name,
    required this.price,
    required this.type,
    required this.description,
    required this.typeName,
    this.imageUrl,
  });
  final String? imageUrl;
  final String name;
  final int price;
  final String type;
  final String description;
  final String typeName;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      type: json['type'],
      description: json['description'],
      typeName: json['plant'] != null
          ? json['plant']['name']
          : json['seed'] != null
              ? json['seed']['name']
              : json['tool']['name'],
    );
  }
}
