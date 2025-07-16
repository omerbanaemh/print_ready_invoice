import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/domin/repos/product_repo.dart';

class DuplicateProductUseCase {
  final ProductRepo productRepo;
  DuplicateProductUseCase(this.productRepo);

  Future<Either<Failure, Unit>> call(int index) async {
    return await productRepo.duplicateProduct(index);
  }
}