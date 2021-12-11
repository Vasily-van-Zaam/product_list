import 'package:dartz/dartz.dart';
import 'package:product_list/core/failure.dart';
import 'package:product_list/core/use_case.dart';
import 'package:product_list/feature/domain/entities/product_entity.dart';
import 'package:product_list/feature/domain/repositories/product_repository.dart';

class Change extends UseCase<ProductEntity, ProductEntity> {
  final ProductRepository productRepository;

  Change(this.productRepository);
  @override
  Future<Either<Failure, ProductEntity>> call(params) {
    return productRepository.change(params);
  }
}
