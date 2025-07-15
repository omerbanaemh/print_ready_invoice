import 'package:get_it/get_it.dart';
import 'package:print_ready_invoice/features/invoice/data/data_sources/client_local_data_source.dart';
import 'package:print_ready_invoice/features/invoice/data/repos/client_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator(){
  // getIt.registerSingleton<ClientRepoImpl>(ClientRepoImpl(clientLocalDataSource: ClientLocalDataSourceImpl()));

  getIt.registerSingleton<ClientLocalDataSource>(
  ClientLocalDataSourceImpl(),
);

getIt.registerSingleton<ClientRepoImpl>(
  ClientRepoImpl(clientLocalDataSource: getIt.get<ClientLocalDataSource>()),
);
}