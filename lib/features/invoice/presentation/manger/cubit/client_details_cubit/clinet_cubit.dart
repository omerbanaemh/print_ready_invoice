// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/client_entity.dart';
import 'package:print_ready_invoice/features/invoice/domin/use_cases/fetch_client_details_use_case.dart';

part 'clinet_state.dart';

class ClientCubit extends Cubit<ClientState> {
  ClientCubit(this.fetchClientDetailsUseCase) : super(ClinetInitial());

  final FetchClientDetailsUseCase fetchClientDetailsUseCase;

  Future<void> fetchClientDetails() async {
    var result = await fetchClientDetailsUseCase.call();

    result.fold(
      (failure) {
        emit(ClinetFailure(failure.message));
      },
      (client) {
        emit(ClientLoadied(client: client));
      },
    );
  }

}
