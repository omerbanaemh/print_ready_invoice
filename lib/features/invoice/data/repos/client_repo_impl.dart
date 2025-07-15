import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/utils/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';
import 'package:print_ready_invoice/features/invoice/domin/repos/clinet_repo.dart';

class ClientRepoImpl extends ClinetRepo {
  @override
  Future<Either<Failure, ClientEntity>> fetchClientDetails() {
    // TODO: implement fetchClientDetails
    throw UnimplementedError();
  }
}