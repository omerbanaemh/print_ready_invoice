part of 'invoice_cubit.dart';

@immutable
sealed class InvoiceState {}

final class InvoiceInitial extends InvoiceState {}

final class InvoiceLoading extends InvoiceState {}

final class InvoiceFailure extends InvoiceState {
  final String errorMessage;
  InvoiceFailure({required this.errorMessage});
}

final class InvoiceLoaded extends InvoiceState {
  final List<ProductEntity> products;
  InvoiceLoaded({required this.products});
}