import 'package:fruit_hub_dashboard/features/add_product/data/datasources/add_product_remote.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/datasources/storage_remote.dart';
import 'package:fruit_hub_dashboard/features/add_product/data/repositories/add_product_repo_impl.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/repositories/add_product_repo.dart';
import 'package:fruit_hub_dashboard/features/add_product/domain/usecases/add_product_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<StorageRemote>(SupabaseStorage());
  getIt.registerSingleton<AddProductRemote>(FirebaseAddProduct());
  getIt.registerSingleton<AddProductRepo>(
    AddProductRepoImpl(
      addProductRemote: getIt.get<AddProductRemote>(),
      storageRemote: getIt.get<StorageRemote>(),
    ),
  );
  getIt.registerSingleton<AddProductUseCase>(
    AddProductUseCase(repository: getIt.get<AddProductRepo>()),
  );
}
