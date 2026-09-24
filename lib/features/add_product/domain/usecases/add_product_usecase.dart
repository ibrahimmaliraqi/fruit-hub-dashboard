import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/error/failure.dart';

import '../entities/product.dart';
import '../repositories/add_product_repo.dart';

class AddProductUseCase {
  final AddProductRepo repository;

  AddProductUseCase({
    required this.repository,
  });

  Future<Either<Failure, void>> call({required ProductEntity product}) async {
    return repository.addProduct(product: product);
  }
}
