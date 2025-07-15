import 'package:get_it/get_it.dart';
import 'package:print_ready_invoice/features/invoice/data/data_sources/client_local_data_source.dart';
import 'package:print_ready_invoice/features/invoice/data/data_sources/product_local_data_source.dart';
import 'package:print_ready_invoice/features/invoice/data/repos/client_repo_impl.dart';
import 'package:print_ready_invoice/features/invoice/data/repos/product_repo_impl.dart';
import 'package:print_ready_invoice/features/invoice/domin/use_cases/add_product_use_case.dart';
import 'package:print_ready_invoice/features/invoice/domin/use_cases/fetch_client_details_use_case.dart';
import 'package:print_ready_invoice/features/invoice/domin/use_cases/fetch_products_use_case.dart';
import 'package:print_ready_invoice/features/invoice/domin/use_cases/update_client_details_use_case.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  //DATA SOURCES

  //client data sources
  getIt.registerSingleton<ClientLocalDataSource>(ClientLocalDataSourceImpl());
  //product data sources
  getIt.registerSingleton<ProductLocalDataSource>(ProductLocalDataSourceImpl());

  //REPOS
  getIt.registerSingleton<ClientRepoImpl>(
    ClientRepoImpl(clientLocalDataSource: getIt.get<ClientLocalDataSource>()),
  );
  getIt.registerSingleton<ProductRepoImpl>(
    ProductRepoImpl(
      productLocalDataSource: getIt.get<ProductLocalDataSource>(),
    ),
  );

  //USE CASES

  //product
  getIt.registerSingleton<FetchProductsUseCase>(
    FetchProductsUseCase(productRepo: getIt.get<ProductRepoImpl>()),
  );

  getIt.registerSingleton<AddProductUseCase>(
    AddProductUseCase(ProductRepoImpl(productLocalDataSource: getIt.get<ProductLocalDataSource>())),
  );
  //client
  getIt.registerSingleton<FetchClientDetailsUseCase>(
    FetchClientDetailsUseCase(clientRepo: getIt.get<ClientRepoImpl>()),
  );
  getIt.registerSingleton<UpdateClientDetailsUseCase>(
    UpdateClientDetailsUseCase(clientRepo: getIt.get<ClientRepoImpl>()),
  );
}
