import 'package:product_list/core/failure.dart';
import 'package:product_list/feature/data/datasources/datasources.dart';
import 'package:product_list/feature/data/models/models.dart';
import 'package:product_list/feature/domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:product_list/feature/domain/repositories/repositories.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductLocalStorageDataSource productLocalStorageDataSource;

  ProductRepositoryImpl(this.productLocalStorageDataSource);
  @override
  Future<Either<Failure, ProductEntity>> change(ProductEntity entity) async {
    try {
      ProductModel model = ProductModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        isDone: entity.isDone,
        price: entity.price,
        quantity: entity.quantity,
        quantityType: entity.quantityType,
      );
      var change = await productLocalStorageDataSource.change(model);
      return Right(change.toEntity());
    } on Failure catch (err) {
      return Left(err);
    } catch (err) {
      return Left(FailureResponse('SOME ERROR $err', 500));
    }
  }

  @override
  Future<Either<Failure, bool>> cleanData() async {
    try {
      var clean = await productLocalStorageDataSource.cleanData();
      return Right(clean);
    } on Failure catch (err) {
      return Left(err);
    } catch (err) {
      return const Left(FailureResponse('SOME ERROR', 500));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> create(ProductEntity entity) async {
    try {
      ProductModel model = ProductModel(
        id: entity.id,
        name: entity.name,
        description: entity.description,
        isDone: entity.isDone,
        price: entity.price,
        quantity: entity.quantity,
        quantityType: entity.quantityType,
      );
      var create = await productLocalStorageDataSource.create(model);
      return Right(create.toEntity());
    } on Failure catch (err) {
      return Left(err);
    } catch (err) {
      return const Left(FailureResponse('SOME ERROR', 500));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteAllProducts() async {
    try {
      var deleteAllProducts =
          await productLocalStorageDataSource.delleteAllProducts();
      return Right(deleteAllProducts);
    } on Failure catch (err) {
      return Left(err);
    } catch (err) {
      return const Left(FailureResponse('SOME ERROR', 500));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getList() async {
    try {
      var list = await productLocalStorageDataSource.getList();
      return Right(
        list.map((m) => m.toEntity()).toList(),
      );
    } on Failure catch (err) {
      return Left(err);
    } catch (err) {
      return const Left(FailureResponse('SOME ERROR', 500));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> delete(ProductEntity entity) async {
    try {
      var delete = await productLocalStorageDataSource
          .delete(ProductModel(id: entity.id));
      return Right(delete.toEntity());
    } on Failure catch (err) {
      return Left(err);
    } catch (err) {
      return const Left(FailureResponse('SOME ERROR', 500));
    }
  }
}
