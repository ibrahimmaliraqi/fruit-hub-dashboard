import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit_hub_dashboard/core/constant/bakend.dart';
import 'package:fruit_hub_dashboard/core/error/app_exceptions.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/models/product_model.dart';

abstract class AddProductRemote {
  Future<void> addProduct({required ProductModel product});
}

class FirebaseAddProduct implements AddProductRemote {
  final db = FirebaseFirestore.instance.collection(
    BackendEndPoint.productCollection,
  );

  @override
  Future<void> addProduct({
    required ProductModel product,
  }) async {
    try {
      await db.add(product.toMap());
    } catch (e) {
      throw ServerException(message: "خطا بالاضافه الابيانات $e");
    }
  }
}
