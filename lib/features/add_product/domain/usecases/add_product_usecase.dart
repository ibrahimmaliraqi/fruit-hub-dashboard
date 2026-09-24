import '../entities/product.dart';
import '../repositories/add_product_repo.dart';

class AddProductUseCase {
  final AddProductRepo repository;

  AddProductUseCase({
    required this.repository,
  });

  Future<ProductEntity> call() async {
    return repository.getAddProduct();
  }
}
