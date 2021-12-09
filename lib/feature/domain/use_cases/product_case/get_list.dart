import 'package:dartz/dartz.dart';

import 'package:product_list/core/failure.dart';
import 'package:product_list/core/use_case.dart';
import 'package:product_list/feature/domain/entities/product_entity.dart';
import 'package:product_list/feature/domain/repositories/product_repository.dart';

class GetList extends UseCase<List<ProductEntity>, dynamic> {
  final ProductRepository productRepository;

  GetList(this.productRepository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call([params]) {
    return productRepository.getList();
  }
}
