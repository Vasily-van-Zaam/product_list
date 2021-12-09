import 'package:dartz/dartz.dart';

import 'package:product_list/core/error.dart';
import 'package:product_list/core/use_case.dart';
import 'package:product_list/feature/domain/repositories/product_repository.dart';

class Delete extends UseCase<bool, dynamic> {
  final ProductRepository productRepository;

  Delete(this.productRepository);
  @override
  Future<Either<Failure, bool>> call([params]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
