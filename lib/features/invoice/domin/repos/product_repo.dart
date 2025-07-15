import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';

abstract class ProductRepo {
  Future<List<ProductEntity>> fetchProducts();
  
} 