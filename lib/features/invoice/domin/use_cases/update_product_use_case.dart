import 'package:dartz/dartz.dart';
import 'package:print_ready_invoice/core/errors/failure.dart';
import 'package:print_ready_invoice/features/invoice/domin/repos/product_repo.dart';

class UpdateProductUseCase {
  final ProductRepo productRepo;

  UpdateProductUseCase({required this.productRepo});


  Future<Either<Failure, Unit>> call(String? productName, int? quantity) async {
    return productRepo.updateProduct(productName, quantity);
  }
  
}