import 'package:bloc/bloc.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/entities/product.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/usecases/add_product_usecase.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProductUseCase addProductUseCase;
  AddProductCubit({required this.addProductUseCase})
    : super(AddProductInitial());

  Future addProduct({required ProductEntity product}) async {
    emit(AddProductLoading());

    final res = await addProductUseCase.call(product: product);
    res.fold(
      (l) {
        emit(AddProductFailure(errMessage: l.message));
      },
      (r) {
        emit(AddProductSuccess());
      },
    );
  }
}
