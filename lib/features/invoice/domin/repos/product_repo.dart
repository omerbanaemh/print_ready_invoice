import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';

abstract class ProductRepo {
  Future< Either<Failure,List<ProductEntity>>> fetchProducts();
  Future< Either<Failure,Unit>> addProduct();
  Future< Either<Failure,Unit>> updateProduct(int index, String? productName, int? quantity);
  Future< Either<Failure,Unit>> deleteProduct(int index);

} 