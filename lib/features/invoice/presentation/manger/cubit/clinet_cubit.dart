// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:print_ready_invoice/features/invoice/models/clinet_model.dart';

part 'clinet_state.dart';

class ClinetCubit extends Cubit<ClinetState> {
  ClinetCubit() : super(ClinetInitial());

  String clinetName = 'Global Corp';
  String address = '123 Street Name, City, 12345';
  String email = 'contact@gmail.com';

  void updateClinet(ClinetModel clinet) {
    clinetName = clinet.name ?? clinetName;
    address = clinet.address ?? address;
    email = clinet.email ?? email;
    emit(ClinetInitial());
  }
}
