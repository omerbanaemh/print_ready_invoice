part of 'clinet_cubit.dart';

@immutable
sealed class ClientState {}

final class ClinetInitial extends ClientState {}

final class ClinetFailure extends ClientState {
  final String errMessage;

  ClinetFailure(this.errMessage);
}

final class ClientLoadied extends ClientState {
  final ClientEntity client;
  
  ClientLoadied({required this.client});
}
