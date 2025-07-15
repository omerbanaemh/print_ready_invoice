import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';

abstract class ClinetRepo {
 Future<Either<Failure, ClientEntity>> fetchClientDetails();
 Future<Either<Failure, ClientEntity>> updateClientDetails(ClientEntity client);
}