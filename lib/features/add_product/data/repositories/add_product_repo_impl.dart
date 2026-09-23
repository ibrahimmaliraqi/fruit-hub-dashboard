import '../../domain/entities/add_product_entity.dart';
import '../../domain/repositories/add_product_repo.dart';

class AddProductRepoImpl implements AddProductRepo {
  @override
  Future<AddProductEntity> getAddProduct() async {
    throw UnimplementedError();
  }
}