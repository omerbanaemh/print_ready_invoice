import 'package:get_it/get_it.dart';
import 'package:print_ready_invoice/features/invoice/data/data_sources/client_local_data_source.dart';
import 'package:print_ready_invoice/features/invoice/data/repos/client_repo_impl.dart';
import 'package:print_ready_invoice/features/invoice/domin/use_cases/fetch_client_details_use_case.dart';
import 'package:print_ready_invoice/features/invoice/domin/use_cases/update_client_details_use_case.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){

  getIt.registerSingleton<ClientLocalDataSource>(
  ClientLocalDataSourceImpl(),
);

getIt.registerSingleton<ClientRepoImpl>(
  ClientRepoImpl(clientLocalDataSource: getIt.get<ClientLocalDataSource>()),
);





  // Use Cases
  getIt.registerSingleton<FetchClientDetailsUseCase>(
    FetchClientDetailsUseCase(clientRepo: getIt.get<ClientRepoImpl>(),),
  );

  getIt.registerSingleton<UpdateClientDetailsUseCase>(
    UpdateClientDetailsUseCase(clientRepo: getIt.get<ClientRepoImpl>()),
  );






  

}