import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';
import 'package:print_ready_invoice/features/invoice/domin/repos/clinet_repo.dart';

class FetchClientDetailsUseCase {
  final ClinetRepo clientRepo;

  FetchClientDetailsUseCase({required this.clientRepo});

  Future<Either<Failure, ClientEntity>> call() async {
    return await clientRepo.fetchClientDetails();
  }
}
