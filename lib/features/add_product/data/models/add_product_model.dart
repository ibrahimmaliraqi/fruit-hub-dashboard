import '../../domain/entities/add_product_entity.dart';

class AddProductModel extends AddProductEntity {
  AddProductModel({
    required super.id,
  });

  factory AddProductModel.fromMap(
    Map<String, dynamic> map,
  ) {
    return AddProductModel(
      id: map['id'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }
}