import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/domin/entities/product_entity.dart';
import 'package:print_ready_invoice/features/invoice/domin/repos/product_repo.dart';

class AddProductUseCase {
  final ProductRepo productRepo;
  AddProductUseCase(this.productRepo);

  Future<Either<Failure, Unit>> call() async{
    return await productRepo.addProduct();
  }
}
