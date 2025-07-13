// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:print_ready_invoice/features/invoice/models/product_model.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceInitial());
  final List<ProductModel> newList = [];
  final List<ProductModel> products = [
    ProductModel(
      prodactName: 'UI/UX Design Package',
      quantity: 1,
      unitPrice: 58,
    ),
    ProductModel(
      prodactName: 'Cloud Hosting (Annual)',
      quantity: 1,
      unitPrice: 94,
    ),
    ProductModel(
      prodactName: 'Support & Maintenance',
      quantity: 1,
      unitPrice: 55,
    ),
    ProductModel(
      prodactName: 'Custom Plugin Development',
      quantity: 1,
      unitPrice: 67,
    ),
  ];
  final List<String> pro = [
    'UI/UX Design Package',
    'Cloud Hosting (Annual)',
    'Support & Maintenance',
    'Custom Plugin Development',
  ];

  void addItem() {
    newList.add(
      ProductModel(
        prodactName: '',
        quantity: 1,
        unitPrice: 0,
      ),
    );
    emit(InvoiceLoaded());
    _updateTotals(newList);
  }

  void removeItem(int index) {
    newList.removeAt(index);
    emit(InvoiceLoaded());
    _updateTotals(newList);
  }

  void duplicateItem(int index) {
    newList.add(
      ProductModel(
        prodactName: newList[index].prodactName,
        quantity: newList[index].quantity,
        unitPrice: newList[index].unitPrice,
      ),
    );
    emit(InvoiceLoaded());
    _updateTotals(newList);
  }


  void updateProduct(int index, String productName) {
    final matchedProduct = products.firstWhere(
      (p) => p.prodactName == productName,
      orElse: () => ProductModel(
        prodactName: 'Select Product...',
        quantity: 0,
        unitPrice: 0,
      ),
    );

    newList[index] = matchedProduct; 
    emit(InvoiceLoaded());
    _updateTotals(newList);
  }

  void updateQuantity(int index, int quantity) {
    newList[index].quantity = quantity;
    emit(InvoiceLoaded());
    _updateTotals(newList);
  }

  double subtotal = 0;
  double tax = 0;
  double total = 0;

  void _updateTotals(List<ProductModel> items) {
    subtotal = items.fold(
      0,
      (sum, item) => sum + item.quantity * item.unitPrice,
    );
    tax = subtotal * 0.08;
    total = subtotal + tax;
  }
}
