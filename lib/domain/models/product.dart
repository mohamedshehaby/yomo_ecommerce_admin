import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Product extends Equatable {
  //
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;
  final DateTime createdAt;
  final String category;

  final String description;

  const Product({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.description,
    required this.price,
    required this.quantity,
    required this.id,
    required this.createdAt,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      createdAt: map['createdAt'].toDate() as DateTime,
      category: map['category'] as String,
      description: map['description'] as String,
    );
  }

  Product.init({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.description,
    required this.quantity,
  })  : id = const Uuid().v4(),
        createdAt = DateTime.now();

  @override
  List<Object> get props => [id, name, imageUrl, price, quantity, createdAt, category, description];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'createdAt': createdAt,
      'category': category,
      'description': description,
    };
  }
}
