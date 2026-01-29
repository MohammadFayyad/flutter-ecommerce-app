import 'dart:convert';

import 'package:ecommerce_app/features/home_page_screen/models/rating.dart';

List<ProductModel> productModelFromJson(str) {
  List<ProductModel> productsList = List<ProductModel>.from(
    str.map((mapOfProduct) => ProductModel.fromMap(mapOfProduct)),
  );
  return productsList;
}

class ProductModel {
  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      image: map['image'] ?? '',
      rating: Rating.fromMap(map['rating']),
    );
  }

  final String category;
  final String description;
  final int id;
  final String image;
  final double price;
  final Rating rating;
  final String title;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating.toMap(),
    };
  }
}
