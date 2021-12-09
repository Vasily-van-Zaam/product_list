import 'package:dartz/dartz.dart';
import 'package:product_list/core/failure.dart';
import 'package:product_list/feature/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getList();
  Future<Either<Failure, bool>> change(ProductEntity entity);
  Future<Either<Failure, ProductEntity>> create(ProductEntity entity);
  Future<Either<Failure, bool>> delete(ProductEntity entity);
  Future<Either<Failure, bool>> deleteAllProducts();
  Future<Either<Failure, bool>> cleanData(); // only for localStorage
}
