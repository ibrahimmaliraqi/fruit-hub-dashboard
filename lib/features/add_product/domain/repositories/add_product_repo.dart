import 'package:dartz/dartz.dart';
import 'package:fruit_hub_dashboard/core/error/failure.dart';

import '../entities/product.dart';

abstract class AddProductRepo {
  Future<Either<Failure, void>> addProduct({required ProductEntity product});
}
