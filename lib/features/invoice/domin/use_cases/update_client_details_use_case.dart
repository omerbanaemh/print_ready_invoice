import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';
import 'package:print_ready_invoice/features/invoice/domin/repos/clinet_repo.dart';

class UpdateClientDetailsUseCase {
  final ClinetRepo clinetRepo;

  UpdateClientDetailsUseCase({required this.clinetRepo});

  Either<Failure, ClientEntity> call(ClientEntity client)  {
    return  clinetRepo.updateClientDetails(client);
  }
}
