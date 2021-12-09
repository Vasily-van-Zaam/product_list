import 'package:dartz/dartz.dart';
import 'package:product_list/core/error.dart';
import '../../domain/entities/tooltip_entity.dart';

abstract class TooltipRepository {
  Future<Either<Failure, List<TooltipEntity>>> getList(
      {String? search, int? limit});
  Future<Either<Failure, bool>> delete(TooltipEntity entity);
  Future<Either<Failure, bool>> create(TooltipEntity entity);
}
