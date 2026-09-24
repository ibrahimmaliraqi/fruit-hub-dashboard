// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

class ReviewModel {
  final String name;
  final String image;
  final num ratting;
  final String date;
  final String reviewDescription;
  ReviewModel({
    required this.name,
    required this.image,
    required this.ratting,
    required this.date,
    required this.reviewDescription,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDescription': reviewDescription,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      name: map['name'] as String,
      image: map['image'] as String,
      ratting: map['ratting'] as num,
      date: map['date'] as String,
      reviewDescription: map['reviewDescription'] as String,
    );
  }
}
