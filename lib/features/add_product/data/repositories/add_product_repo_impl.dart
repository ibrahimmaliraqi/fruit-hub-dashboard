import '../../domain/entities/product.dart';
import '../../domain/repositories/add_product_repo.dart';

class AddProductRepoImpl implements AddProductRepo {
  @override
  Future<ProductEntity> getAddProduct() async {
    throw UnimplementedError();
  }
}
