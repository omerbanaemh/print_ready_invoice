import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';

abstract class ClientLocalDataSource {
  ClientEntity? fetchClientDetails();
  ClientEntity updateClientDetails(ClientEntity client);

}


class ClientLocalDataSourceImpl extends ClientLocalDataSource{
 ClientEntity? client = ClientEntity(name: 'Global Corp',address: '123 Street Name, City, 12345',email: 'contact@gmail.com');

  @override
  ClientEntity? fetchClientDetails() {
    return client;
  }
  
  @override
  ClientEntity updateClientDetails(ClientEntity client) {
    final clientUpdated =  this.client = client;
    return clientUpdated;
  }

}