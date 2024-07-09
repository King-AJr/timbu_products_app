//name, description, unique_id, photos, price, available_product, discounted_price, stock

class ProductModel {
  String name;
  final String description;
  final String uniqueId;
  final String photo;
  final double stock;

  ProductModel({
    required this.name,
    required this.description,
    required this.uniqueId,
    required this.photo,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      description: json['description'],
      uniqueId: json['unique_id'],
      photo: (json['photos'] != null &&
              json['photos'] is List &&
              json['photos'].isNotEmpty)
          ? 'https://api.timbu.cloud/images/${json['photos'][0]['url']}'
          : "",
      stock: json['available_quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'unique_id': uniqueId,
      'photos': photo,
      'stock': stock,
    };
  }
}
