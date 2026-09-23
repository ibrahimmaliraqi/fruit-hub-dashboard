import '../entities/add_product_entity.dart';
import '../repositories/add_product_repo.dart';

class AddProductUseCase {
  final AddProductRepo repository;

  AddProductUseCase({
    required this.repository,
  });

  Future<AddProductEntity> call() async {
    return repository.getAddProduct();
  }
}