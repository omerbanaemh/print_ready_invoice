import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';
import 'package:print_ready_invoice/features/invoice/domin/repos/clinet_repo.dart';

class UpdateClientDetailsUseCase {
  final ClinetRepo clientRepo;

  UpdateClientDetailsUseCase({required this.clientRepo});

  Future<Either<Failure, ClientEntity>> call(ClientEntity client)  async{
    return clientRepo.updateClientDetails(client);
  }
}
