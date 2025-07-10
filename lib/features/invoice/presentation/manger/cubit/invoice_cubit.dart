import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:print_ready_invoice/features/invoice/models/product_model.dart';

part 'invoice_state.dart';

class InvoiceCubit extends Cubit<InvoiceState> {
  InvoiceCubit() : super(InvoiceInitial());
  final List<ProductModel> newList = [];
  final List<ProductModel> products = [
    ProductModel(prodactName: 'Select Product...',quantity: 0, unitPrice: 0),
    ProductModel(prodactName: 'UI/UX Design Package',quantity: 0, unitPrice: 58),
    ProductModel(prodactName: 'Cloud Hosting (Annual)',quantity: 0, unitPrice: 94),
    ProductModel(prodactName: 'Support & Maintenance',quantity: 0, unitPrice: 55),
    ProductModel(prodactName: 'Custom Plugin Development',quantity: 0, unitPrice: 67),
  ];

  void loadInitial() {
    emit(InvoiceLoaded([]));
    _updateTotals([]);
  }

  void addItem() {
        newList.add(ProductModel(prodactName:'Select Product...',quantity: 1, unitPrice: 0));
      emit(InvoiceLoaded(newList));
      _updateTotals(newList);
  }

  void removeItem(int index) {
      newList.removeAt(index);
      emit(InvoiceLoaded(newList));
      _updateTotals(newList);
  }


  void duplicateItem(int index) {
    print('Duplicating item at index: $index    ggggg= ${newList[index].prodactName} ');
      newList.add(ProductModel(
        prodactName: newList[index].prodactName,
        quantity: newList[index].quantity,
        unitPrice: newList[index].unitPrice,
      ));
      emit(InvoiceLoaded(newList));
      _updateTotals(newList);
  }

  void updateProduct(int index, ProductModel product) {
      newList[index].prodactName = product.prodactName;
      newList[index].unitPrice = product.unitPrice.toDouble();
      emit(InvoiceLoaded(newList));
      newList.forEach((element) => print('Updated product: ${element.prodactName}, Price: ${element.unitPrice}, quantity: ${element.quantity}'),);
      _updateTotals(newList);
  }

  void updateQuantity(int index, int quantity) {
      newList[index].quantity = quantity;
      emit(InvoiceLoaded(newList));
      _updateTotals(newList);
  }

  double subtotal = 0;
  double tax = 0;
  double total = 0;
  
  void _updateTotals(List<ProductModel> items) {
    subtotal = items.fold(0, (sum, item) => sum + item.quantity * item.unitPrice);
    tax = subtotal * 0.08;
    total = subtotal + tax;
  }
}
