import 'package:product_list/feature/data/datasources/datasources.dart';
import 'package:product_list/feature/data/models/tooltip_model.dart';
import 'package:product_list/feature/domain/entities/tooltip_entity.dart';
import 'package:product_list/core/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:product_list/feature/domain/repositories/tooltip_repository.dart';

class TooltipRepositoryImpl implements TooltipRepository {
  final TooltipLocalStorageDataSource tooltipLocalStorageDataSource;

  TooltipRepositoryImpl(this.tooltipLocalStorageDataSource);

  @override
  Future<Either<Failure, TooltipEntity>> create(TooltipEntity entity) async {
    try {
      var model = TooltipModel(
        id: entity.id,
        name: entity.name,
      );
      var create = await tooltipLocalStorageDataSource.create(model);
      return Right(create);
    } on Failure catch (err) {
      return Left(err);
    } catch (err) {
      return const Left(FailureResponse('SOME ERROR', 500));
    }
  }

  @override
  Future<Either<Failure, bool>> delete(TooltipEntity entity) async {
    try {
      var model = TooltipModel(
        id: entity.id,
        name: entity.name,
      );
      var delete = await tooltipLocalStorageDataSource.delete(model);
      return Right(delete);
    } on Failure catch (err) {
      return Left(err);
    } catch (err) {
      return const Left(FailureResponse('SOME ERROR', 500));
    }
  }

  @override
  Future<Either<Failure, List<TooltipEntity>>> getList(
      {String? search, int? limit}) async {
    try {
      var getList = await tooltipLocalStorageDataSource.getList(
          search: search, limit: limit);
      return Right(getList);
    } on Failure catch (err) {
      return Left(err);
    } catch (err) {
      return const Left(FailureResponse('SOME ERROR', 500));
    }
  }
}
