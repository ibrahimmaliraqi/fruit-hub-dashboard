import '../entities/product.dart';

abstract class AddProductRepo {
  Future<ProductEntity> getAddProduct();
}
