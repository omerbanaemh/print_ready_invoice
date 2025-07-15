import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/data/data_sources/product_local_data_source.dart';
import 'package:print_ready_invoice/features/invoice/data/models/product_model.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';
import 'package:print_ready_invoice/features/invoice/domin/repos/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductLocalDataSource productLocalDataSource;

  ProductRepoImpl({required this.productLocalDataSource});
  @override
  Future<Either<Failure, List<ProductEntity>>> fetchProducts() async{
    try{
      final List<ProductModel> products = await productLocalDataSource.fetchProducts();
      return Right(products.map((e) => e.toProductEntity()).toList());
    }catch(e){
      return Left(ServerFailure(e.toString()));
    }
  }
}
