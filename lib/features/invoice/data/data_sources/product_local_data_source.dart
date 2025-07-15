import 'package:print_ready_invoice/features/invoice/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> fetchProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final List<ProductModel> products = [];

  @override
  Future<List<ProductModel>> fetchProducts() async {
    return Future.value(products);
  }
}
