import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';

abstract class ProductRepo {
  Future< Either<Failure,List<ProductEntity>>> fetchProducts();
  Future< Either<Failure,ProductEntity>> addProduct(ProductEntity productEntity);

} 