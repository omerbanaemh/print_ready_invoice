import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';

class ClientModel {
  late final String? name;
  final String? address;
  final String? email;

  ClientModel({this.name, this.address, this.email});

  factory ClientModel.fromEntity(ClientEntity client) => ClientModel(
    name: client.name,
    address: client.address,
    email: client.email,
  );
  ClientEntity toClientEntity() =>
      ClientEntity(name: name, address: address, email: email);
}
