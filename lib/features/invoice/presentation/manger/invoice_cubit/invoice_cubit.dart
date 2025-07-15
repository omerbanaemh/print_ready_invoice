// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';
import 'package:print_ready_invoice/features/invoice/domin/use_cases/fetch_products_use_case.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  final FetchProductsUseCase fetchProductsUseCase;
  InvoiceCubit(this.fetchProductsUseCase) : super(InvoiceInitial());
  final List<ProductEntity> newList = [];
  final List<ProductEntity> products = [
    ProductEntity(
      prodactName: 'UI/UX Design Package',
      quantity: 1,
      unitPrice: 58,
    ),
    ProductEntity(
      prodactName: 'Cloud Hosting (Annual)',
      quantity: 1,
      unitPrice: 94,
    ),
    ProductEntity(
      prodactName: 'Support & Maintenance',
      quantity: 1,
      unitPrice: 55,
    ),
    ProductEntity(
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

  Future<void> fetchProducts() async {
    emit(InvoiceLoading());
    final result = await fetchProductsUseCase.call();
    result.fold(
      (failure) => emit(InvoiceFailure(errorMessage: failure.message)),
      (products) => emit(InvoiceLoaded(products: products)),
    );
  }


  void addItem() {
    newList.add(
      ProductEntity(
        prodactName: '',
        quantity: 1,
        unitPrice: 0,
      ),
    );
    emit(InvoiceLoaded(products: newList));
    _updateTotals(newList);
  }

  void removeItem(int index) {
    newList.removeAt(index);
    emit(InvoiceLoaded(products: newList));
    _updateTotals(newList);
  }

  void duplicateItem(int index) {
    newList.add(
      ProductEntity(
        prodactName: newList[index].prodactName,
        quantity: newList[index].quantity,
        unitPrice: newList[index].unitPrice,
      ),
    );
    emit(InvoiceLoaded(products: newList));
    _updateTotals(newList);
  }


  void updateProduct(int index, String productName) {
    final matchedProduct = products.firstWhere(
      (p) => p.prodactName == productName,
      orElse: () => ProductEntity(
        prodactName: 'Select Product...',
        quantity: 0,
        unitPrice: 0,
      ),
    );

    newList[index] = matchedProduct; 
    emit(InvoiceLoaded(products: newList));
    _updateTotals(newList);
  }

  void updateQuantity(int index, int quantity) {
    newList[index].quantity = quantity;
    emit(InvoiceLoaded(products: newList));
    _updateTotals(newList);
  }

  double subtotal = 0;
  double tax = 0;
  double total = 0;

  void _updateTotals(List<ProductEntity> items) {
    subtotal = items.fold(
      0,
      (sum, item) => sum + item.quantity * item.unitPrice,
    );
    tax = subtotal * 0.08;
    total = subtotal + tax;
  }
}
