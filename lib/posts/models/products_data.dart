// "id": 1,
// "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
// "price": 109.95,
// "description": "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
// "category": "men's clothing",
// "rating": {
//   "rate": 3.9,
//   "count": 120
// }

class ProductsData {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final List<dynamic> images;
  // final Rating rating;
  final double rating;

  ProductsData({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
    required this.images,
  });

  factory ProductsData.fromJson(Map<String, dynamic> json) {
    return ProductsData(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      category: json['category'],
      rating: (json['rating'] as num).toDouble(),
      images: (json['images'] as List<dynamic>).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'images': images,
      'rating': rating,
    };
  }
}

class Rating {
  final double rate;
  final int count;

  Rating({required this.rate, required this.count});
}
