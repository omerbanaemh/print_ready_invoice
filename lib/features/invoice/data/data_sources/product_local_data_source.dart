import 'package:print_ready_invoice/features/invoice/data/models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> fetchProducts();
  Future<void> addProduct();
  Future<void> updateProduct(int index, String? productName, int? quantity);
  Future<void> deleteProduct(int index);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final List<ProductModel> products = [];
  final List<ProductModel> sampleProducts = [
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

  @override
  Future<List<ProductModel>> fetchProducts() async {
    return Future.value(products);
  }
  
  @override
  Future<void> addProduct() {
    products.add(ProductModel(prodactName: '', quantity: 1, unitPrice: 0.0));
    return Future.value();
  }

  @override
  Future<void> updateProduct(
    int index,
    String? productName,
    int? quantity,
  ) async {
    if (productName != null) {
      final matchedProduct = sampleProducts.firstWhere(
        (p) => p.prodactName == productName,
        orElse: () => ProductModel(
          prodactName: 'Select Product...',
          quantity: 0,
          unitPrice: 0,
        ),
      );
      products[index].prodactName = matchedProduct.prodactName;
      products[index].quantity = matchedProduct.quantity;
      products[index].unitPrice = matchedProduct.unitPrice;
      return Future.value();
    } else if (quantity != null) {
      products[index].quantity = quantity;
      return Future.value();
    }

    return Future.value();
  }
  
  @override
  Future<void> deleteProduct(int index) {
    products.removeAt(index);
    return Future.value();
  }
}
