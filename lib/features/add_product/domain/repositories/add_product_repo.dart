import '../entities/add_product_entity.dart';

abstract class AddProductRepo {
  Future<AddProductEntity> getAddProduct();
}