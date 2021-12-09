import 'package:dartz/dartz.dart';
import 'package:product_list/core/error.dart';
import 'package:product_list/core/use_case.dart';
import 'package:product_list/feature/domain/repositories/product_repository.dart';

class DeleteAll extends UseCase<bool, dynamic> {
  final ProductRepository productRepository;

  DeleteAll(this.productRepository);
  @override
  Future<Either<Failure, bool>> call([params]) {
    return productRepository.deleteAllProducts();
  }
}
