import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/error/app_exceptions.dart';

import 'package:fruit_hub_dashboard/core/error/failure.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/datasources/add_product_remote.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/datasources/storage_remote.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/models/product_model.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product.dart';

import '../../domain/repositories/add_product_repo.dart';

class AddProductRepoImpl implements AddProductRepo {
  final AddProductRemote addProductRemote;
  final StorageRemote storageRemote;

  AddProductRepoImpl({
    required this.addProductRemote,
    required this.storageRemote,
  });
  @override
  Future<Either<Failure, void>> addProduct({
    required ProductEntity product,
  }) async {
    try {
      final res = await addProductRemote.addProduct(
        product: ProductModel.fromEntity(product).copyWith(
          imageUrl: await storageRemote.uploadImage(
            file: product.image,
            path: "product_image",
          ),
        ),
      );
      return right(res);
    } on AppExceptions catch (e) {
      return left(ServerFailure(message: e.message));
    }
  }
}
