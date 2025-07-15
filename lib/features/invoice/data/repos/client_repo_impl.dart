import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/data/data_sources/client_local_data_source.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';
import 'package:print_ready_invoice/features/invoice/domin/repos/clinet_repo.dart';

class ClientRepoImpl extends ClinetRepo {
  final ClientLocalDataSource clientLocalDataSource;

  ClientRepoImpl({required this.clientLocalDataSource});
  @override
  Future<Either<Failure, ClientEntity>> fetchClientDetails() async {
    try {
      final ClientEntity? clientDetails = clientLocalDataSource
          .fetchClientDetails();
      if (clientDetails == null) {
        return left(ServerFailure('No local data found'));
      }
      return right(clientDetails);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
