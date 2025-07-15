import 'package:print_ready_invoice/features/invoice/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> fetchProducts();
  Future<void> addProduct();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final List<ProductModel> products = [];

  @override
  Future<List<ProductModel>> fetchProducts() async {
    return Future.value(products);
  }
  
  @override
  Future<void> addProduct() {
    products.add(ProductModel(prodactName: '', quantity: 1, unitPrice: 0.0));
    return Future.value();
  }
}
