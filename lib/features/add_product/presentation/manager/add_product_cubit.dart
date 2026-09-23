import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit()
      : super(AddProductInitial());

  Future<void> getAddProduct() async {
    emit(AddProductLoading());

    try {
      emit(AddProductSuccess());
    } catch (e) {
      emit(
        AddProductFailure(
          message: e.toString(),
        ),
      );
    }
  }
}