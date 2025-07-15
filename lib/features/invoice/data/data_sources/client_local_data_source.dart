import 'package:print_ready_invoice/features/invoice/data/models/client_model.dart';

abstract class ClientLocalDataSource {
  Future<ClientModel?> fetchClientDetails();
  Future<ClientModel> updateClientDetails(ClientModel client);

}


class ClientLocalDataSourceImpl extends ClientLocalDataSource{
 ClientModel? client = ClientModel(name: 'Global Corp',address: '123 Street Name, City, 12345',email: 'contact@gmail.com');

  @override
  Future<ClientModel?> fetchClientDetails() async{
    return Future.value(client);
  }
  
  @override
  Future<ClientModel> updateClientDetails(ClientModel client) async{
    final clientUpdated =  this.client = client;
    return Future.value(clientUpdated);
  }

}