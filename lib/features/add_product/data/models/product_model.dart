// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:fruit_hub_dashboard/features/add_product/data/models/review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final String? imageUrl;
  final num price;
  final int expirationsMonths;
  final int numberOfCalories;
  final int unitAmount;
  final File image;
  final bool isFeatured;
  final bool isOrganic;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    this.imageUrl,
    required this.price,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.image,
    required this.isFeatured,
    required this.isOrganic,
    required this.reviews,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isFeatured': isFeatured,
      'isOrganic': isOrganic,
      'reviews': reviews.map((x) => x.toMap()).toList(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      name: map['name'] as String,
      code: map['code'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      price: map['price'] as num,
      expirationsMonths: map['expirationsMonths'] as int,
      numberOfCalories: map['numberOfCalories'] as int,
      unitAmount: map['unitAmount'] as int,
      image: map['image'],
      isFeatured: map['isFeatured'] as bool,
      isOrganic: map['isOrganic'] as bool,
      reviews: List<ReviewModel>.from(
        (map['reviews'] as List<int>).map<ReviewModel>(
          (x) => ReviewModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
